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
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.Collection;
import java.util.List;

/**
 * Генератор Units.xml в формате Monitor/PTUSA.
 * Каждый тег из Lua (ALPMAGW5AI480512 и т.п.) становится одним &lt;unit&gt; с именем = id тега.
 */
public class MonitorUnitsGenerator implements ProjectGenerator {

    private static final String TYPENAME_WG = "wg";
    private static final String ENCODING = "utf-8";

    @Override
    public void generate(ProjectModel model, Path outputDirectory) throws ProjectGenerationException {
        try {
            if (!Files.exists(outputDirectory)) {
                Files.createDirectories(outputDirectory);
            }

            Path unitsFile = outputDirectory.resolve("Units.xml");
            org.w3c.dom.Document doc = createUnitsDocument(model);
            writeXml(doc, unitsFile);
        } catch (IOException | ParserConfigurationException | TransformerException e) {
            throw new ProjectGenerationException("Failed to generate Units.xml", e);
        }
    }

    private org.w3c.dom.Document createUnitsDocument(ProjectModel model)
            throws ParserConfigurationException {
        Set<String> names = new HashSet<>();
        for (Equipment eq : model.getEquipments()) {
            if (eq.getTags() == null) continue;
            for (Tag tag : eq.getTags()) {
                String id = tag.getId();
                if (id != null && !id.isEmpty()) names.add(id);
            }
        }

        Map<String, List<ControlLogic>> logicsByTagId = groupLogicsByTagId(model);

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        org.w3c.dom.Document doc = builder.newDocument();
        org.w3c.dom.Element root = doc.createElement("units");
        doc.appendChild(root);

        for (String name : names) {
            if (name != null && !name.isEmpty()) {
                List<ControlLogic> logics = logicsByTagId.get(name);
                root.appendChild(createUnitElement(doc, name, logics));
            }
        }
        return doc;
    }

    /**
     * Создаёт DOM-документ Units.xml для набора имён юнитов.
     * Используется при инкрементальном обновлении.
     * В этом варианте логика не добавляется, чтобы не усложнять merge.
     */
    org.w3c.dom.Document createUnitsDocumentForNames(Collection<String> unitNames)
            throws ParserConfigurationException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        org.w3c.dom.Document doc = builder.newDocument();
        org.w3c.dom.Element root = doc.createElement("units");
        doc.appendChild(root);
        for (String name : unitNames) {
            if (name != null && !name.isEmpty()) {
                root.appendChild(createUnitElement(doc, name, null));
            }
        }
        return doc;
    }

    private org.w3c.dom.Element createUnitElement(org.w3c.dom.Document doc,
                                                  String unitName,
                                                  List<ControlLogic> logics) {
        org.w3c.dom.Element unit = doc.createElement("unit");

        appendElement(doc, unit, "name", unitName);
        appendElement(doc, unit, "typename", TYPENAME_WG);
        appendElement(doc, unit, "isdynamic", "False");
        appendElement(doc, unit, "framepos", "-1");

        org.w3c.dom.Element propsList = doc.createElement("propertieslist");
        propsList.appendChild(createProperty(doc, "M", "Ручной режим", 1, 1, "0"));
        propsList.appendChild(createProperty(doc, "P_MAX_V", "Максимальное значение", 1, 1, "0"));
        propsList.appendChild(createProperty(doc, "P_MIN_V", "Минимальное значение", 1, 1, "0"));
        propsList.appendChild(createProperty(doc, "ST", "Состояние", 1, 1, "0"));
        propsList.appendChild(createProperty(doc, "V", "Значение", 2, 2, "0"));
        unit.appendChild(propsList);

        unit.appendChild(doc.createElement("messageslist"));
        unit.appendChild(doc.createElement("recipeslist"));

        if (logics != null && !logics.isEmpty()) {
            org.w3c.dom.Element logicsEl = doc.createElement("logics");
            for (ControlLogic logic : logics) {
                if (logic == null) continue;
                org.w3c.dom.Element logicEl = doc.createElement("logic");
                if (logic.getId() != null) {
                    logicEl.setAttribute("id", logic.getId());
                }
                if (logic.getName() != null) {
                    logicEl.setAttribute("name", logic.getName());
                }
                org.w3c.dom.Element codeEl = doc.createElement("luacode");
                codeEl.appendChild(doc.createCDATASection(
                        logic.getLuaCode() != null ? logic.getLuaCode() : ""
                ));
                logicEl.appendChild(codeEl);
                logicsEl.appendChild(logicEl);
            }
            if (logicsEl.hasChildNodes()) {
                unit.appendChild(logicsEl);
            }
        }

        return unit;
    }

    private Map<String, List<ControlLogic>> groupLogicsByTagId(ProjectModel model) {
        Map<String, List<ControlLogic>> result = new HashMap<>();
        if (model.getControlLogics() == null) {
            return result;
        }
        for (ControlLogic logic : model.getControlLogics()) {
            if (logic == null || logic.getTagIds() == null) continue;
            for (String tagId : logic.getTagIds()) {
                if (tagId == null || tagId.isEmpty()) continue;
                result.computeIfAbsent(tagId, k -> new java.util.ArrayList<>()).add(logic);
            }
        }
        return result;
    }

    private org.w3c.dom.Element createProperty(org.w3c.dom.Document doc,
                                                String name, String caption,
                                                int propmodel, int proptype, String value) {
        org.w3c.dom.Element p = doc.createElement("property");
        appendElement(doc, p, "name", name);
        appendElement(doc, p, "caption", caption);
        appendElement(doc, p, "visible", "True");
        appendElement(doc, p, "report", "False");
        appendElement(doc, p, "saved", "False");
        appendElement(doc, p, "tagname", "");
        appendElement(doc, p, "propmodel", String.valueOf(propmodel));
        appendElement(doc, p, "proptype", String.valueOf(proptype));
        appendElement(doc, p, "value", value);
        appendElement(doc, p, "channelid", "0");
        appendElement(doc, p, "priority", "5");
        return p;
    }

    private void appendElement(org.w3c.dom.Document doc, org.w3c.dom.Element parent,
                               String tagName, String text) {
        org.w3c.dom.Element el = doc.createElement(tagName);
        el.appendChild(doc.createTextNode(text != null ? text : ""));
        parent.appendChild(el);
    }

    private void writeXml(org.w3c.dom.Document doc, Path path)
            throws TransformerException, IOException {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = tf.newTransformer();
        t.setOutputProperty(OutputKeys.INDENT, "yes");
        t.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
        t.setOutputProperty(OutputKeys.ENCODING, ENCODING);
        t.setOutputProperty(OutputKeys.STANDALONE, "yes");
        t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");

        try (var out = Files.newOutputStream(path)) {
            t.transform(new DOMSource(doc), new StreamResult(out));
        }
    }
}
