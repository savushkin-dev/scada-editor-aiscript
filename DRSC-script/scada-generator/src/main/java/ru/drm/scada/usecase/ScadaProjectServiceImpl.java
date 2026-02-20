package ru.drm.scada.usecase;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;

import java.nio.file.Path;
import java.util.List;

/**
 * Реализация фасада работы с SCADA-проектом.
 * Инкапсулирует последовательность: PDF -> Lua -> ProjectModel -> генерация/обновление.
 */
public class ScadaProjectServiceImpl implements ScadaProjectService {

    private final PdfParser pdfParser;
    private final LuaParser luaParser;
    private final ProjectGenerator projectGenerator;
    private final DeltaUpdater deltaUpdater;

    public ScadaProjectServiceImpl(PdfParser pdfParser,
                                   LuaParser luaParser,
                                   ProjectGenerator projectGenerator,
                                   DeltaUpdater deltaUpdater) {
        this.pdfParser = pdfParser;
        this.luaParser = luaParser;
        this.projectGenerator = projectGenerator;
        this.deltaUpdater = deltaUpdater;
    }

    @Override
    public void generateFromSources(Path pdfPath, Path luaPath, Path outputDir) {
        ProjectDescription description = pdfParser.parse(pdfPath);
        List<ControlLogic> logics = luaParser.parse(luaPath);
        ProjectModel model = ProjectModelAssembler.assemble(description, logics);
        projectGenerator.generate(model, outputDir);
    }

    @Override
    public void updateFromSources(Path pdfPath,
                                  Path luaPath,
                                  Path existingProjectDir,
                                  Path metadataStore) {
        ProjectDescription description = pdfParser.parse(pdfPath);
        List<ControlLogic> logics = luaParser.parse(luaPath);
        ProjectModel model = ProjectModelAssembler.assemble(description, logics);
        deltaUpdater.update(model, existingProjectDir, metadataStore);
    }
}

