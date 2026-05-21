package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Парсер плоского списка обработчиков Monitor (как в scripts.txt BN1).
 */
public final class MonitorScriptsParser {

    private static final Pattern HEADER_PATTERN = Pattern.compile(
            "function\\s+extern\\s+(\\w+)\\s*\\(([^)]*)\\)\\s*;",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern ENDF_PATTERN = Pattern.compile("endf\\s*;", Pattern.CASE_INSENSITIVE);

    private MonitorScriptsParser() {
    }

    public static List<MonitorHandler> parse(Path scriptsPath) throws IOException {
        if (scriptsPath == null || !Files.exists(scriptsPath)) {
            return List.of();
        }
        return parse(Files.readString(scriptsPath));
    }

    public static List<MonitorHandler> parse(String content) {
        List<MonitorHandler> handlers = new ArrayList<>();
        String normalized = content.replace("\r\n", "\n");
        String[] chunks = normalized.split("(?=(?i)function\\s+extern\\s+)");
        for (String chunk : chunks) {
            if (chunk.isBlank()) {
                continue;
            }
            Matcher header = HEADER_PATTERN.matcher(chunk);
            if (!header.find()) {
                continue;
            }
            String name = header.group(1).trim();
            String params = header.group(2).trim();
            int bodyStart = header.end();
            Matcher endf = ENDF_PATTERN.matcher(chunk);
            if (!endf.find(bodyStart)) {
                continue;
            }
            String body = normalizeBody(chunk.substring(bodyStart, endf.start()));
            handlers.add(new MonitorHandler(name, params, body));
        }
        return handlers;
    }

    public static List<String> parseHandlerNames(String content) {
        return parse(content).stream().map(MonitorHandler::getName).toList();
    }

    private static String normalizeBody(String raw) {
        String body = raw.replace("\r\n", "\n");
        if (!body.isEmpty() && !body.startsWith("\n")) {
            body = "\n" + body;
        }
        if (!body.isEmpty() && !body.endsWith("\n")) {
            body = body + "\n";
        }
        return body;
    }
}
