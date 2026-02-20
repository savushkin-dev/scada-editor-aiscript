package ru.drm.scada.usecase;

import ru.drm.scada.domain.ProjectModel;

import java.nio.file.Path;

/**
 * Генератор SCADA-проекта (например, в формате XML) из доменной модели.
 * Реализация находится в модуле generator.
 */
public interface ProjectGenerator {

    void generate(ProjectModel model, Path outputDirectory) throws ProjectGenerationException;
}

