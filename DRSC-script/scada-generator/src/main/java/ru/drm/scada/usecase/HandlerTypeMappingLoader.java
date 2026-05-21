package ru.drm.scada.usecase;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

/**
 * Загрузка type-mapping.yaml и опционально lua-tag-overrides.yaml.
 */
public final class HandlerTypeMappingLoader {

    private static final ObjectMapper MAPPER = new ObjectMapper(new YAMLFactory());

    private HandlerTypeMappingLoader() {
    }

    public static HandlerMappingRegistry loadRegistry(Path yamlPath) throws IOException {
        return loadRegistry(yamlPath, null);
    }

    public static HandlerMappingRegistry loadRegistry(Path yamlPath, Path tagOverridesPath) throws IOException {
        if (yamlPath == null || !Files.exists(yamlPath)) {
            return new HandlerMappingRegistry(Map.of(), Map.of(), List.of(), LuaTagOverrides.empty());
        }
        Path overridesPath = tagOverridesPath != null
                ? tagOverridesPath
                : yamlPath.getParent().resolve("lua-tag-overrides.yaml");
        LuaTagOverrides overrides = LuaTagOverrides.load(overridesPath);
        return HandlerMappingRegistry.fromConfig(readConfig(yamlPath), overrides);
    }

    private static HandlerTypeMapping.Config readConfig(Path yamlPath) throws IOException {
        return MAPPER.readValue(yamlPath.toFile(), HandlerTypeMapping.Config.class);
    }
}
