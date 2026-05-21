package ru.drm.scada.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.generator.IncrementalProjectUpdater;
import ru.drm.scada.generator.MonitorUnitsGenerator;
import ru.drm.scada.usecase.ScadaProjectService;
import ru.drm.scada.usecase.ScadaProjectServiceImpl;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Полный прогон на реальном наборе Lua BN1.
 */
class Bn1FullDocsIntegrationTest {

  private static final Path LUA_DOCS =
      Path.of("data/BN1_Rastvorenie/BN1_Rastvorenie/docs");
  private static final Path SCRIPTS =
      Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
  private static final Path MAPPING =
      Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");

  @Test
  void generate_fromRealLua_producesUnitsXml(@TempDir Path outDir) throws Exception {
    if (!LUA_DOCS.toFile().exists()) {
      return;
    }
    ScadaProjectService service = new ScadaProjectServiceImpl(
        new SimpleLuaParser(),
        new MonitorUnitsGenerator(),
        new IncrementalProjectUpdater(new MonitorUnitsGenerator()));
    service.generateFromSources(LUA_DOCS, outDir, false, null, SCRIPTS, MAPPING);

    Path units = outDir.resolve("Units.xml");
    assertTrue(Files.exists(units));
    String xml = Files.readString(units);
    long unitCount = xml.split("<unit>").length - 1;
    assertTrue(unitCount >= 50, "units=" + unitCount);

    Path script = outDir.resolve("Units.script");
    if (Files.exists(script)) {
      String scriptText = Files.readString(script);
      assertTrue(scriptText.contains("function extern"));
    }
  }

  @Test
  void update_onGeneratedProject_writesReport(@TempDir Path outDir, @TempDir Path metaDir) throws Exception {
    if (!LUA_DOCS.toFile().exists()) {
      return;
    }
    ScadaProjectService service = new ScadaProjectServiceImpl(
        new SimpleLuaParser(),
        new MonitorUnitsGenerator(),
        new IncrementalProjectUpdater(new MonitorUnitsGenerator()));
    service.generateFromSources(LUA_DOCS, outDir, false, null);
    service.updateFromSources(LUA_DOCS, outDir, metaDir, false, null, SCRIPTS, MAPPING);

    assertTrue(Files.exists(outDir.resolve("Units.xml")));
    Path report = metaDir.resolve("update-report.log");
    assertTrue(Files.exists(report));
    assertFalse(Files.readString(report).isBlank());
  }
}
