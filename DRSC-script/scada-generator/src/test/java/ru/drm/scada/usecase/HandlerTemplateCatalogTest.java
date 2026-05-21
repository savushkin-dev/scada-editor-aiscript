package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.MonitorHandler;

import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

class HandlerTemplateCatalogTest {

  @Test
  void expandLine_producesL05FromL01Canonical() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    String pattern = HandlerTemplateCatalog.normalizeNamePattern("OnClickR_L01_P03");
    MonitorHandler canonical = catalog.findCanonicalForPattern(pattern).orElseThrow();
    assertEquals("OnClickR_L01_P03", canonical.getName());

    MonitorHandler expanded = HandlerTemplateExpander.expandLineAndParam(canonical, 5).orElseThrow();
    assertEquals("OnClickR_L05_P03", expanded.getName());
    assertEquals(canonical.getBody(), expanded.getBody());
    assertTrue(expanded.getBody().contains("EditNumTankR1"));
  }

  @Test
  void normalizeNamePattern_replacesDigits() {
    assertEquals("OnClickR_L#_P#", HandlerTemplateCatalog.normalizeNamePattern("OnClickR_L01_P03"));
  }
}
