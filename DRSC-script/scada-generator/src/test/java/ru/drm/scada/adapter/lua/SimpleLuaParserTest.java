package ru.drm.scada.adapter.lua;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.usecase.LuaParser;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

class SimpleLuaParserTest {

    @Test
    void parse_shouldReturnSingleControlLogicWithFileContent() throws IOException {
        Path tempFile = Files.createTempFile("test-logic", ".lua");
        String content = "print('hello from lua')";
        Files.writeString(tempFile, content, StandardCharsets.UTF_8);

        LuaParser parser = new SimpleLuaParser();
        List<ControlLogic> logics = parser.parse(tempFile);

        assertNotNull(logics);
        assertEquals(1, logics.size());
        ControlLogic logic = logics.get(0);
        assertNotNull(logic.getLuaCode());
        assertFalse(logic.getLuaCode().isEmpty());
    }
}

