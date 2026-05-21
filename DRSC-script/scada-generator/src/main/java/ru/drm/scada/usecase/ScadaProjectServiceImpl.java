package ru.drm.scada.usecase;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.generator.IncrementalProjectUpdater;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;

/**
 * Реализация фасада работы с SCADA-проектом.
 * Lua -> ProjectModel -> генерация/обновление.
 */
public class ScadaProjectServiceImpl implements ScadaProjectService {

    private final LuaParser luaParser;
    private final ProjectGenerator projectGenerator;
    private final DeltaUpdater deltaUpdater;
    private final AiLuaAnalyzer aiLuaAnalyzer;

    public ScadaProjectServiceImpl(LuaParser luaParser,
                                   ProjectGenerator projectGenerator,
                                   DeltaUpdater deltaUpdater) {
        this(luaParser, projectGenerator, deltaUpdater, null);
    }

    public ScadaProjectServiceImpl(LuaParser luaParser,
                                   ProjectGenerator projectGenerator,
                                   DeltaUpdater deltaUpdater,
                                   AiLuaAnalyzer aiLuaAnalyzer) {
        this.luaParser = luaParser;
        this.projectGenerator = projectGenerator;
        this.deltaUpdater = deltaUpdater;
        this.aiLuaAnalyzer = aiLuaAnalyzer;
    }

    @Override
    public void generateFromSources(Path luaPath, Path outputDir, boolean useAi, Path unitsScriptPath) {
        generateFromSources(luaPath, outputDir, useAi, unitsScriptPath, null, null);
    }

    @Override
    public void generateFromSources(Path luaPath, Path outputDir, boolean useAi,
                                    Path unitsScriptPath, Path handlersCatalogSource,
                                    Path typeMappingSource) {
        generateFromSources(luaPath, outputDir, useAi, unitsScriptPath,
                handlersCatalogSource, typeMappingSource, ProjectRunOptions.defaults());
    }

    @Override
    public void generateFromSources(Path luaPath, Path outputDir, boolean useAi,
                                    Path unitsScriptPath, Path handlersCatalogSource,
                                    Path typeMappingSource,
                                    ProjectRunOptions options) {
        ProjectRunOptions opts = options != null ? options : ProjectRunOptions.defaults();
        ProjectDescription description = createDescriptionFromLuaPath(luaPath);
        List<ControlLogic> logics = parseLua(luaPath);
        enrichWithAi(logics, useAi);
        enrichWithUnitsScript(logics, unitsScriptPath);
        ProjectModel model = ProjectModelAssembler.assemble(description, logics);
        projectGenerator.generate(model, outputDir);
        if (handlersCatalogSource != null && deltaUpdater instanceof IncrementalProjectUpdater projectUpdater) {
            int handlers = projectUpdater.generateInitialScripts(model, outputDir, handlersCatalogSource, typeMappingSource);
            System.out.println("Units.script handlers generated: " + handlers);
        }
        if (opts.generateMapsStub()) {
            try {
                java.util.Set<String> tags = new java.util.HashSet<>();
                for (var eq : model.getEquipments()) {
                    if (eq.getTags() == null) continue;
                    for (var tag : eq.getTags()) {
                        if (tag.getId() != null) tags.add(tag.getId());
                    }
                }
                ru.drm.scada.generator.MapsXmlStubGenerator.ensureStub(outputDir, tags);
            } catch (java.io.IOException e) {
                System.err.println("Maps.xml stub failed: " + e.getMessage());
            }
        }
    }

    @Override
    public void updateFromSources(Path luaPath,
                                  Path existingProjectDir,
                                  Path metadataStore,
                                  boolean useAi,
                                  Path unitsScriptPath,
                                  Path handlersCatalogSource,
                                  Path typeMappingSource) {
        updateFromSources(luaPath, existingProjectDir, metadataStore, useAi, unitsScriptPath,
                handlersCatalogSource, typeMappingSource, ProjectRunOptions.defaults());
    }

