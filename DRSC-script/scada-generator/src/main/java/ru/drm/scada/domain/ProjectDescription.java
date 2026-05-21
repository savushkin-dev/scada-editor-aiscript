package ru.drm.scada.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Промежуточное описание проекта (без логики).
 * Используется при сборке полной ProjectModel.
 */
public class ProjectDescription {

    private String projectId;
    private List<Equipment> equipments = new ArrayList<>();
    private Map<String, String> globalParameters = new HashMap<>();

    public ProjectDescription() {
    }

    public ProjectDescription(String projectId,
                              List<Equipment> equipments,
                              Map<String, String> globalParameters) {
        this.projectId = projectId;
        if (equipments != null) {
            this.equipments = new ArrayList<>(equipments);
        }
        if (globalParameters != null) {
            this.globalParameters = new HashMap<>(globalParameters);
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

    public Map<String, String> getGlobalParameters() {
        return globalParameters;
    }

    public void setGlobalParameters(Map<String, String> globalParameters) {
        this.globalParameters = globalParameters != null ? new HashMap<>(globalParameters) : new HashMap<>();
    }
}

