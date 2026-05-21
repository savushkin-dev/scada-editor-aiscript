package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;

import java.nio.file.Path;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class HandlerMappingRegistryTest {

  @Test
  void planHandlers_mca4LineTag_getsLineHandlers() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    var plan = registry.planHandlers(catalog, Set.of("MCA4LINE3DI1"), Set.of());

    assertTrue(plan.matchedTags().contains("MCA4LINE3DI1"));
    assertTrue(plan.handlers().stream().anyMatch(h -> h.getName().equals("OnClickR_L03_P03")));
  }

  @Test
  void planHandlers_almixTag_matchedWithoutHandlers() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    var plan = registry.planHandlers(catalog, Set.of("ALMIX1DI1"), Set.of());

    assertTrue(plan.matchedTags().contains("ALMIX1DI1"));
    assertTrue(plan.matchedNoHandlers().contains("ALMIX1DI1"));
    assertTrue(plan.handlers().isEmpty());
    assertFalse(plan.unmatchedTags().contains("ALMIX1DI1"));
  }

  @Test
  void planHandlers_r21Tag_getsLineHandlers() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    var plan = registry.planHandlers(catalog, Set.of("R21DI12"), Set.of());

    assertTrue(plan.matchedTags().contains("R21DI12"));
    assertTrue(plan.handlers().stream().anyMatch(h -> h.getName().equals("OnClickR_L21_P03")));
  }

  @Test
  void planHandlers_liBundle_expandsMultipleHandlers() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    var plan = registry.planHandlers(catalog, Set.of("LI02TEST"), Set.of());

    assertTrue(plan.handlers().size() >= 4);
    assertTrue(plan.handlers().stream().anyMatch(h -> h.getName().contains("LI02_M02_P03")));
  }
}
