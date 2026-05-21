package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;

import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

class MonitorScriptsParserTest {

  private static final String SAMPLE = """
      function extern OnClickR_L01_P03(Self,SelfR);
        local Message;
        Message := [1, 2];
        PSF.EditNumTankR1(Message);endf;

      function extern OnClickR_L01_P04(Self,SelfR);
        PSF.EditNumTankR(Message);endf;
      """;

  @Test
  void parse_extractsFunctions() {
    var handlers = MonitorScriptsParser.parse(SAMPLE);
    assertEquals(2, handlers.size());
    assertEquals("OnClickR_L01_P03", handlers.get(0).getName());
    assertEquals("Self,SelfR", handlers.get(0).getParameters());
    assertTrue(handlers.get(0).getBody().contains("EditNumTankR1"));
    assertTrue(handlers.get(0).toScriptSource().contains("function extern OnClickR_L01_P03"));
  }

  @Test
  void parse_realBn1Catalog() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    if (!scripts.toFile().exists()) {
      return;
    }
    var handlers = MonitorScriptsParser.parse(scripts);
    assertTrue(handlers.size() >= 400, "parsed=" + handlers.size());
    long onClick = handlers.stream().filter(h -> h.getName().startsWith("OnClickR_")).count();
    assertTrue(onClick >= 200, "onClick=" + onClick);
  }
}
