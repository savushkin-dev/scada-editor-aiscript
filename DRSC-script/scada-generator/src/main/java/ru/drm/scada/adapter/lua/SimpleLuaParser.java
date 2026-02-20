package ru.drm.scada.adapter.lua;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.usecase.LuaParser;
import ru.drm.scada.usecase.LuaParserException;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;
import java.util.List;

/**
 * Простейший парсер Lua-скрипта.
 * MVP: читает целый файл как один блок логики без детального разбора.
 * В дальнейшем можно заменить на полноценный парсер Lua или DSL.
 */
public class SimpleLuaParser implements LuaParser {

    @Override
    public List<ControlLogic> parse(Path luaPath) throws LuaParserException {
        if (luaPath == null || !Files.exists(luaPath)) {
            throw new LuaParserException("Lua file does not exist: " + luaPath);
        }

        try {
            String code = Files.readString(luaPath, StandardCharsets.UTF_8);
            ControlLogic logic = new ControlLogic();
            logic.setId(luaPath.getFileName().toString());
            logic.setName("MainLogic");
            logic.setLuaCode(code);
            // TODO: извлечь участвующие теги и логику, разбить на несколько ControlLogic
            return Collections.singletonList(logic);
        } catch (IOException e) {
            throw new LuaParserException("Failed to read Lua file: " + luaPath, e);
        }
    }
}

