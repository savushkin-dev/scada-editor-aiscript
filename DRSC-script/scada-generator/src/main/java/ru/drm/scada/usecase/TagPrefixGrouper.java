package ru.drm.scada.usecase;

import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.EquipmentType;
import ru.drm.scada.domain.Tag;
import ru.drm.scada.domain.TagType;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Группирует идентификаторы тегов из Lua по префиксам.
 * Правило: один префикс (ALPMAGW5, LA_TANK1, BRN3, P4790) = один Equipment.
 */
public final class TagPrefixGrouper {

    private TagPrefixGrouper() {
    }

    /**
     * Паттерн: DI, DO, AI, AO как отдельные токены (на границе слова).
     * Используем для извлечения префикса: всё перед DI|DO|AI|AO = equipment.
     */
    private static final Pattern IO_PREFIX = Pattern.compile("^(.+?)(DI|DO|AI|AO)(.*)$", Pattern.CASE_INSENSITIVE);

    /**
     * Паттерн для тегов вида P4790V1, LA_TANK1V2 — префикс до V + цифры.
     */
    private static final Pattern VALVE_PREFIX = Pattern.compile("^(.+?)(V\\d+)$", Pattern.CASE_INSENSITIVE);

    /**
     * Строит Equipment из набора идентификаторов тегов.
     * Каждый tagId становится Tag, сгруппированным по equipment (prefix).
     */
    public static List<Equipment> buildEquipmentsFromTagIds(Collection<String> tagIds) {
        if (tagIds == null || tagIds.isEmpty()) {
            return Collections.emptyList();
        }

        Map<String, List<Tag>> byEquipment = new LinkedHashMap<>();

        for (String tagId : tagIds) {
            if (tagId == null || tagId.trim().isEmpty()) {
                continue;
            }
            String id = tagId.trim();
            String equipmentId = extractEquipmentPrefix(id);
            Tag tag = createTag(id);
            byEquipment.computeIfAbsent(equipmentId, k -> new ArrayList<>()).add(tag);
        }

        List<Equipment> result = new ArrayList<>();
        for (Map.Entry<String, List<Tag>> e : byEquipment.entrySet()) {
            Equipment eq = new Equipment();
            eq.setId(e.getKey());
            eq.setName(e.getKey());
            eq.setType(EquipmentType.UNIT);
            eq.setTags(e.getValue());
            result.add(eq);
        }
        return result;
    }

    /**
     * Извлекает префикс оборудования из идентификатора тега.
     * Примеры: ALPMAGW5DI488511 -> ALPMAGW5, LA_TANK1AO11 -> LA_TANK1, BRN3DI11 -> BRN3, P4790V1 -> P4790.
     */
    public static String extractEquipmentPrefix(String tagId) {
        if (tagId == null || tagId.isEmpty()) {
            return "unknown";
        }

        Matcher m = IO_PREFIX.matcher(tagId);
        if (m.matches()) {
            return m.group(1);
        }

        m = VALVE_PREFIX.matcher(tagId);
        if (m.matches()) {
            return m.group(1);
        }

        return tagId;
    }

    /**
     * Определяет TagType по идентификатору тега (DI/DO/AI/AO).
     * DI/DO/AI/AO не должны быть частью другого слова (цифры по бокам — ок).
     */
    public static TagType inferTagType(String tagId) {
        if (tagId == null) {
            return TagType.INTERNAL;
        }
        if (tagId.matches("(?i).*(?<![A-Za-z])DI(?![A-Za-z]).*")) return TagType.DIGITAL_INPUT;
        if (tagId.matches("(?i).*(?<![A-Za-z])DO(?![A-Za-z]).*")) return TagType.DIGITAL_OUTPUT;
        if (tagId.matches("(?i).*(?<![A-Za-z])AI(?![A-Za-z]).*")) return TagType.ANALOG_INPUT;
        if (tagId.matches("(?i).*(?<![A-Za-z])AO(?![A-Za-z]).*")) return TagType.ANALOG_OUTPUT;
        return TagType.INTERNAL;
    }

    private static Tag createTag(String tagId) {
        Tag tag = new Tag();
        tag.setId(tagId);
        tag.setName(tagId);
        tag.setType(inferTagType(tagId));
        tag.setSource("lua");
        return tag;
    }
}
