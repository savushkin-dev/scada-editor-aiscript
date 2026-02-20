package ru.drm.scada.usecase;

/**
 * Ошибка разбора PDF-описания проекта.
 */
public class PdfParserException extends RuntimeException {

    public PdfParserException(String message) {
        super(message);
    }

    public PdfParserException(String message, Throwable cause) {
        super(message, cause);
    }
}

