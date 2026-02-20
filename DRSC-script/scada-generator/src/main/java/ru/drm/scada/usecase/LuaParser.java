package ru.drm.scada.usecase;

import ru.drm.scada.domain.ControlLogic;

import java.nio.file.Path;
import java.util.List;

/**
 * Интерфейс парсера Lua-скриптов, описывающих алгоритмы/логику.
 */
public interface LuaParser {

    List<ControlLogic> parse(Path luaPath) throws LuaParserException;
}

