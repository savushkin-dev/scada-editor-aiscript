package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import ru.drm.scada.usecase.ProjectRunOptions;
import ru.drm.scada.usecase.ScadaProjectService;

import java.nio.file.Path;

@Command(
        name = "update",
        mixinStandardHelpOptions = true,
        description = "Incrementally update existing SCADA project from Lua sources."
)
public class UpdateCommand implements Runnable {

    @Option(names = {"-l", "--lua"}, required = true, description = "Path to Lua file or directory.")
    private Path luaPath;

    @Option(names = {"-e", "--existing"}, required = true, description = "Existing SCADA project directory.")
    private Path existingProjectDir;

    @Option(names = {"-m", "--metadata"}, required = true, description = "Directory for metadata storage.")
    private Path metadataDir;

    @Option(names = {"--ai"}, description = "Use AI to extract additional tags from dynamic Lua constructs.")
    private boolean useAi;

    @Option(names = {"-u", "--units-script"}, description = "Path to Units.script (Monitor) for additional unit names.")
    private Path unitsScriptPath;

    @Option(names = {"-s", "--handlers-source"}, description = "Path to scripts catalog (e.g. scripts.txt) for handler templates.")
    private Path handlersSource;

    @Option(names = {"--type-mapping"}, description = "Path to type-mapping.yaml (default: next to handlers-source).")
    private Path typeMapping;

    @Option(names = {"--tag-overrides"}, description = "Path to lua-tag-overrides.yaml.")
    private Path tagOverrides;

    @Option(names = {"--maps-stub"}, description = "Create Maps.xml stub if missing.")
    private boolean mapsStub;

    @Override
    public void run() {
        ScadaProjectService service = ServiceFactory.createScadaProjectService();
        service.updateFromSources(
                luaPath, existingProjectDir, metadataDir, useAi, unitsScriptPath,
                handlersSource, typeMapping, runOptions());
        System.out.println("SCADA project update requested. Existing dir: "
                + existingProjectDir.toAbsolutePath());
    }

    private ProjectRunOptions runOptions() {
        return new ProjectRunOptions(tagOverrides, mapsStub);
    }
}

