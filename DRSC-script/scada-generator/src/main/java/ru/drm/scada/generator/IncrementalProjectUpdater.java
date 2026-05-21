package ru.drm.scada.generator;

import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.MonitorHandler;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.usecase.DeltaUpdateContext;
import ru.drm.scada.usecase.DeltaUpdateException;
import ru.drm.scada.usecase.DeltaUpdateReport;
import ru.drm.scada.usecase.DeltaUpdater;
import ru.drm.scada.usecase.HandlerAssignmentPlanner;
import ru.drm.scada.usecase.HandlerMappingRegistry;
import ru.drm.scada.usecase.HandlerTemplateCatalog;
import ru.drm.scada.usecase.HandlerTypeMappingLoader;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.Set;

/**
 * Инкрементальное обновление Units.xml и (опционально) Units.script.
 */
public class IncrementalProjectUpdater implements DeltaUpdater {

    private final IncrementalUnitsUpdater unitsUpdater;
    private final IncrementalUnitsScriptUpdater scriptUpdater;

    public IncrementalProjectUpdater(MonitorUnitsGenerator generator) {
        this.unitsUpdater = new IncrementalUnitsUpdater(generator);
        this.scriptUpdater = new IncrementalUnitsScriptUpdater();
    }

    @Override
    public void update(ProjectModel newModel, Path existingProjectDir, Path metadataStore)
            throws DeltaUpdateException {
        update(newModel, existingProjectDir, DeltaUpdateContext.of(metadataStore));
    }

    public DeltaUpdateReport update(ProjectModel newModel, Path existingProjectDir, DeltaUpdateContext context)
            throws DeltaUpdateException {
        DeltaUpdateReport report = new DeltaUpdateReport();
        try {
            Set<String> allTags = collectUnitNamesFromModel(newModel);
            Set<String> existingUnits = readExistingUnitsSafe(existingProjectDir);
            Set<String> newTagIds = new HashSet<>(allTags);
            newTagIds.removeAll(existingUnits);

            for (String u : newTagIds) {
                report.addUnit(u);
            }
            for (String u : existingUnits) {
                if (allTags.contains(u)) {
                    report.skipUnit(u);
                }
            }

            unitsUpdater.update(newModel, existingProjectDir, context.metadataStore());

            if (context.handlersCatalogSource() != null && !newTagIds.isEmpty()) {
                appendScriptsForNewTags(existingProjectDir, context, newTagIds, report);
            }

            if (context.generateMapsStub()) {
                MapsXmlStubGenerator.ensureStub(existingProjectDir, allTags);
            }

            writeReport(context, report);
            return report;
        } catch (IOException e) {
            throw new DeltaUpdateException("Failed to update project", e);
        }
    }

    /**
     * Генерирует начальный Units.script для всех тегов модели (команда generate -s).
     */
    public int generateInitialScripts(
            ProjectModel model,
            Path outputDir,
            Path handlersCatalog,
            Path typeMapping) throws DeltaUpdateException {
        try {
            Set<String> allTags = collectUnitNamesFromModel(model);
            if (allTags.isEmpty()) {
                return 0;
            }
            HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(handlersCatalog);
            Path mappingPath = resolveMappingPath(handlersCatalog, typeMapping);
            HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mappingPath);
            var planner = new HandlerAssignmentPlanner(catalog, registry);
            var plan = planner.planWithRegistry(allTags, Set.of());
            return scriptUpdater.appendNewHandlers(outputDir, plan.handlers());
        } catch (IOException e) {
            throw new DeltaUpdateException("Failed to generate Units.script", e);
        }
    }

    private Set<String> readExistingUnitsSafe(Path projectDir) throws DeltaUpdateException {
        try {
            Path unitsPath = projectDir.resolve(IncrementalUnitsUpdater.UNITS_FILE);
            if (!Files.exists(unitsPath)) {
                return Set.of();
            }
            return unitsUpdater.parseExistingUnitNamesPublic(unitsPath);
        } catch (Exception e) {
            throw new DeltaUpdateException("Failed to read existing Units.xml", e);
        }
    }

    private void appendScriptsForNewTags(
            Path projectDir,
            DeltaUpdateContext context,
            Set<String> newTagIds,
            DeltaUpdateReport report) throws IOException, DeltaUpdateException {
        HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(context.handlersCatalogSource());
        Path mappingPath = resolveMappingPath(context.handlersCatalogSource(), context.typeMappingSource());
        HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(
                mappingPath, context.tagOverridesSource());
        Set<String> existingHandlers = scriptUpdater.readExistingHandlerNames(projectDir);
        var planner = new HandlerAssignmentPlanner(catalog, registry);
        var plan = planner.planWithRegistry(newTagIds, existingHandlers);

        for (String tag : plan.matchedNoHandlers()) {
            report.matchedNoHandlers(tag);
        }
        for (String tag : plan.unmatchedTags()) {
            report.unknownType(tag);
        }

        for (MonitorHandler h : plan.handlers()) {
            if (existingHandlers.contains(h.getName())) {
                report.skipHandler(h.getName());
            }
        }

        int added = scriptUpdater.appendNewHandlers(projectDir, plan.handlers());
        for (MonitorHandler h : plan.handlers()) {
            if (!existingHandlers.contains(h.getName())) {
                report.addHandler(h.getName());
            }
        }
        if (added == 0 && plan.handlers().isEmpty() && plan.matchedTags().isEmpty()) {
            for (String tag : newTagIds) {
                report.unknownType(tag);
            }
        }
    }

    private static Path resolveMappingPath(Path handlersCatalog, Path typeMapping) {
        return typeMapping != null
                ? typeMapping
                : handlersCatalog.getParent().resolve("type-mapping.yaml");
    }

    private void writeReport(DeltaUpdateContext context, DeltaUpdateReport report) throws IOException {
        String text = report.toLogText();
        System.out.println(text);
        if (context.metadataStore() == null) {
            return;
        }
        Files.createDirectories(context.metadataStore());
        Files.writeString(context.metadataStore().resolve("update-report.log"), text);
    }

    private static Set<String> collectUnitNamesFromModel(ProjectModel model) {
        Set<String> names = new HashSet<>();
        for (Equipment eq : model.getEquipments()) {
            if (eq.getTags() == null) continue;
            for (Tag tag : eq.getTags()) {
                String id = tag.getId();
                if (id != null && !id.isEmpty()) names.add(id);
            }
        }
        return names;
    }
}
