package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.EquipmentType;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;

import java.util.Arrays;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;

class ProjectModelAssemblerTest {

    @Test
    void assemble_shouldCombineDescriptionAndLogics() {
        ProjectDescription description = new ProjectDescription();
        description.setProjectId("test-project");

        Equipment eq = new Equipment();
        eq.setId("eq1");
        eq.setName("Pump 1");
        eq.setType(EquipmentType.PUMP);
        description.setEquipments(Collections.singletonList(eq));

        ControlLogic logic = new ControlLogic();
        logic.setId("logic1");
        logic.setName("MainLogic");

        ProjectModel model = ProjectModelAssembler.assemble(
                description,
                Collections.singletonList(logic)
        );

        assertNotNull(model);
        assertEquals("test-project", model.getProjectId());
        assertEquals(1, model.getEquipments().size());
        assertEquals(1, model.getControlLogics().size());
    }

    @Test
    void assemble_shouldBuildEquipmentFromLuaTagIds() {
        ProjectDescription description = new ProjectDescription();
        description.setProjectId("test");

        ControlLogic logic = new ControlLogic();
        logic.setId("prg");
        logic.setTagIds(Arrays.asList("ALPMAGW5DI488511", "ALPMAGW5AI480512", "LA_TANK1AO11"));

        ProjectModel model = ProjectModelAssembler.assemble(description, Collections.singletonList(logic));

        assertTrue(model.getEquipments().size() >= 2);
        Equipment alpma = model.getEquipments().stream()
                .filter(e -> "ALPMAGW5".equals(e.getId()))
                .findFirst()
                .orElseThrow();
        assertEquals(2, alpma.getTags().size());
    }
}

