package ru.drm.scada.generator;

import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.usecase.DeltaUpdateException;
import ru.drm.scada.usecase.DeltaUpdater;

import java.nio.file.Path;

/**
 * Заглушка для DeltaUpdater.
 * MVP: просто вызывает полную генерацию проекта в указанную директорию.
 * Позже здесь появится логика инкрементальных обновлений XML.
 */
public class NoOpDeltaUpdater implements DeltaUpdater {

    @Override
    public void update(ProjectModel newModel, Path existingProjectDir, Path metadataStore)
            throws DeltaUpdateException {
        // TODO: Реализовать инкрементальное обновление.
        // Пока можно выбросить UnsupportedOperationException или вызывать полную регенерацию.
        throw new UnsupportedOperationException("Delta update is not implemented yet.");
    }
}

