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

import static org.junit.jupiter.api.Assertions.*;

class IncrementalUnitsUpdaterTest {

    @Test
    void update_whenNoExistingFile_createsUnitsXml(@TempDir Path projectDir) throws Exception {
        ProjectModel model = modelWithTags("TAG1", "TAG2");
        var updater = new IncrementalUnitsUpdater(new MonitorUnitsGenerator());

        updater.update(model, projectDir, projectDir.resolve("meta"));

        assertTrue(Files.exists(projectDir.resolve("Units.xml")));
        String xml = Files.readString(projectDir.resolve("Units.xml"));
        assertTrue(xml.contains("<name>TAG1</name>"));
        assertTrue(xml.contains("<name>TAG2</name>"));
    }

    @Test
    void update_whenExistingFile_addsOnlyNewUnits(@TempDir Path projectDir) throws Exception {
        ProjectModel initial = modelWithTags("EXISTING1", "EXISTING2");
        new MonitorUnitsGenerator().generate(initial, projectDir);

        ProjectModel updated = modelWithTags("EXISTING1", "EXISTING2", "NEW1", "NEW2");
        var updater = new IncrementalUnitsUpdater(new MonitorUnitsGenerator());
        updater.update(updated, projectDir, projectDir.resolve("meta"));

        String xml = Files.readString(projectDir.resolve("Units.xml"));
        assertTrue(xml.contains("<name>EXISTING1</name>"));
        assertTrue(xml.contains("<name>EXISTING2</name>"));
        assertTrue(xml.contains("<name>NEW1</name>"));
        assertTrue(xml.contains("<name>NEW2</name>"));
    }

    @Test
    void update_whenNoNewUnits_doesNotModifyFile(@TempDir Path projectDir) throws Exception {
        ProjectModel model = modelWithTags("A", "B");
        new MonitorUnitsGenerator().generate(model, projectDir);
        String before = Files.readString(projectDir.resolve("Units.xml"));

        var updater = new IncrementalUnitsUpdater(new MonitorUnitsGenerator());
        updater.update(model, projectDir, projectDir.resolve("meta"));

        String after = Files.readString(projectDir.resolve("Units.xml"));
        assertEquals(before, after);
    }

    private static ProjectModel modelWithTags(String... tagIds) {
        ProjectModel m = new ProjectModel();
        Equipment eq = new Equipment();
        eq.setId("eq1");
        eq.setType(EquipmentType.UNIT);
        for (String id : tagIds) {
            Tag t = new Tag(id, id, TagType.INTERNAL, "lua", null);
            eq.getTags().add(t);
        }
        m.setEquipments(java.util.List.of(eq));
        return m;
    }
}
