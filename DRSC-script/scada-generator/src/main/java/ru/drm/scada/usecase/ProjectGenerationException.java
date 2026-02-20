package ru.drm.scada.usecase;

/**
 * Ошибка генерации SCADA-проекта.
 */
public class ProjectGenerationException extends RuntimeException {

    public ProjectGenerationException(String message) {
        super(message);
    }

    public ProjectGenerationException(String message, Throwable cause) {
        super(message, cause);
    }
}

