package ru.drm.scada.generator;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.EquipmentType;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.domain.TagType;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class MonitorUnitsGeneratorTest {

    @Test
    void generate_createsUnitsXml(@TempDir Path outputDir) throws Exception {
        ProjectModel model = new ProjectModel();
        model.setProjectId("test");

        Equipment eq = new Equipment();
        eq.setId("ALPMAGW5");
        eq.setName("ALPMAGW5");
        eq.setType(EquipmentType.UNIT);
        Tag t1 = new Tag("ALPMAGW5AI480512", "ALPMAGW5AI480512", TagType.ANALOG_INPUT, "lua", null);
        Tag t2 = new Tag("ALPMAGW5DI488511", "ALPMAGW5DI488511", TagType.DIGITAL_INPUT, "lua", null);
        eq.setTags(List.of(t1, t2));
        model.setEquipments(List.of(eq));

        new MonitorUnitsGenerator().generate(model, outputDir);

        Path unitsFile = outputDir.resolve("Units.xml");
        assertTrue(Files.exists(unitsFile));
        String xml = Files.readString(unitsFile);
        assertTrue(xml.contains("<name>ALPMAGW5AI480512</name>"));
        assertTrue(xml.contains("<name>ALPMAGW5DI488511</name>"));
        assertTrue(xml.contains("<typename>wg</typename>"));
    }
}
