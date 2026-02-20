package ru.drm.scada.usecase;

import ru.drm.scada.domain.ProjectModel;

import java.nio.file.Path;

/**
 * Модуль инкрементального обновления уже существующего SCADA-проекта.
 */
public interface DeltaUpdater {

    void update(ProjectModel newModel,
                Path existingProjectDir,
                Path metadataStore) throws DeltaUpdateException;
}

