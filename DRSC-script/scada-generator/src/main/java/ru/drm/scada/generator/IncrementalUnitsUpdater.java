package ru.drm.scada.generator;

import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.usecase.DeltaUpdateException;
import ru.drm.scada.usecase.DeltaUpdater;

import org.xml.sax.SAXException;

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
import java.util.HashSet;
import java.util.Set;

/**
 * Инкрементальное обновление Units.xml: добавляет только новые юниты,
 * существующие не трогает (сохраняет ручные правки инженеров).
 */
public class IncrementalUnitsUpdater implements DeltaUpdater {

    public static final String UNITS_FILE = "Units.xml";

    private final MonitorUnitsGenerator generator;

    public IncrementalUnitsUpdater(MonitorUnitsGenerator generator) {
        this.generator = generator;
    }

    @Override
    public void update(ProjectModel newModel, Path existingProjectDir, Path metadataStore)
            throws DeltaUpdateException {
        try {
            Path unitsPath = existingProjectDir.resolve(UNITS_FILE);
            Set<String> newUnitNames = collectUnitNamesFromModel(newModel);

            if (!Files.exists(unitsPath)) {
                generator.generate(newModel, existingProjectDir);
                return;
            }

            Set<String> existingNames = parseExistingUnitNames(unitsPath);
            Set<String> toAdd = new HashSet<>(newUnitNames);
            toAdd.removeAll(existingNames);

            if (toAdd.isEmpty()) {
                return;
            }

            mergeNewUnitsIntoFile(unitsPath, toAdd);
        } catch (IOException | ParserConfigurationException | SAXException | TransformerException e) {
            throw new DeltaUpdateException("Failed to incrementally update Units.xml", e);
        }
    }

    private Set<String> collectUnitNamesFromModel(ProjectModel model) {
        Set<String> names = new HashSet<>();
        for (Equipment eq : model.getEquipments()) {
            if (eq.getTags() == null) continue;
            for (Tag tag : eq.getTags()) {
                String id = tag.getId();
                if (id != null && !id.isEmpty()) names.add(id);
            }
        }
        return names;
    }

    public Set<String> parseExistingUnitNamesPublic(Path unitsPath)
            throws ParserConfigurationException, IOException, SAXException {
        return parseExistingUnitNames(unitsPath);
    }

    private Set<String> parseExistingUnitNames(Path unitsPath)
            throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        var doc = builder.parse(Files.newInputStream(unitsPath));
        var nameNodes = doc.getElementsByTagName("name");
        Set<String> names = new HashSet<>();
        for (int i = 0; i < nameNodes.getLength(); i++) {
            var node = nameNodes.item(i);
            if (node.getParentNode() != null && "unit".equals(node.getParentNode().getNodeName())) {
                String text = node.getTextContent();
                if (text != null && !text.trim().isEmpty()) {
                    names.add(text.trim());
                }
            }
        }
        return names;
    }

    private void mergeNewUnitsIntoFile(Path unitsPath, Set<String> toAdd)
            throws ParserConfigurationException, IOException, SAXException, TransformerException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        var existingDoc = builder.parse(Files.newInputStream(unitsPath));
        var root = existingDoc.getElementsByTagName("units").item(0);
        if (root == null) {
            throw new DeltaUpdateException("Invalid Units.xml: no <units> root");
        }

        var newUnitsDoc = generator.createUnitsDocumentForNames(toAdd);
        var newRoot = newUnitsDoc.getElementsByTagName("units").item(0);
        if (newRoot == null) return;

        var newUnits = newRoot.getChildNodes();
        for (int i = 0; i < newUnits.getLength(); i++) {
            var child = newUnits.item(i);
            if (child.getNodeType() == org.w3c.dom.Node.ELEMENT_NODE
                    && "unit".equals(child.getNodeName())) {
                var imported = existingDoc.importNode(child, true);
                root.appendChild(imported);
            }
        }

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = tf.newTransformer();
        t.setOutputProperty(OutputKeys.INDENT, "yes");
        t.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
        t.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        t.setOutputProperty(OutputKeys.STANDALONE, "yes");
        t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
        t.transform(new DOMSource(existingDoc), new StreamResult(unitsPath.toFile()));
    }
}
