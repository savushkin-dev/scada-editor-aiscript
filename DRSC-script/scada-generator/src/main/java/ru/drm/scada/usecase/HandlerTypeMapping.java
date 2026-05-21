package ru.drm.scada.usecase;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Правило: тег Lua → набор шаблонов обработчиков Monitor.
 */
public final class HandlerTypeMapping {

    private final String id;
    private final Pattern tagIdRegex;
    private final List<HandlerTemplateRule> handlers;

    public HandlerTypeMapping(String id, Pattern tagIdRegex, List<HandlerTemplateRule> handlers) {
        this.id = id;
        this.tagIdRegex = tagIdRegex;
        this.handlers = handlers != null ? List.copyOf(handlers) : List.of();
    }

    public String getId() {
        return id;
    }

    public Pattern getTagIdRegex() {
        return tagIdRegex;
    }

    public List<HandlerTemplateRule> getHandlers() {
        return handlers;
    }

    public record HandlerTemplateRule(String canonical, String namePattern) {
    }

    public static final class Config {
        private List<TypeEntry> types = new ArrayList<>();
        private Map<String, List<HandlerEntry>> handlerTypes = new LinkedHashMap<>();
        private Map<String, BundleEntry> handlerTypeBundles = new LinkedHashMap<>();
        private List<LuaMappingEntry> luaMappings = new ArrayList<>();

        public List<TypeEntry> getTypes() {
            return types;
        }

        public void setTypes(List<TypeEntry> types) {
            this.types = types != null ? types : new ArrayList<>();
        }

        public Map<String, List<HandlerEntry>> getHandlerTypes() {
            return handlerTypes;
        }

        public void setHandlerTypes(Map<String, List<HandlerEntry>> handlerTypes) {
            this.handlerTypes = handlerTypes != null ? handlerTypes : new LinkedHashMap<>();
        }

        public List<LuaMappingEntry> getLuaMappings() {
            return luaMappings;
        }

        public void setLuaMappings(List<LuaMappingEntry> luaMappings) {
            this.luaMappings = luaMappings != null ? luaMappings : new ArrayList<>();
        }

        public Map<String, BundleEntry> getHandlerTypeBundles() {
            return handlerTypeBundles;
        }

        public void setHandlerTypeBundles(Map<String, BundleEntry> handlerTypeBundles) {
            this.handlerTypeBundles = handlerTypeBundles != null ? handlerTypeBundles : new LinkedHashMap<>();
        }
    }

    public static final class BundleEntry {
        private List<String> patterns = new ArrayList<>();

        public List<String> getPatterns() {
            return patterns;
        }

        public void setPatterns(List<String> patterns) {
            this.patterns = patterns != null ? patterns : new ArrayList<>();
        }
    }

    public static final class LuaMappingEntry {
        private String tagIdRegex;
        private List<String> types = new ArrayList<>();
        private Map<String, String> defaultPlaceholders = new LinkedHashMap<>();

        public String getTagIdRegex() {
            return tagIdRegex;
        }

        public void setTagIdRegex(String tagIdRegex) {
            this.tagIdRegex = tagIdRegex;
        }

        public List<String> getTypes() {
            return types;
        }

        public void setTypes(List<String> types) {
            this.types = types != null ? types : new ArrayList<>();
        }

        public Map<String, String> getDefaultPlaceholders() {
            return defaultPlaceholders;
        }

        public void setDefaultPlaceholders(Map<String, String> defaultPlaceholders) {
            this.defaultPlaceholders = defaultPlaceholders != null ? defaultPlaceholders : new LinkedHashMap<>();
        }
    }

    public static final class TypeEntry {
        private String id;
        private String tagIdRegex;
        private List<HandlerEntry> handlers = new ArrayList<>();

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getTagIdRegex() {
            return tagIdRegex;
        }

        public void setTagIdRegex(String tagIdRegex) {
            this.tagIdRegex = tagIdRegex;
        }

        public List<HandlerEntry> getHandlers() {
            return handlers;
        }

        public void setHandlers(List<HandlerEntry> handlers) {
            this.handlers = handlers != null ? handlers : new ArrayList<>();
        }
    }

    public static final class HandlerEntry {
        private String canonical;
        private String namePattern;

        public String getCanonical() {
            return canonical;
        }

        public void setCanonical(String canonical) {
            this.canonical = canonical;
        }

        public String getNamePattern() {
            return namePattern;
        }

        public void setNamePattern(String namePattern) {
            this.namePattern = namePattern;
        }
    }

    public static List<HandlerTypeMapping> fromConfig(Config config) {
        if (config == null || config.getTypes() == null) {
            return List.of();
        }
        List<HandlerTypeMapping> result = new ArrayList<>();
        for (TypeEntry entry : config.getTypes()) {
            if (entry.getTagIdRegex() == null || entry.getHandlers() == null) {
                continue;
            }
            List<HandlerTemplateRule> rules = new ArrayList<>();
            for (HandlerEntry h : entry.getHandlers()) {
                if (h.getCanonical() != null && h.getNamePattern() != null) {
                    rules.add(new HandlerTemplateRule(h.getCanonical(), h.getNamePattern()));
                }
            }
            result.add(new HandlerTypeMapping(
                    entry.getId(),
                    Pattern.compile(entry.getTagIdRegex()),
                    rules));
        }
        return Collections.unmodifiableList(result);
    }
}
