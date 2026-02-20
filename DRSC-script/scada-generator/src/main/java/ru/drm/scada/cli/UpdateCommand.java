package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import ru.drm.scada.usecase.ScadaProjectService;

import java.nio.file.Path;

@Command(
        name = "update",
        mixinStandardHelpOptions = true,
        description = "Incrementally update existing SCADA project from PDF and Lua sources."
)
public class UpdateCommand implements Runnable {

    @Option(names = {"-p", "--pdf"}, required = true, description = "Path to PDF description file.")
    private Path pdfPath;

    @Option(names = {"-l", "--lua"}, required = true, description = "Path to Lua file.")
    private Path luaPath;

    @Option(names = {"-e", "--existing"}, required = true, description = "Existing SCADA project directory.")
    private Path existingProjectDir;

    @Option(names = {"-m", "--metadata"}, required = true, description = "Directory for metadata storage.")
    private Path metadataDir;

    @Override
    public void run() {
        ScadaProjectService service = ServiceFactory.createScadaProjectService();
        service.updateFromSources(pdfPath, luaPath, existingProjectDir, metadataDir);
        System.out.println("SCADA project update requested. Existing dir: "
                + existingProjectDir.toAbsolutePath());
    }
}

