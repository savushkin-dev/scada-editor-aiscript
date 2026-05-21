package ru.drm.scada.usecase;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.domain.ProjectModel;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Сборщик полной доменной модели проекта из Lua.
 * Собирает теги из ControlLogic.tagIds, группирует по префиксам в Equipment.
 */
public final class ProjectModelAssembler {

    private ProjectModelAssembler() {
        // utility
    }

    public static ProjectModel assemble(ProjectDescription description,
                                        List<ControlLogic> controlLogics) {
        ProjectModel model = new ProjectModel();
        model.setProjectId(description.getProjectId());
        model.setControlLogics(controlLogics);

        Set<String> allTagIds = new LinkedHashSet<>();
        for (ControlLogic logic : controlLogics) {
            if (logic.getTagIds() != null) {
                allTagIds.addAll(logic.getTagIds());
            }
        }

        List<Equipment> equipments = new ArrayList<>(description.getEquipments());
        if (!allTagIds.isEmpty()) {
            List<Equipment> fromLua = TagPrefixGrouper.buildEquipmentsFromTagIds(allTagIds);
            mergeEquipments(equipments, fromLua);
        }
        model.setEquipments(equipments);

        return model;
    }

    /**
     * Объединяет оборудование: Lua-оборудование добавляется, если id ещё нет.
     * Lua-оборудование добавляется, если такого id ещё нет.
     */
    private static void mergeEquipments(List<Equipment> base, List<Equipment> fromLua) {
        Set<String> existingIds = new LinkedHashSet<>();
        for (Equipment eq : base) {
            if (eq.getId() != null) {
                existingIds.add(eq.getId());
            }
        }
        for (Equipment eq : fromLua) {
            if (eq.getId() != null && !existingIds.contains(eq.getId())) {
                base.add(eq);
                existingIds.add(eq.getId());
            }
        }
    }
}

