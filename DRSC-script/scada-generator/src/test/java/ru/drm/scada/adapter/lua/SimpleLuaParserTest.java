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
        String content = ""
                + "print('hello from lua')\n"
                + "local x = DI(\"TAG_DI_1\")\n"
                + "local y = DO(\"TAG_DO_1\")\n"
                + "local a = AI(\"TAG_AI_1\")\n"
                + "local b = AO(\"TAG_AO_1\")\n";
        Files.writeString(tempFile, content, StandardCharsets.UTF_8);

        LuaParser parser = new SimpleLuaParser();
        List<ControlLogic> logics = parser.parse(tempFile);

        assertNotNull(logics);
        assertEquals(1, logics.size());
        ControlLogic logic = logics.get(0);
        assertNotNull(logic.getLuaCode());
        assertFalse(logic.getLuaCode().isEmpty());
        assertNotNull(logic.getTagIds());
        assertEquals(4, logic.getTagIds().size());
        // Порядок сохраняется за счёт LinkedHashSet в парсере
        assertEquals("TAG_DI_1", logic.getTagIds().get(0));
    }
}

