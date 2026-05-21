package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Реестр: правила Lua-тегов → типы обработчиков → шаблоны function extern.
 */
public final class HandlerMappingRegistry {

    private final Map<String, List<HandlerTypeMapping.HandlerTemplateRule>> handlerTypes;
    private final Map<String, List<String>> handlerTypeBundles;
    private final List<LuaMappingRule> luaMappings;
    private final LuaTagOverrides tagOverrides;

    public HandlerMappingRegistry(
            Map<String, List<HandlerTypeMapping.HandlerTemplateRule>> handlerTypes,
            Map<String, List<String>> handlerTypeBundles,
            List<LuaMappingRule> luaMappings,
            LuaTagOverrides tagOverrides) {
        this.handlerTypes = handlerTypes != null ? Map.copyOf(handlerTypes) : Map.of();
        this.handlerTypeBundles = handlerTypeBundles != null ? Map.copyOf(handlerTypeBundles) : Map.of();
        this.luaMappings = luaMappings != null ? List.copyOf(luaMappings) : List.of();
        this.tagOverrides = tagOverrides != null ? tagOverrides : LuaTagOverrides.empty();
    }

    public Map<String, List<HandlerTypeMapping.HandlerTemplateRule>> handlerTypes() {
        return handlerTypes;
    }

    public List<LuaMappingRule> luaMappings() {
        return luaMappings;
    }

    public LuaTagOverrides tagOverrides() {
        return tagOverrides;
    }

    public record LuaMappingRule(
            Pattern tagIdRegex,
            List<String> typeIds,
            Map<String, String> defaultPlaceholders) {
    }

    public static HandlerMappingRegistry fromConfig(HandlerTypeMapping.Config config) {
        return fromConfig(config, LuaTagOverrides.empty());
    }

    public static HandlerMappingRegistry fromConfig(
            HandlerTypeMapping.Config config,
            LuaTagOverrides overrides) {
        Map<String, List<HandlerTypeMapping.HandlerTemplateRule>> types = new LinkedHashMap<>();
        Map<String, List<String>> bundles = new LinkedHashMap<>();
        List<LuaMappingRule> luaRules = new ArrayList<>();

        if (config.getHandlerTypes() != null) {
            for (var e : config.getHandlerTypes().entrySet()) {
                types.put(e.getKey(), toRules(e.getValue()));
            }
        }
        if (config.getHandlerTypeBundles() != null) {
            for (var e : config.getHandlerTypeBundles().entrySet()) {
                if (e.getValue() != null && e.getValue().getPatterns() != null) {
                    bundles.put(e.getKey(), List.copyOf(e.getValue().getPatterns()));
                }
            }
        }
        if (config.getLuaMappings() != null) {
            for (HandlerTypeMapping.LuaMappingEntry entry : config.getLuaMappings()) {
                if (entry.getTagIdRegex() == null || entry.getTypes() == null) {
                    continue;
                }
                luaRules.add(new LuaMappingRule(
                        Pattern.compile(entry.getTagIdRegex()),
                        List.copyOf(entry.getTypes()),
                        entry.getDefaultPlaceholders() != null
                                ? Map.copyOf(entry.getDefaultPlaceholders())
                                : Map.of()));
            }
        }
        if (config.getTypes() != null) {
            for (HandlerTypeMapping.TypeEntry legacy : config.getTypes()) {
                if (legacy.getId() == null || legacy.getTagIdRegex() == null) {
                    continue;
                }
                types.putIfAbsent(legacy.getId(), toRules(legacy.getHandlers()));
                luaRules.add(new LuaMappingRule(
                        Pattern.compile(legacy.getTagIdRegex()),
                        List.of(legacy.getId()),
                        Map.of()));
            }
        }
        return new HandlerMappingRegistry(types, bundles, luaRules, overrides);
    }

    private static List<HandlerTypeMapping.HandlerTemplateRule> toRules(
            List<HandlerTypeMapping.HandlerEntry> entries) {
        if (entries == null) {
            return List.of();
        }
        List<HandlerTypeMapping.HandlerTemplateRule> rules = new ArrayList<>();
        for (HandlerTypeMapping.HandlerEntry h : entries) {
            if (h.getCanonical() != null && h.getNamePattern() != null) {
                rules.add(new HandlerTypeMapping.HandlerTemplateRule(h.getCanonical(), h.getNamePattern()));
            }
        }
        return rules;
    }

    public record PlanResult(
            List<MonitorHandler> handlers,
            Set<String> matchedTags,
            Set<String> matchedNoHandlers,
            Set<String> unmatchedTags) {
    }

