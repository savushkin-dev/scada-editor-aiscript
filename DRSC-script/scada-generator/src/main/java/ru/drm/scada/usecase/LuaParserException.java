package ru.drm.scada.usecase;

/**
 * Ошибка разбора Lua-скриптов.
 */
public class LuaParserException extends RuntimeException {

    public LuaParserException(String message) {
        super(message);
    }

    public LuaParserException(String message, Throwable cause) {
        super(message, cause);
    }
}

