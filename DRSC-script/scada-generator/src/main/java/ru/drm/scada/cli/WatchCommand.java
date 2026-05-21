package ru.drm.scada.cli;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import ru.drm.scada.usecase.ScadaProjectService;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardWatchEventKinds;
import java.nio.file.WatchEvent;
import java.nio.file.WatchKey;
import java.nio.file.WatchService;
import java.util.concurrent.TimeUnit;

/**
 * Наблюдение за каталогом Lua и инкрементальный update при изменениях.
 */
@Command(
        name = "watch",
        mixinStandardHelpOptions = true,
        description = "Watch Lua directory and run update on changes."
)
public class WatchCommand implements Runnable {

    @Option(names = {"-l", "--lua"}, required = true, description = "Path to Lua file or directory.")
    private Path luaPath;

    @Option(names = {"-e", "--existing"}, required = true, description = "Existing SCADA project directory.")
    private Path existingProjectDir;

    @Option(names = {"-m", "--metadata"}, required = true, description = "Directory for metadata storage.")
    private Path metadataDir;

    @Option(names = {"-s", "--handlers-source"}, description = "Path to scripts catalog (scripts.txt).")
    private Path handlersSource;

    @Option(names = {"--type-mapping"}, description = "Path to type-mapping.yaml.")
    private Path typeMapping;

    @Option(names = {"--poll-seconds"}, defaultValue = "2", description = "Poll interval when WatchService unavailable.")
    private long pollSeconds;

    @Override
    public void run() {
        Path watchRoot = Files.isDirectory(luaPath) ? luaPath : luaPath.getParent();
        if (watchRoot == null || !Files.isDirectory(watchRoot)) {
            System.err.println("Cannot watch: " + luaPath);
            return;
        }
        ScadaProjectService service = ServiceFactory.createScadaProjectService();
        System.out.println("Watching " + watchRoot.toAbsolutePath() + " (Ctrl+C to stop)");
        try (WatchService watchService = FileSystems.getDefault().newWatchService()) {
            registerRecursive(watchService, watchRoot);
            runUpdate(service);
            while (!Thread.currentThread().isInterrupted()) {
                WatchKey key = watchService.poll(pollSeconds, TimeUnit.SECONDS);
                if (key == null) {
                    continue;
                }
                boolean luaChanged = false;
                for (WatchEvent<?> event : key.pollEvents()) {
                    if (event.kind() == StandardWatchEventKinds.OVERFLOW) {
                        continue;
                    }
                    Path changed = watchRoot.resolve((Path) event.context());
                    if (Files.isDirectory(changed)) {
                        registerRecursive(watchService, changed);
                    }
                    if (changed.toString().toLowerCase().endsWith(".lua")) {
                        luaChanged = true;
                    }
                }
                key.reset();
                if (luaChanged) {
                    System.out.println("Lua changed, running update...");
                    runUpdate(service);
                }
            }
        } catch (IOException | InterruptedException e) {
            if (e instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            System.err.println("Watch stopped: " + e.getMessage());
        }
    }

    private void runUpdate(ScadaProjectService service) {
        service.updateFromSources(
                luaPath, existingProjectDir, metadataDir, false, null, handlersSource, typeMapping);
    }

    private static void registerRecursive(WatchService watchService, Path root) throws IOException {
        Files.walk(root)
                .filter(Files::isDirectory)
                .forEach(dir -> registerDir(watchService, dir));
    }

    private static void registerDir(WatchService watchService, Path dir) {
        try {
            dir.register(watchService,
                    StandardWatchEventKinds.ENTRY_CREATE,
                    StandardWatchEventKinds.ENTRY_MODIFY,
                    StandardWatchEventKinds.ENTRY_DELETE);
        } catch (IOException ignored) {
            // каталог мог исчезнуть
        }
    }
}
