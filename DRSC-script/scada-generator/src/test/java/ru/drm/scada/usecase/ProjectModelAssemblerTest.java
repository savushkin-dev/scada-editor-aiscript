package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.EquipmentType;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;

import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

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
}

