package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;

import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

class HandlerTemplateExpanderTest {

  @Test
  void expandFromCanonical_createsL05() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    var expanded = HandlerTemplateExpander.expandFromCanonical(catalog, "OnClickR_L01_P03", 5);
    assertTrue(expanded.isPresent(), "canonical must exist in catalog");
    assertEquals("OnClickR_L05_P03", expanded.get().getName());
  }
}
