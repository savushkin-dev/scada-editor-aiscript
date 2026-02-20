package ru.drm.scada.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Оборудование в SCADA-проекте.
 */
public class Equipment {

    private String id;
    private String name;
    private EquipmentType type;
    private List<Tag> tags = new ArrayList<>();
    private Map<String, String> attributes;

    public Equipment() {
    }

    public Equipment(String id,
                     String name,
                     EquipmentType type,
                     List<Tag> tags,
                     Map<String, String> attributes) {
        this.id = id;
        this.name = name;
        this.type = type;
        if (tags != null) {
            this.tags = new ArrayList<>(tags);
        }
        this.attributes = attributes;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public EquipmentType getType() {
        return type;
    }

    public void setType(EquipmentType type) {
        this.type = type;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags != null ? new ArrayList<>(tags) : new ArrayList<>();
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Equipment)) return false;
        Equipment that = (Equipment) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

