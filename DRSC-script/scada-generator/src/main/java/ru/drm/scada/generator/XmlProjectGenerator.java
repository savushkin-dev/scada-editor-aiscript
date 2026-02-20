package ru.drm.scada.generator;

import ru.drm.scada.domain.ControlLogic;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.usecase.ProjectGenerationException;
import ru.drm.scada.usecase.ProjectGenerator;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * Простейший генератор XML SCADA-проекта.
 * MVP: создаёт один файл project.xml с минимальной структурой.
 * В дальнейшем структуру можно адаптировать под конкретную SCADA-систему.
 */
public class XmlProjectGenerator implements ProjectGenerator {

    @Override
    public void generate(ProjectModel model, Path outputDirectory) throws ProjectGenerationException {
        try {
            if (!Files.exists(outputDirectory)) {
                Files.createDirectories(outputDirectory);
            }

            Path projectFile = outputDirectory.resolve("project.xml");

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            org.w3c.dom.Document doc = builder.newDocument();

            org.w3c.dom.Element root = doc.createElement("ScadaProject");
            root.setAttribute("id", model.getProjectId() != null ? model.getProjectId() : "unknown");
            doc.appendChild(root);

            org.w3c.dom.Element equipmentsEl = doc.createElement("Equipments");
            root.appendChild(equipmentsEl);
            for (Equipment eq : model.getEquipments()) {
                org.w3c.dom.Element eqEl = doc.createElement("Equipment");
                eqEl.setAttribute("id", eq.getId());
                eqEl.setAttribute("name", eq.getName());
                if (eq.getType() != null) {
                    eqEl.setAttribute("type", eq.getType().name());
                }
                equipmentsEl.appendChild(eqEl);

                org.w3c.dom.Element tagsEl = doc.createElement("Tags");
                eqEl.appendChild(tagsEl);
                for (Tag tag : eq.getTags()) {
                    org.w3c.dom.Element tagEl = doc.createElement("Tag");
                    tagEl.setAttribute("id", tag.getId());
                    tagEl.setAttribute("name", tag.getName());
                    if (tag.getType() != null) {
                        tagEl.setAttribute("type", tag.getType().name());
                    }
                    if (tag.getSource() != null) {
                        tagEl.setAttribute("source", tag.getSource());
                    }
                    if (tag.getAddress() != null) {
                        tagEl.setAttribute("address", tag.getAddress());
                    }
                    tagsEl.appendChild(tagEl);
                }
            }

            org.w3c.dom.Element logicsEl = doc.createElement("ControlLogics");
            root.appendChild(logicsEl);
            for (ControlLogic logic : model.getControlLogics()) {
                org.w3c.dom.Element logicEl = doc.createElement("ControlLogic");
                logicEl.setAttribute("id", logic.getId());
                logicEl.setAttribute("name", logic.getName());

                org.w3c.dom.Element codeEl = doc.createElement("LuaCode");
                codeEl.appendChild(doc.createCDATASection(
                        logic.getLuaCode() != null ? logic.getLuaCode() : ""
                ));
                logicEl.appendChild(codeEl);

                logicsEl.appendChild(logicEl);
            }

            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer transformer = tf.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

            try (java.io.OutputStream out = Files.newOutputStream(projectFile)) {
                transformer.transform(new DOMSource(doc), new StreamResult(out));
            }
        } catch (IOException | ParserConfigurationException | TransformerException e) {
            throw new ProjectGenerationException("Failed to generate SCADA project", e);
        }
    }
}

