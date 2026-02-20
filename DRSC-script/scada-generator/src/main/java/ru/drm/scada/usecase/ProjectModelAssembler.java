package ru.drm.scada.usecase;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;

import java.util.List;

/**
 * Сборщик полной доменной модели проекта из результатов парсеров PDF и Lua.
 */
public final class ProjectModelAssembler {

    private ProjectModelAssembler() {
        // utility
    }

    public static ProjectModel assemble(ProjectDescription description,
                                        List<ControlLogic> controlLogics) {
        ProjectModel model = new ProjectModel();
        model.setProjectId(description.getProjectId());
        model.setEquipments(description.getEquipments());
        model.setControlLogics(controlLogics);
        return model;
    }
}

