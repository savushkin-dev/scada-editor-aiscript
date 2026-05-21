package ru.drm.scada.usecase;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Парсер Units.script Monitor — извлекает имена юнитов из блоков
 * //--------------- Begin: UNITNAME ---------------
 */
public final class UnitsScriptParser {

    private static final Pattern BEGIN_PATTERN =
            Pattern.compile("//\\s*-+\\s*Begin:\\s*(\\S+)\\s*-+");

    private UnitsScriptParser() {
    }

    /**
     * Парсит Units.script и возвращает набор имён юнитов.
     */
    public static Set<String> parseUnitNames(Path unitsScriptPath) throws IOException {
        if (unitsScriptPath == null || !Files.exists(unitsScriptPath)) {
            return Set.of();
        }
        String content = Files.readString(unitsScriptPath);
        Set<String> names = new LinkedHashSet<>();
        Matcher m = BEGIN_PATTERN.matcher(content);
        while (m.find()) {
            String name = m.group(1).trim();
            if (!name.isEmpty()) {
                names.add(name);
            }
        }
        return names;
    }
}
