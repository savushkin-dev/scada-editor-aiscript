package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.util.List;
import java.util.Set;

/**
 * Планирует обработчики для новых тегов по type-mapping и каталогу scripts.txt.
 */
public final class HandlerAssignmentPlanner {

    private final HandlerTemplateCatalog catalog;
    private final HandlerMappingRegistry registry;

    public HandlerAssignmentPlanner(HandlerTemplateCatalog catalog, HandlerMappingRegistry registry) {
        this.catalog = catalog;
        this.registry = registry;
    }

    public HandlerMappingRegistry.PlanResult planWithRegistry(Set<String> newTagIds, Set<String> existingHandlerNames) {
        return registry.planHandlers(catalog, newTagIds, existingHandlerNames);
    }

    public List<MonitorHandler> planHandlersForNewTags(
            Set<String> newTagIds,
            Set<String> existingHandlerNames) {
        return registry.planHandlers(catalog, newTagIds, existingHandlerNames).handlers();
    }
}
