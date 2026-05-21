package ru.drm.scada.generator;

import ru.drm.scada.domain.MonitorHandler;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Форматирование фрагментов Units.script (flat / blocks).
 */
public final class UnitsScriptWriter {

    private UnitsScriptWriter() {
    }

    public static String formatHandlers(
            List<MonitorHandler> handlers,
            UnitsScriptFormat format,
            String unitIdForBlock) {
        if (handlers == null || handlers.isEmpty()) {
            return "";
        }
        if (format == UnitsScriptFormat.BLOCKS && unitIdForBlock != null) {
            return formatBlock(unitIdForBlock, handlers);
        }
        StringBuilder sb = new StringBuilder();
        for (MonitorHandler h : handlers) {
            sb.append(h.toScriptSource()).append('\n');
        }
        return sb.toString();
    }

    public static String formatHandlersGroupedByUnit(
            Map<String, List<MonitorHandler>> byUnit,
            UnitsScriptFormat format) {
        if (byUnit == null || byUnit.isEmpty()) {
            return "";
        }
        if (format == UnitsScriptFormat.FLAT) {
            List<MonitorHandler> flat = new ArrayList<>();
            byUnit.values().forEach(flat::addAll);
            return formatHandlers(flat, UnitsScriptFormat.FLAT, null);
        }
        StringBuilder sb = new StringBuilder();
        for (var e : byUnit.entrySet()) {
            sb.append(formatBlock(e.getKey(), e.getValue()));
        }
        return sb.toString();
    }

    private static String formatBlock(String unitId, List<MonitorHandler> handlers) {
        StringBuilder sb = new StringBuilder();
        sb.append("//--------------- Begin: ").append(unitId).append(" ---------------;\n");
        for (MonitorHandler h : handlers) {
            sb.append(h.toScriptSource()).append('\n');
        }
        sb.append("//--------------- End: ").append(unitId).append(" ---------------;\n");
        return sb.toString();
    }

    public static Map<String, List<MonitorHandler>> groupByUnit(
            Map<String, List<MonitorHandler>> tagToHandlers) {
        Map<String, List<MonitorHandler>> grouped = new LinkedHashMap<>();
        if (tagToHandlers == null) {
            return grouped;
        }
        for (var e : tagToHandlers.entrySet()) {
            grouped.merge(e.getKey(), new ArrayList<>(e.getValue()), (a, b) -> {
                a.addAll(b);
                return a;
            });
        }
        return grouped;
    }
}
