package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;

import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class AiLuaTagValidatorTest {

    @Test
    void filterValid_acceptsTagIds_rejectsGarbage() {
        var result = AiLuaTagValidator.filterValid(Set.of("MCA4LINE3DI1", "bad tag!", "", "123"));
        assertEquals(1, result.size());
        assertTrue(result.contains("MCA4LINE3DI1"));
    }
}
