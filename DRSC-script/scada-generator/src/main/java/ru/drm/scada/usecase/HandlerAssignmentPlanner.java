package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;

/**
 * Планирует обработчики для новых тегов по type-mapping и каталогу scripts.txt.
 */
public final class HandlerAssignmentPlanner {

    private final HandlerTemplateCatalog catalog;
    private final HandlerMappingRegistry registry;
    private final List<HandlerTypeMapping> legacyMappings;

    public HandlerAssignmentPlanner(HandlerTemplateCatalog catalog, HandlerMappingRegistry registry) {
        this.catalog = catalog;
        this.registry = registry;
        this.legacyMappings = List.of();
    }

    /** @deprecated используйте {@link #HandlerAssignmentPlanner(HandlerTemplateCatalog, HandlerMappingRegistry)} */
    public HandlerAssignmentPlanner(HandlerTemplateCatalog catalog, List<HandlerTypeMapping> mappings) {
        this.catalog = catalog;
        this.registry = null;
        this.legacyMappings = mappings != null ? mappings : List.of();
    }

    public HandlerMappingRegistry.PlanResult planWithRegistry(Set<String> newTagIds, Set<String> existingHandlerNames) {
        if (registry != null) {
            return registry.planHandlers(catalog, newTagIds, existingHandlerNames);
        }
        List<MonitorHandler> handlers = planHandlersForNewTags(newTagIds, existingHandlerNames);
        return new HandlerMappingRegistry.PlanResult(handlers, newTagIds, Set.of(), Set.of());
    }

    public List<MonitorHandler> planHandlersForNewTags(
            Set<String> newTagIds,
            Set<String> existingHandlerNames) {
        if (registry != null) {
            return registry.planHandlers(catalog, newTagIds, existingHandlerNames).handlers();
        }
        Set<String> targetNames = new LinkedHashSet<>();
        for (String tagId : newTagIds) {
            for (HandlerTypeMapping mapping : legacyMappings) {
                Matcher m = mapping.getTagIdRegex().matcher(tagId);
                if (!m.find()) {
                    continue;
                }
                String line = m.group(1);
                for (HandlerTypeMapping.HandlerTemplateRule rule : mapping.getHandlers()) {
                    String handlerName = rule.namePattern().replace("{line}", line);
                    if (!existingHandlerNames.contains(handlerName)) {
                        targetNames.add(handlerName);
                    }
                }
            }
        }
        List<MonitorHandler> result = new ArrayList<>();
        for (String targetName : targetNames) {
            HandlerTemplateResolver.resolve(catalog, targetName).ifPresent(result::add);
        }
        return result;
    }
}
