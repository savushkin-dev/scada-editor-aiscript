package ru.drm.scada.generator;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.ProjectModel;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertTrue;

class XmlProjectGeneratorTest {

    @Test
    void generate_shouldCreateProjectXmlFile() throws IOException {
        Path tempDir = Files.createTempDirectory("scada-project-test");

        ProjectModel model = new ProjectModel();
        model.setProjectId("test-project");

        Equipment eq = new Equipment();
        eq.setId("eq1");
        eq.setName("Pump 1");
        model.setEquipments(Collections.singletonList(eq));

        ControlLogic logic = new ControlLogic();
        logic.setId("logic1");
        logic.setName("MainLogic");
        logic.setLuaCode("print('test')");
        model.setControlLogics(Collections.singletonList(logic));

        XmlProjectGenerator generator = new XmlProjectGenerator();
        generator.generate(model, tempDir);

        Path projectXml = tempDir.resolve("project.xml");
        assertTrue(Files.exists(projectXml), "project.xml should be created");
        assertTrue(Files.size(projectXml) > 0, "project.xml should not be empty");
    }
}

