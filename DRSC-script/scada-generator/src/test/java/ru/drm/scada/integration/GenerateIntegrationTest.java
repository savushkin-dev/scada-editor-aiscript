package ru.drm.scada.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.generator.CompositeProjectGenerator;
import ru.drm.scada.generator.MonitorUnitsGenerator;
import ru.drm.scada.generator.NoOpDeltaUpdater;
import ru.drm.scada.generator.XmlProjectGenerator;
import ru.drm.scada.usecase.ScadaProjectServiceImpl;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Интеграционный тест полной цепочки generate.
 */
class GenerateIntegrationTest {

    @Test
    void generate_createsUnitsXml(@TempDir Path outputDir) throws Exception {
        Path dataDir = Path.of(".").toAbsolutePath().resolve("data");
        Path luaPath = dataDir.resolve("MOZARELLA").resolve("prg.lua");
        Path unitsScript = dataDir.resolve("MOZARELLA")
                .resolve("O1_MOZARELLA.files").resolve("O1_MOZARELLA.files").resolve("Units.script");

        if (!Files.exists(luaPath)) {
            org.junit.jupiter.api.Assumptions.assumeTrue(false, "MOZARELLA test data not found");
        }

        var service = new ScadaProjectServiceImpl(
                new SimpleLuaParser(),
                new MonitorUnitsGenerator(),
                new ru.drm.scada.generator.IncrementalUnitsUpdater(new MonitorUnitsGenerator())
        );
        service.generateFromSources(luaPath, outputDir, false, Files.exists(unitsScript) ? unitsScript : null);

        Path unitsXml = outputDir.resolve("Units.xml");
        assertTrue(Files.exists(unitsXml), "Units.xml should be created");
        assertFalse(Files.exists(outputDir.resolve("project.xml")), "project.xml should NOT be created");

        String units = Files.readString(unitsXml);
        assertTrue(units.contains("<units>"));
        assertTrue(units.contains("ALPMAGW5") || units.contains("DI") || units.contains("AI"));
    }
}
