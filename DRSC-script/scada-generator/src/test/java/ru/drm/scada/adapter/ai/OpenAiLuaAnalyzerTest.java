package ru.drm.scada.adapter.ai;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class OpenAiLuaAnalyzerTest {

    @Test
    void extractAdditionalTags_whenNoApiKey_returnsEmpty() {
        var analyzer = new OpenAiLuaAnalyzer(null);
        assertTrue(analyzer.extractAdditionalTags("DI(\"TAG1\")").isEmpty());
    }

    @Test
    void extractAdditionalTags_whenEmptyCode_returnsEmpty() {
        var analyzer = new OpenAiLuaAnalyzer("key");
        assertTrue(analyzer.extractAdditionalTags("").isEmpty());
        assertTrue(analyzer.extractAdditionalTags(null).isEmpty());
    }
}
