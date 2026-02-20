package ru.drm.scada.domain;

import java.util.Objects;

/**
 * Описание тега/сигнала SCADA.
 */
public class Tag {

    private String id;
    private String name;
    private TagType type;
    private String source;   // источник сигнала (PLC, виртуальный и т.п.)
    private String address;  // адрес в контроллере/системе

    public Tag() {
    }

    public Tag(String id, String name, TagType type, String source, String address) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.source = source;
        this.address = address;
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

    public TagType getType() {
        return type;
    }

    public void setType(TagType type) {
        this.type = type;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Tag)) return false;
        Tag tag = (Tag) o;
        return Objects.equals(id, tag.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

