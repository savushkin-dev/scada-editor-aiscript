package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.MonitorHandler;

import java.nio.file.Path;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class HandlerAssignmentPlannerTest {

  @Test
  void planHandlersForNewTags_assignsLineVariants() throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }
    HandlerTemplateCatalog catalog = HandlerTemplateCatalog.load(scripts);
    HandlerMappingRegistry registry = HandlerTypeMappingLoader.loadRegistry(mapping);
    var planner = new HandlerAssignmentPlanner(catalog, registry);

    var handlers = planner.planHandlersForNewTags(Set.of("L05NEW"), Set.of());

    assertFalse(handlers.isEmpty(), "planned handlers: " + handlers.stream().map(MonitorHandler::getName).toList());
    assertTrue(handlers.stream().anyMatch(h -> h.getName().equals("OnClickR_L05_P03")));
    assertTrue(handlers.stream().anyMatch(h -> h.getName().equals("OnClickR_L05_P04")));
    MonitorHandler p03 = handlers.stream()
        .filter(h -> h.getName().equals("OnClickR_L05_P03"))
        .findFirst()
        .orElseThrow();
    assertTrue(p03.getBody().contains("PSF.EditNumTankR1"));
  }
}
