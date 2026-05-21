package ru.drm.scada.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.generator.IncrementalUnitsUpdater;
import ru.drm.scada.generator.MonitorUnitsGenerator;
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
        Path luaDir = Path.of("data/BN1_Rastvorenie/BN1_Rastvorenie/docs");
        if (!Files.isDirectory(luaDir)) {
            org.junit.jupiter.api.Assumptions.assumeTrue(false, "BN1 test data not found");
        }

        var service = new ScadaProjectServiceImpl(
                new SimpleLuaParser(),
                new MonitorUnitsGenerator(),
                new IncrementalUnitsUpdater(new MonitorUnitsGenerator())
        );
        service.generateFromSources(luaDir, outputDir, false, null);

        Path unitsXml = outputDir.resolve("Units.xml");
        assertTrue(Files.exists(unitsXml), "Units.xml should be created");
        assertFalse(Files.exists(outputDir.resolve("project.xml")), "project.xml should NOT be created");

        String units = Files.readString(unitsXml);
        assertTrue(units.contains("<units>"));
        assertTrue(units.contains("MCA4LINE") || units.contains("ALMIX"));
    }
}
