package ru.drm.scada.cli;

import ru.drm.scada.adapter.ai.OpenAiLuaAnalyzer;
import ru.drm.scada.adapter.lua.SimpleLuaParser;
import ru.drm.scada.generator.IncrementalProjectUpdater;
import ru.drm.scada.generator.MonitorUnitsGenerator;
import ru.drm.scada.usecase.*;

/**
 * Фабрика для сборки ScadaProjectService и зависимостей.
 */
final class ServiceFactory {

    private ServiceFactory() {
    }

    static ScadaProjectService createScadaProjectService() {
        LuaParser luaParser = new SimpleLuaParser();
        ProjectGenerator projectGenerator = new MonitorUnitsGenerator();
        DeltaUpdater deltaUpdater = new IncrementalProjectUpdater(new MonitorUnitsGenerator());
        return new ScadaProjectServiceImpl(
                luaParser, projectGenerator, deltaUpdater, new OpenAiLuaAnalyzer());
    }
}

