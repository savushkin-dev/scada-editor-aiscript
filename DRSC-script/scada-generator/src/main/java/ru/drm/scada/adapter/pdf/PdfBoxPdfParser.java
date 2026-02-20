package ru.drm.scada.adapter.pdf;

import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.ProjectDescription;
import ru.drm.scada.usecase.PdfParser;
import ru.drm.scada.usecase.PdfParserException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;

/**
 * Простейшая реализация PdfParser на базе Apache PDFBox.
 * MVP: вытаскивает только сырой текст и создаёт пустое описание проекта.
 * В дальнейшем здесь можно реализовать полноценный разбор структуры PDF.
 */
public class PdfBoxPdfParser implements PdfParser {

    @Override
    public ProjectDescription parse(Path pdfPath) throws PdfParserException {
        if (pdfPath == null || !Files.exists(pdfPath)) {
            throw new PdfParserException("PDF file does not exist: " + pdfPath);
        }

        try (PDDocument document = Loader.loadPDF(pdfPath.toFile())) {
            PDFTextStripper stripper = new PDFTextStripper();
            String text = stripper.getText(document);

            // TODO: Реальный парсинг PDF-описания (оборудование, параметры и т.д.)
            // Пока формируем минимальное описание с id проекта из имени файла.
            String projectId = pdfPath.getFileName().toString();

            ProjectDescription description = new ProjectDescription();
            description.setProjectId(projectId);
            description.setEquipments(Collections.<Equipment>emptyList());
            // при необходимости можно сохранить сырой текст в глобальные параметры
            return description;
        } catch (IOException e) {
            throw new PdfParserException("Failed to parse PDF: " + pdfPath, e);
        }
    }
}

