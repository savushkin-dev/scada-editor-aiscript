package ru.drm.scada.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Алгоритмическая логика управления/обработки, как правило реализуемая в Lua.
 */
public class ControlLogic {

    private String id;
    private String name;
    /**
     * Исходный код Lua или нормализованный скрипт.
     */
    private String luaCode;
    /**
     * Идентификаторы тегов, участвующих в логике.
     */
    private List<String> tagIds = new ArrayList<>();

    public ControlLogic() {
    }

    public ControlLogic(String id, String name, String luaCode, List<String> tagIds) {
        this.id = id;
        this.name = name;
        this.luaCode = luaCode;
        if (tagIds != null) {
            this.tagIds = new ArrayList<>(tagIds);
        }
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

    public String getLuaCode() {
        return luaCode;
    }

    public void setLuaCode(String luaCode) {
        this.luaCode = luaCode;
    }

    public List<String> getTagIds() {
        return tagIds;
    }

    public void setTagIds(List<String> tagIds) {
        this.tagIds = tagIds != null ? new ArrayList<>(tagIds) : new ArrayList<>();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ControlLogic)) return false;
        ControlLogic that = (ControlLogic) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

