package ru.drm.scada.usecase;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Точечные переопределения: конкретный tagId → список typeId (или пустой список).
 */
public final class LuaTagOverrides {

    private final Map<String, List<String>> byTagId;

    public LuaTagOverrides(Map<String, List<String>> byTagId) {
        this.byTagId = byTagId != null ? Map.copyOf(byTagId) : Map.of();
    }

    public List<String> typeIdsFor(String tagId) {
        return byTagId.get(tagId);
    }

    public boolean hasOverride(String tagId) {
        return byTagId.containsKey(tagId);
    }

    public static LuaTagOverrides empty() {
        return new LuaTagOverrides(Map.of());
    }

    public static LuaTagOverrides load(Path yamlPath) throws IOException {
        if (yamlPath == null || !Files.exists(yamlPath)) {
            return empty();
        }
        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        Root root = mapper.readValue(yamlPath.toFile(), Root.class);
        Map<String, List<String>> map = new LinkedHashMap<>();
        if (root.overrides != null) {
            for (Entry e : root.overrides) {
                if (e.tagId != null) {
                    map.put(e.tagId, e.types != null ? List.copyOf(e.types) : List.of());
                }
            }
        }
        return new LuaTagOverrides(map);
    }

    static final class Root {
        public List<Entry> overrides = new ArrayList<>();
    }

    static final class Entry {
        public String tagId;
        public List<String> types = new ArrayList<>();
    }
}