    public PlanResult planHandlers(
            HandlerTemplateCatalog catalog,
            Set<String> newTagIds,
            Set<String> existingHandlerNames) {
        Set<String> targetNames = new LinkedHashSet<>();
        Set<String> matched = new LinkedHashSet<>();
        Set<String> matchedNoHandlers = new LinkedHashSet<>();
        Set<String> unmatched = new LinkedHashSet<>();

        for (String tagId : newTagIds) {
            if (tagOverrides.hasOverride(tagId)) {
                List<String> typeIds = tagOverrides.typeIdsFor(tagId);
                boolean added = resolveTypeIds(catalog, typeIds, Map.of(), targetNames, existingHandlerNames);
                matched.add(tagId);
                if (!added) {
                    matchedNoHandlers.add(tagId);
                }
                continue;
            }

            boolean anyMatch = false;
            boolean anyHandler = false;
            for (LuaMappingRule luaRule : luaMappings) {
                Matcher m = luaRule.tagIdRegex().matcher(tagId);
                if (!m.find()) {
                    continue;
                }
                anyMatch = true;
                Map<String, String> placeholders = extractPlaceholders(m);
                mergeDefaults(placeholders, luaRule.defaultPlaceholders());
                if (resolveTypeIds(catalog, luaRule.typeIds(), placeholders, targetNames, existingHandlerNames)) {
                    anyHandler = true;
                }
            }
            if (anyMatch) {
                matched.add(tagId);
                if (!anyHandler) {
                    matchedNoHandlers.add(tagId);
                }
            } else {
                unmatched.add(tagId);
            }
        }

        List<MonitorHandler> handlers = new ArrayList<>();
        for (String targetName : targetNames) {
            HandlerTemplateResolver.resolve(catalog, targetName).ifPresent(handlers::add);
        }
        return new PlanResult(handlers, matched, matchedNoHandlers, unmatched);
    }

    private boolean resolveTypeIds(
            HandlerTemplateCatalog catalog,
            List<String> typeIds,
            Map<String, String> placeholders,
            Set<String> targetNames,
            Set<String> existingHandlerNames) {
        if (typeIds == null || typeIds.isEmpty()) {
            return false;
        }
        boolean any = false;
        for (String typeId : typeIds) {
            if (handlerTypeBundles.containsKey(typeId)) {
                for (String pattern : handlerTypeBundles.get(typeId)) {
                    for (String name : catalog.findNamesMatchingPattern(pattern, placeholders)) {
                        if (!existingHandlerNames.contains(name)) {
                            targetNames.add(name);
                            any = true;
                        }
                    }
                }
                continue;
            }
            List<HandlerTypeMapping.HandlerTemplateRule> rules = handlerTypes.get(typeId);
            if (rules == null) {
                continue;
            }
            for (HandlerTypeMapping.HandlerTemplateRule rule : rules) {
                String handlerName = applyPlaceholders(rule.namePattern(), placeholders);
                if (!existingHandlerNames.contains(handlerName)) {
                    targetNames.add(handlerName);
                    any = true;
                }
            }
        }
        return any;
    }

    private static void mergeDefaults(Map<String, String> placeholders, Map<String, String> defaults) {
        if (defaults == null) {
            return;
        }
        for (var e : defaults.entrySet()) {
            placeholders.putIfAbsent(e.getKey(), formatPlaceholder(e.getKey(), e.getValue()));
        }
    }

    static Map<String, String> extractPlaceholders(Matcher m) {
        Map<String, String> map = new LinkedHashMap<>();
        for (String name : List.of("line", "li", "mode", "param", "t")) {
            try {
                String raw = m.group(name);
                if (raw != null) {
                    map.put(name, formatPlaceholder(name, raw));
                }
            } catch (IllegalArgumentException ignored) {
                // группа отсутствует в этом regex
            }
        }
        if (map.isEmpty() && m.groupCount() >= 1) {
            for (int i = 1; i <= m.groupCount(); i++) {
                String g = m.group(i);
                if (g != null) {
                    String key = i == 1 ? "line" : "g" + i;
                    map.put(key, formatPlaceholder(key, g));
                }
            }
        }
        return map;
    }

    static String formatPlaceholder(String name, String raw) {
        if (name.equals("line") || name.equals("li") || name.equals("mode") || name.equals("param")
                || name.equals("t")) {
            try {
                return String.format("%02d", Integer.parseInt(raw));
            } catch (NumberFormatException e) {
                return raw;
            }
        }
        return raw;
    }

    static String applyPlaceholders(String pattern, Map<String, String> placeholders) {
        String result = pattern;
        for (var e : placeholders.entrySet()) {
            result = result.replace("{" + e.getKey() + "}", e.getValue());
        }
        return result;
    }
}
