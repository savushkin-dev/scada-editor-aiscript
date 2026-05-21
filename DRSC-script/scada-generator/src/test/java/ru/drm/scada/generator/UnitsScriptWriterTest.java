package ru.drm.scada.generator;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.MonitorHandler;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UnitsScriptWriterTest {

    @Test
    void formatBlock_wrapsHandlers() {
        MonitorHandler h = new MonitorHandler("OnChangeM", "Self", "if true; end;");
        String text = UnitsScriptWriter.formatHandlers(List.of(h), UnitsScriptFormat.BLOCKS, "UNIT1");
        assertTrue(text.contains("Begin: UNIT1"));
        assertTrue(text.contains("End: UNIT1"));
        assertTrue(text.contains("OnChangeM"));
    }
}
