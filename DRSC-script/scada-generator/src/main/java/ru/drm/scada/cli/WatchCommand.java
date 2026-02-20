package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.nio.file.Path;

/**
 * Заглушка для команды наблюдения за изменениями файлов.
 * Реальная реализация на базе WatchService будет добавлена позже.
 */
@Command(
        name = "watch",
        mixinStandardHelpOptions = true,
        description = "Watch PDF/Lua changes and update SCADA project (not implemented yet)."
)
public class WatchCommand implements Runnable {

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
        System.out.println("Watch mode is not implemented yet.");
        System.out.println("PDF: " + pdfPath);
        System.out.println("Lua: " + luaPath);
        System.out.println("Existing project: " + existingProjectDir);
        System.out.println("Metadata: " + metadataDir);
    }
}

