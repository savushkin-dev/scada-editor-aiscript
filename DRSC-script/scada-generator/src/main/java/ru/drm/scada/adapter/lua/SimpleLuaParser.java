package ru.drm.scada.adapter.lua;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.usecase.LuaParser;
import ru.drm.scada.usecase.LuaParserException;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

            // MVP+: извлекаем имена тегов из вызовов DI/DO/AI/AO("TAG_NAME")
            Set<String> tagIds = extractTagIds(code);
            logic.setTagIds(new ArrayList<>(tagIds));

            // TODO: разбить большую логику на несколько ControlLogic при необходимости
            return Collections.singletonList(logic);
        } catch (IOException e) {
            throw new LuaParserException("Failed to read Lua file: " + luaPath, e);
        }
    }

    /**
     * Ищет в тексте Lua вызовы DI/DO/AI/AO(\"TAG_NAME\") и возвращает набор имён тегов.
     */
    private Set<String> extractTagIds(String code) {
        if (code == null || code.isEmpty()) {
            return Collections.emptySet();
        }
        // Примеры совпадений:
        //   DI("ALPMAGW5DI48051203")
        //   DO ('TAG')
        //   AI( \"TAG\" )
        //   AO( \"ALPMAGW5DI\"..self.ALPMA_ID..\"03\" )  -> вытащим только префикс \"ALPMAGW5DI\"
        Pattern pattern = Pattern.compile("\\b(DI|DO|AI|AO)\\s*\\(\\s*([\"'])([^\"']+)\\2\\s*\\)");
        Matcher matcher = pattern.matcher(code);

        Set<String> result = new LinkedHashSet<>();
        while (matcher.find()) {
            String tagName = matcher.group(3);
            if (tagName != null && !tagName.isEmpty()) {
                result.add(tagName);
            }
        }
        return result;
    }
}