    @Override
    public void updateFromSources(Path luaPath,
                                  Path existingProjectDir,
                                  Path metadataStore,
                                  boolean useAi,
                                  Path unitsScriptPath,
                                  Path handlersCatalogSource,
                                  Path typeMappingSource,
                                  ProjectRunOptions options) {
        ProjectRunOptions opts = options != null ? options : ProjectRunOptions.defaults();
        ProjectDescription description = createDescriptionFromLuaPath(luaPath);
        List<ControlLogic> logics = parseLua(luaPath);
        enrichWithAi(logics, useAi);
        enrichWithUnitsScript(logics, unitsScriptPath);
        ProjectModel model = ProjectModelAssembler.assemble(description, logics);
        if (deltaUpdater instanceof IncrementalProjectUpdater projectUpdater) {
            projectUpdater.update(
                    model,
                    existingProjectDir,
                    DeltaUpdateContext.full(
                            metadataStore,
                            handlersCatalogSource,
                            typeMappingSource,
                            opts.tagOverridesSource(),
                            opts.scriptFormat(),
                            opts.includeOnChange(),
                            opts.generateMapsStub()));
        } else {
            deltaUpdater.update(model, existingProjectDir, metadataStore);
        }
    }

    private void enrichWithUnitsScript(List<ControlLogic> logics, Path unitsScriptPath) {
        if (unitsScriptPath == null || logics.isEmpty()) return;
        try {
            var unitNames = UnitsScriptParser.parseUnitNames(unitsScriptPath);
            if (unitNames.isEmpty()) return;
            var first = logics.get(0);
            var merged = new ArrayList<>(first.getTagIds() != null ? first.getTagIds() : List.of());
            merged.addAll(unitNames);
            first.setTagIds(merged);
        } catch (Exception ignored) {
            // не удалось прочитать — оставляем как есть
        }
    }

    private void enrichWithAi(List<ControlLogic> logics, boolean useAi) {
        if (!useAi || aiLuaAnalyzer == null || logics.isEmpty()) return;
        StringBuilder combined = new StringBuilder();
        for (ControlLogic l : logics) {
            if (l.getLuaCode() != null) combined.append(l.getLuaCode()).append("\n");
        }
        var extra = AiLuaTagValidator.filterValid(aiLuaAnalyzer.extractAdditionalTags(combined.toString()));
        if (!extra.isEmpty()) {
            var first = logics.get(0);
            var merged = new ArrayList<>(first.getTagIds() != null ? first.getTagIds() : List.of());
            merged.addAll(extra);
            first.setTagIds(merged);
        }
    }

    private static ProjectDescription createDescriptionFromLuaPath(Path luaPath) {
        ProjectDescription d = new ProjectDescription();
        d.setProjectId(Files.isDirectory(luaPath)
                ? luaPath.getFileName().toString()
                : luaPath.getFileName().toString().replaceAll("\\.lua$", ""));
        d.setEquipments(Collections.emptyList());
        return d;
    }

    private List<ControlLogic> parseLua(Path luaPath) {
        try {
            if (Files.isDirectory(luaPath)) {
                return parseLuaDirectory(luaPath);
            }
            return luaParser.parse(luaPath);
        } catch (LuaParserException e) {
            throw new RuntimeException("Lua parsing failed: " + e.getMessage(), e);
        }
    }

    private List<ControlLogic> parseLuaDirectory(Path dir) throws LuaParserException {
        List<ControlLogic> allLogics = new ArrayList<>();
        try (Stream<Path> stream = Files.find(dir, 1, (p, a) -> a.isRegularFile() && p.toString().toLowerCase().endsWith(".lua"))) {
            List<Path> luaFiles = stream.sorted().toList();
            for (Path f : luaFiles) {
                allLogics.addAll(luaParser.parse(f));
            }
        } catch (IOException e) {
            throw new LuaParserException("Failed to read Lua directory: " + dir, e);
        }
        return allLogics;
    }
}
