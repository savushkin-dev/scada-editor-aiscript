package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;

import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class HandlerTypeMappingLoaderTest {

  @Test
  void load_readsBn1Mapping() throws Exception {
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!mapping.toFile().exists()) {
      return;
    }
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    assertFalse(registry.handlerTypes().isEmpty() || registry.luaMappings().isEmpty());
    assertTrue(registry.handlerTypes().containsKey("on_click_line_p03"));
    assertTrue(registry.luaMappings().stream()
        .anyMatch(r -> r.tagIdRegex().matcher("L05NEW").find()));
    assertTrue(registry.luaMappings().stream()
        .anyMatch(r -> r.tagIdRegex().matcher("MCA4LINE3DI1").find()));
  }
}
