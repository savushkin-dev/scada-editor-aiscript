package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class UnitsScriptParserTest {

    @Test
    void parseUnitNames_extractsNamesFromBeginMarkers(@TempDir Path dir) throws Exception {
        String content = """
            //--------------- Begin: ALPMAGW5AI480512 ---------------;
            //--------------- End: ALPMAGW5AI480512 ---------------;
            //--------------- Begin: ALPMAGW5DI1 ---------------;
            function extern OnChangeM(Self);
            endf;
            //--------------- End: ALPMAGW5DI1 ---------------;
            //--------------- Begin: LA_TANK1AO11 ---------------;
            //--------------- End: LA_TANK1AO11 ---------------;
            """;
        Path script = dir.resolve("Units.script");
        Files.writeString(script, content);

        Set<String> names = UnitsScriptParser.parseUnitNames(script);

        assertEquals(3, names.size());
        assertTrue(names.contains("ALPMAGW5AI480512"));
        assertTrue(names.contains("ALPMAGW5DI1"));
        assertTrue(names.contains("LA_TANK1AO11"));
    }

    @Test
    void parseUnitNames_whenFileNotExists_returnsEmpty() throws Exception {
        Set<String> names = UnitsScriptParser.parseUnitNames(Path.of("nonexistent.script"));
        assertTrue(names.isEmpty());
    }
}
