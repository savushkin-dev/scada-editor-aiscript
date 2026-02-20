package ru.drm.scada.usecase;

import ru.drm.scada.domain.ProjectDescription;

import java.nio.file.Path;

/**
 * Интерфейс парсера PDF-описаний проекта.
 * Реализация находится в адаптерах (например, на базе Apache PDFBox).
 */
public interface PdfParser {

    ProjectDescription parse(Path pdfPath) throws PdfParserException;
}

