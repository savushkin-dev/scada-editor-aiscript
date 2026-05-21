package ru.drm.scada.usecase;

import org.junit.jupiter.api.Test;
import ru.drm.scada.domain.Equipment;
import ru.drm.scada.domain.TagType;

import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class TagPrefixGrouperTest {

    @Test
    void extractEquipmentPrefix_ioTags() {
        assertEquals("ALPMAGW5", TagPrefixGrouper.extractEquipmentPrefix("ALPMAGW5DI488511"));
        assertEquals("LA_TANK1", TagPrefixGrouper.extractEquipmentPrefix("LA_TANK1AO11"));
        assertEquals("BRN3", TagPrefixGrouper.extractEquipmentPrefix("BRN3DI11"));
        assertEquals("BERTSCH_MOZ_GW1", TagPrefixGrouper.extractEquipmentPrefix("BERTSCH_MOZ_GW1DI1"));
    }

    @Test
    void extractEquipmentPrefix_valveTags() {
        assertEquals("P4790", TagPrefixGrouper.extractEquipmentPrefix("P4790V1"));
        assertEquals("F_BRINE_IN1", TagPrefixGrouper.extractEquipmentPrefix("F_BRINE_IN1V1"));
    }

    @Test
    void inferTagType() {
        assertEquals(TagType.DIGITAL_INPUT, TagPrefixGrouper.inferTagType("ALPMAGW5DI488511"));
        assertEquals(TagType.DIGITAL_OUTPUT, TagPrefixGrouper.inferTagType("ALPMAGW5DO1"));
        assertEquals(TagType.ANALOG_INPUT, TagPrefixGrouper.inferTagType("ALPMAGW5AI480512"));
        assertEquals(TagType.ANALOG_OUTPUT, TagPrefixGrouper.inferTagType("LA_TANK1AO11"));
        assertEquals(TagType.INTERNAL, TagPrefixGrouper.inferTagType("P4790V1"));
    }

    @Test
    void buildEquipmentsFromTagIds() {
        List<Equipment> eqs = TagPrefixGrouper.buildEquipmentsFromTagIds(Set.of(
                "ALPMAGW5DI488511",
                "ALPMAGW5AI480512",
                "LA_TANK1AO11",
                "BRN3DI11"
        ));

        assertEquals(3, eqs.size());
        Equipment alpma = eqs.stream().filter(e -> "ALPMAGW5".equals(e.getId())).findFirst().orElseThrow();
        assertEquals(2, alpma.getTags().size());
        assertTrue(alpma.getTags().stream().anyMatch(t -> "ALPMAGW5DI488511".equals(t.getId())));
        assertTrue(alpma.getTags().stream().anyMatch(t -> "ALPMAGW5AI480512".equals(t.getId())));
    }
}
