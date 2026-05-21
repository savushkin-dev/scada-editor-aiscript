package ru.drm.scada.usecase;

import java.nio.file.Path;

/**
 * Высокоуровневый фасад для операций над SCADA-проектом.
 * Используется CLI и другими внешними клиентами.
 */
public interface ScadaProjectService {

    /**
     * Полная генерация SCADA-проекта из Lua-скриптов.
     * @param useAi если true — ИИ дополнительно извлекает теги
     * @param unitsScriptPath опционально — Units.script Monitor для доп. списка юнитов
     */
    void generateFromSources(Path luaPath, Path outputDir, boolean useAi, Path unitsScriptPath);

    /**
     * Генерация с опциональным каталогом обработчиков (-s).
     */
    default void generateFromSources(Path luaPath, Path outputDir, boolean useAi,
                                    Path unitsScriptPath, Path handlersCatalogSource,
                                    Path typeMappingSource) {
        generateFromSources(luaPath, outputDir, useAi, unitsScriptPath);
    }

    /**
     * Инкрементальное обновление SCADA-проекта по изменённым Lua-файлам.
     * @param handlersCatalogSource опционально — scripts.txt / Units.script как каталог шаблонов
     * @param typeMappingSource опционально — type-mapping.yaml; по умолчанию рядом с каталогом скриптов
     */
    void updateFromSources(Path luaPath,
                           Path existingProjectDir,
                           Path metadataStore,
                           boolean useAi,
                           Path unitsScriptPath,
                           Path handlersCatalogSource,
                           Path typeMappingSource);

    default void updateFromSources(Path luaPath,
                                   Path existingProjectDir,
                                   Path metadataStore,
                                   boolean useAi,
                                   Path unitsScriptPath,
                                   Path handlersCatalogSource,
                                   Path typeMappingSource,
                                   ProjectRunOptions options) {
        updateFromSources(luaPath, existingProjectDir, metadataStore, useAi,
                unitsScriptPath, handlersCatalogSource, typeMappingSource);
    }

    default void generateFromSources(Path luaPath, Path outputDir, boolean useAi,
                                     Path unitsScriptPath, Path handlersCatalogSource,
                                     Path typeMappingSource, ProjectRunOptions options) {
        generateFromSources(luaPath, outputDir, useAi, unitsScriptPath, handlersCatalogSource, typeMappingSource);
    }
}

