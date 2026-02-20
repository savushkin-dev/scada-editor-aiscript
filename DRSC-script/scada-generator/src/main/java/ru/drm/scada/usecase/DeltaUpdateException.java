package ru.drm.scada.usecase;

/**
 * Ошибка инкрементального обновления SCADA-проекта.
 */
public class DeltaUpdateException extends RuntimeException {

    public DeltaUpdateException(String message) {
        super(message);
    }

    public DeltaUpdateException(String message, Throwable cause) {
        super(message, cause);
    }
}

