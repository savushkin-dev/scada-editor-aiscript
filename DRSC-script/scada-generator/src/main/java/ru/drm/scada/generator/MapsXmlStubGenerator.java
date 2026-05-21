package ru.drm.scada.generator;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collection;

/**
 * Минимальная заготовка Maps.xml: пустые секции событий для новых юнитов.
 */
public final class MapsXmlStubGenerator {

    public static final String MAPS_FILE = "Maps.xml";

    private MapsXmlStubGenerator() {
    }

    public static void ensureStub(Path projectDir, Collection<String> unitIds) throws IOException {
        if (unitIds == null || unitIds.isEmpty()) {
            return;
        }
        Path mapsPath = projectDir.resolve(MAPS_FILE);
        if (Files.exists(mapsPath)) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sb.append("<maps>\n");
        sb.append("  <!-- Заготовка scada-generator: события OnChange/OnClick — заполнить вручную или на след. этапе -->\n");
        for (String unitId : unitIds) {
            sb.append("  <unit id=\"").append(escapeXml(unitId)).append("\">\n");
            sb.append("    <events/>\n");
            sb.append("  </unit>\n");
        }
        sb.append("</maps>\n");
        Files.writeString(mapsPath, sb.toString());
    }

    private static String escapeXml(String s) {
        return s.replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;");
    }
}
