package ru.drm.scada.usecase;

import java.util.Set;

/**
 * ИИ-анализатор Lua-кода для извлечения тегов (DI/DO/AI/AO).
 * Дополняет regex-парсер: находит динамические конструкции, конкатенации, переменные.
 */
public interface AiLuaAnalyzer {

    /**
     * Извлекает дополнительные имена тегов из Lua-кода.
     *
     * @param luaCode исходный код Lua
     * @return дополнительные tag IDs, которые не нашёл regex-парсер (могут пересекаться с уже известными)
     */
    Set<String> extractAdditionalTags(String luaCode);
}
