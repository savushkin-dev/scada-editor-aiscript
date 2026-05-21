package ru.drm.scada.generator;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.domain.MonitorHandler;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class IncrementalUnitsScriptUpdaterTest {

  @Test
  void appendNewHandlers_addsOnlyMissing(@TempDir Path dir) throws Exception {
    MonitorHandler h1 = new MonitorHandler("OnClickR_L01_P03", "Self,SelfR", "\n  PSF.Test();\n");
    Files.writeString(dir.resolve(IncrementalUnitsScriptUpdater.UNITS_SCRIPT_FILE), h1.toScriptSource());

    MonitorHandler h2 = new MonitorHandler("OnClickR_L05_P03", "Self,SelfR", "\n  PSF.Test2();\n");
    var updater = new IncrementalUnitsScriptUpdater();
    int added = updater.appendNewHandlers(dir, List.of(h1, h2));

    assertEquals(1, added);
    String content = Files.readString(dir.resolve(IncrementalUnitsScriptUpdater.UNITS_SCRIPT_FILE));
    assertTrue(content.contains("OnClickR_L01_P03"));
    assertTrue(content.contains("OnClickR_L05_P03"));
  }
}
