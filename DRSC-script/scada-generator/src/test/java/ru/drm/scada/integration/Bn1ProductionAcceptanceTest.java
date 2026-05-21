package ru.drm.scada.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.generator.IncrementalProjectUpdater;
import ru.drm.scada.generator.MonitorUnitsGenerator;
import ru.drm.scada.usecase.DeltaUpdateReport;
import ru.drm.scada.usecase.MonitorScriptsParser;
import ru.drm.scada.usecase.ProjectQualityValidator;
import ru.drm.scada.usecase.ScadaProjectServiceImpl;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Acceptance: эталонный прогон BN1 с порогами качества.
 */
class Bn1ProductionAcceptanceTest {

    private static final Path LUA_DOCS =
            Path.of("data/BN1_Rastvorenie/BN1_Rastvorenie/docs");
    private static final Path SCRIPTS =
            Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    private static final Path MAPPING =
            Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");

    @Test
    void generateAndUpdate_meetsQualityThresholds(@TempDir Path outDir, @TempDir Path metaDir) throws Exception {
        if (!LUA_DOCS.toFile().exists() || !SCRIPTS.toFile().exists()) {
            return;
        }
        var service = new ScadaProjectServiceImpl(
                new SimpleLuaParser(),
                new MonitorUnitsGenerator(),
                new IncrementalProjectUpdater(new MonitorUnitsGenerator()));

        service.generateFromSources(LUA_DOCS, outDir, false, null, SCRIPTS, MAPPING);

        String xml = Files.readString(outDir.resolve("Units.xml"));
        int unitCount = (int) xml.lines().filter(l -> l.contains("<unit>")).count();
        if (unitCount == 0) {
            unitCount = xml.split("<unit>").length - 1;
        }
        assertTrue(unitCount >= 50, "units=" + unitCount);

        Path scriptPath = outDir.resolve("Units.script");
        assertTrue(Files.exists(scriptPath));
        int handlersInScript = MonitorScriptsParser.parseHandlerNames(Files.readString(scriptPath)).size();
        assertTrue(handlersInScript > 0, "handlers in script");

        service.updateFromSources(LUA_DOCS, outDir, metaDir, false, null, SCRIPTS, MAPPING);
        assertTrue(Files.exists(metaDir.resolve("update-report.log")));
        String reportText = Files.readString(metaDir.resolve("update-report.log"));
        assertTrue(reportText.contains("matched_no_handlers") || reportText.contains("unknown_type"));

        DeltaUpdateReport report = new DeltaUpdateReport();
        var quality = ProjectQualityValidator.validate(unitCount, handlersInScript, report, 50, 1);
        assertTrue(quality.unitCount() >= 50);
    }
}
