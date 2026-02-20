package ru.drm.scada.cli;

import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.adapter.pdf.PdfBoxPdfParser;
import ru.drm.scada.generator.NoOpDeltaUpdater;
import ru.drm.scada.generator.XmlProjectGenerator;
import ru.drm.scada.usecase.*;

/**
 * Простейшая фабрика для сборки ScadaProjectService и зависимостей без DI-фреймворков.
 */
final class ServiceFactory {

    private ServiceFactory() {
    }

    static ScadaProjectService createScadaProjectService() {
        PdfParser pdfParser = new PdfBoxPdfParser();
        LuaParser luaParser = new SimpleLuaParser();
        ProjectGenerator projectGenerator = new XmlProjectGenerator();
        DeltaUpdater deltaUpdater = new NoOpDeltaUpdater();
        return new ScadaProjectServiceImpl(pdfParser, luaParser, projectGenerator, deltaUpdater);
    }
}

