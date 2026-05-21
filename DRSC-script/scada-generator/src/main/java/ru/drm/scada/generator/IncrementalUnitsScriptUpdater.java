package ru.drm.scada.generator;

import ru.drm.scada.domain.MonitorHandler;
import ru.drm.scada.usecase.DeltaUpdateException;
import ru.drm.scada.usecase.MonitorScriptsParser;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Инкрементальное обновление Units.script: дописывает только новые function extern.
 */
public class IncrementalUnitsScriptUpdater {

    public static final String UNITS_SCRIPT_FILE = "Units.script";

    /**
     * Дописывает обработчики, которых ещё нет в Units.script.
     *
     * @return количество добавленных функций
     */
    public int appendNewHandlers(Path projectDir, List<MonitorHandler> handlers) throws DeltaUpdateException {
        if (handlers == null || handlers.isEmpty()) {
            return 0;
        }
        try {
            Path scriptPath = projectDir.resolve(UNITS_SCRIPT_FILE);
            Set<String> existing = Files.exists(scriptPath)
                    ? new HashSet<>(MonitorScriptsParser.parseHandlerNames(Files.readString(scriptPath)))
                    : new HashSet<>();

            StringBuilder chunk = new StringBuilder();
            int added = 0;
            for (MonitorHandler h : handlers) {
                if (existing.contains(h.getName())) {
                    continue;
                }
                chunk.append(h.toScriptSource()).append('\n');
                existing.add(h.getName());
                added++;
            }
            if (added == 0) {
                return 0;
            }
            if (Files.exists(scriptPath)) {
                String prefix = Files.readString(scriptPath);
                if (!prefix.endsWith("\n") && !prefix.isEmpty()) {
                    prefix = prefix + "\n";
                }
                Files.writeString(scriptPath, prefix + chunk, StandardOpenOption.TRUNCATE_EXISTING);
            } else {
                Files.writeString(scriptPath, chunk.toString(), StandardOpenOption.CREATE);
            }
            return added;
        } catch (IOException e) {
            throw new DeltaUpdateException("Failed to incrementally update Units.script", e);
        }
    }

    public Set<String> readExistingHandlerNames(Path projectDir) throws IOException {
        Path scriptPath = projectDir.resolve(UNITS_SCRIPT_FILE);
        if (!Files.exists(scriptPath)) {
            return Set.of();
        }
        return Set.copyOf(MonitorScriptsParser.parseHandlerNames(Files.readString(scriptPath)));
    }
}
