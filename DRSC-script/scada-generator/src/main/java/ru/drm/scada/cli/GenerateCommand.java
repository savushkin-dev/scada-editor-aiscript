package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import ru.drm.scada.usecase.ProjectRunOptions;
import ru.drm.scada.usecase.ScadaProjectService;

import java.nio.file.Path;

@Command(
        name = "generate",
        mixinStandardHelpOptions = true,
        description = "Generate SCADA project from Lua sources."
)
public class GenerateCommand implements Runnable {

    @Option(names = {"-l", "--lua"}, required = true, description = "Path to Lua file or directory.")
    private Path luaPath;

    @Option(names = {"-o", "--output"}, required = true, description = "Output directory for SCADA project.")
    private Path outputDir;

    @Option(names = {"--ai"}, description = "Use AI to extract additional tags from dynamic Lua constructs.")
    private boolean useAi;

    @Option(names = {"-u", "--units-script"}, description = "Path to Units.script (Monitor) for additional unit names.")
    private Path unitsScriptPath;

    @Option(names = {"-s", "--handlers-source"}, description = "Path to scripts catalog (scripts.txt) to generate initial Units.script.")
    private Path handlersSource;

    @Option(names = {"--type-mapping"}, description = "Path to type-mapping.yaml (default: next to handlers-source).")
    private Path typeMapping;

    @Option(names = {"--maps-stub"}, description = "Create Maps.xml stub after generate.")
    private boolean mapsStub;

    @Override
    public void run() {
        ScadaProjectService service = ServiceFactory.createScadaProjectService();
        ProjectRunOptions opts = new ProjectRunOptions(null, mapsStub);
        service.generateFromSources(luaPath, outputDir, useAi, unitsScriptPath, handlersSource, typeMapping, opts);
        System.out.println("SCADA project generated at: " + outputDir.toAbsolutePath());
    }
}

