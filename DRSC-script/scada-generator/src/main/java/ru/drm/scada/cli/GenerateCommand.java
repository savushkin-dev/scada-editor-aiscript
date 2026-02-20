package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import ru.drm.scada.usecase.ScadaProjectService;

import java.nio.file.Path;

@Command(
        name = "generate",
        mixinStandardHelpOptions = true,
        description = "Generate SCADA project from PDF and Lua sources."
)
public class GenerateCommand implements Runnable {

    @Option(names = {"-p", "--pdf"}, required = true, description = "Path to PDF description file.")
    private Path pdfPath;

    @Option(names = {"-l", "--lua"}, required = true, description = "Path to Lua file.")
    private Path luaPath;

    @Option(names = {"-o", "--output"}, required = true, description = "Output directory for SCADA project.")
    private Path outputDir;

    @Override
    public void run() {
        ScadaProjectService service = ServiceFactory.createScadaProjectService();
        service.generateFromSources(pdfPath, luaPath, outputDir);
        System.out.println("SCADA project generated at: " + outputDir.toAbsolutePath());
    }
}

