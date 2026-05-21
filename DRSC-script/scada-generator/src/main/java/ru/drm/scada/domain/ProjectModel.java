package ru.drm.scada.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Целостная модель SCADA-проекта, полученная из Lua-скриптов.
 */
public class ProjectModel {

    private String projectId;
    private List<Equipment> equipments = new ArrayList<>();
    private List<ControlLogic> controlLogics = new ArrayList<>();

    public ProjectModel() {
    }

    public ProjectModel(String projectId,
                        List<Equipment> equipments,
                        List<ControlLogic> controlLogics) {
        this.projectId = projectId;
        if (equipments != null) {
            this.equipments = new ArrayList<>(equipments);
        }
        if (controlLogics != null) {
            this.controlLogics = new ArrayList<>(controlLogics);
        }
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public List<Equipment> getEquipments() {
        return equipments;
    }

    public void setEquipments(List<Equipment> equipments) {
        this.equipments = equipments != null ? new ArrayList<>(equipments) : new ArrayList<>();
    }

    public List<ControlLogic> getControlLogics() {
        return controlLogics;
    }

    public void setControlLogics(List<ControlLogic> controlLogics) {
        this.controlLogics = controlLogics != null ? new ArrayList<>(controlLogics) : new ArrayList<>();
    }
}

