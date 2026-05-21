package ru.drm.scada.usecase;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Отчёт инкрементального обновления проекта.
 */
public final class DeltaUpdateReport {

    private final List<String> unitsAdded = new ArrayList<>();
    private final List<String> unitsSkipped = new ArrayList<>();
    private final List<String> handlersAdded = new ArrayList<>();
    private final List<String> handlersSkipped = new ArrayList<>();
    private final List<String> unknownTypeTags = new ArrayList<>();
    private final List<String> matchedNoHandlersTags = new ArrayList<>();

    public void addUnit(String name) {
        unitsAdded.add(name);
    }

    public void skipUnit(String name) {
        unitsSkipped.add(name);
    }

    public void addHandler(String name) {
        handlersAdded.add(name);
    }

    public void skipHandler(String name) {
        handlersSkipped.add(name);
    }

    public void unknownType(String tagId) {
        unknownTypeTags.add(tagId);
    }

    public void matchedNoHandlers(String tagId) {
        matchedNoHandlersTags.add(tagId);
    }

    public List<String> getUnitsAdded() {
        return Collections.unmodifiableList(unitsAdded);
    }

    public List<String> getUnitsSkipped() {
        return Collections.unmodifiableList(unitsSkipped);
    }

    public List<String> getHandlersAdded() {
        return Collections.unmodifiableList(handlersAdded);
    }

    public List<String> getHandlersSkipped() {
        return Collections.unmodifiableList(handlersSkipped);
    }

    public List<String> getUnknownTypeTags() {
        return Collections.unmodifiableList(unknownTypeTags);
    }

    public List<String> getMatchedNoHandlers() {
        return Collections.unmodifiableList(matchedNoHandlersTags);
    }

    public String toLogText() {
        StringBuilder sb = new StringBuilder();
        appendSection(sb, "units.added", unitsAdded);
        appendSection(sb, "units.skipped", unitsSkipped);
        appendSection(sb, "handlers.added", handlersAdded);
        appendSection(sb, "handlers.skipped", handlersSkipped);
        appendSection(sb, "matched_no_handlers", matchedNoHandlersTags);
        appendSection(sb, "unknown_type", unknownTypeTags);
        return sb.toString();
    }

    private static void appendSection(StringBuilder sb, String key, List<String> items) {
        sb.append(key).append('=').append(items.size()).append('\n');
        for (String item : items) {
            sb.append("  ").append(item).append('\n');
        }
    }
}
