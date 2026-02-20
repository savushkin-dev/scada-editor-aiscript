package ru.drm.scada.usecase;

import java.nio.file.Path;

/**
 * Высокоуровневый фасад для операций над SCADA-проектом.
 * Используется CLI и другими внешними клиентами.
 */
public interface ScadaProjectService {

    /**
     * Полная генерация нового SCADA-проекта на основе PDF-описания и Lua-скриптов.
     */
    void generateFromSources(Path pdfPath, Path luaPath, Path outputDir);

    /**
     * Инкрементальное обновление существующего SCADA-проекта
     * по изменённым PDF/Lua-файлам.
     */
    void updateFromSources(Path pdfPath,
                           Path luaPath,
                           Path existingProjectDir,
                           Path metadataStore);
}

