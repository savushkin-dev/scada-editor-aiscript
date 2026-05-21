package ru.drm.scada.integration;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.EquipmentType;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.domain.TagType;
import ru.drm.scada.generator.IncrementalProjectUpdater;
import ru.drm.scada.generator.IncrementalUnitsScriptUpdater;
import ru.drm.scada.generator.MonitorUnitsGenerator;
import ru.drm.scada.usecase.DeltaUpdateContext;
import ru.drm.scada.usecase.MonitorScriptsParser;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Сквозной сценарий: новый тег L05* → Units.xml + OnClickR_L05_P03/P04 в Units.script.
 */
class Bn1HandlerUpdateIntegrationTest {

  @Test
  void update_addsUnitAndHandlersForNewLineTag(@TempDir Path projectDir, @TempDir Path metaDir) throws Exception {
    Path scripts = Path.of("data/BN1_Rastvorenie_scripts/scripts.txt");
    Path mapping = Path.of("data/BN1_Rastvorenie_scripts/type-mapping.yaml");
    if (!scripts.toFile().exists()) {
      return;
    }

    ProjectModel initial = modelWithTags("L01EXIST");
    new MonitorUnitsGenerator().generate(initial, projectDir);
    Files.writeString(
        projectDir.resolve(IncrementalUnitsScriptUpdater.UNITS_SCRIPT_FILE),
        MonitorScriptsParser.parse(scripts).stream()
            .filter(h -> h.getName().equals("OnClickR_L01_P03")
                    || h.getName().equals("OnClickR_L01_P04"))
            .map(h -> h.toScriptSource())
            .reduce("", String::concat));

    ProjectModel updated = modelWithTags("L01EXIST", "L05NEW");
    var updater = new IncrementalProjectUpdater(new MonitorUnitsGenerator());
    updater.update(
            updated,
            projectDir,
            DeltaUpdateContext.of(metaDir, scripts, mapping));

    String xml = Files.readString(projectDir.resolve("Units.xml"));
    assertTrue(xml.contains("<name>L05NEW</name>"));

    String script = Files.readString(projectDir.resolve(IncrementalUnitsScriptUpdater.UNITS_SCRIPT_FILE));
    assertTrue(script.contains("OnClickR_L05_P03"));
    assertTrue(script.contains("OnClickR_L05_P04"));
    assertTrue(script.contains("PSF.EditNumTankR1"));
  }

  private static ProjectModel modelWithTags(String... tagIds) {
    ProjectModel m = new ProjectModel();
    Equipment eq = new Equipment();
    eq.setId("eq1");
    eq.setType(EquipmentType.UNIT);
    for (String id : tagIds) {
      eq.getTags().add(new Tag(id, id, TagType.INTERNAL, "lua", null));
    }
    m.setEquipments(List.of(eq));
    return m;
  }
}
