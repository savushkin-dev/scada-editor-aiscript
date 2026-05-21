package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Каталог обработчиков Monitor: индекс по имени и по нормализованному паттерну (цифры → #).
 */
public final class HandlerTemplateCatalog {

    private static final Pattern LINE_P_PATTERN = Pattern.compile("OnClickR_L(\\d{2})_P(\\d{2})");

    private final Map<String, MonitorHandler> byName;
    private final Map<String, List<MonitorHandler>> byPattern;

    public HandlerTemplateCatalog(List<MonitorHandler> handlers) {
        Map<String, MonitorHandler> names = new LinkedHashMap<>();
        Map<String, List<MonitorHandler>> patterns = new LinkedHashMap<>();
        for (MonitorHandler h : handlers) {
            names.put(h.getName(), h);
            String pattern = normalizeNamePattern(h.getName());
            patterns.computeIfAbsent(pattern, k -> new ArrayList<>()).add(h);
        }
        this.byName = Collections.unmodifiableMap(names);
        this.byPattern = Collections.unmodifiableMap(patterns);
    }

    public static HandlerTemplateCatalog load(Path scriptsPath) throws IOException {
        return new HandlerTemplateCatalog(MonitorScriptsParser.parse(scriptsPath));
    }

    public Optional<MonitorHandler> findByName(String name) {
        return Optional.ofNullable(byName.get(name));
    }

    public List<MonitorHandler> findByPattern(String normalizedPattern) {
        return byPattern.getOrDefault(normalizedPattern, List.of());
    }

    /**
     * Эталон для семейства: для OnClickR_L##_P## — вариант с минимальным номером линии (обычно L01).
     */
    public Optional<MonitorHandler> findCanonicalForPattern(String normalizedPattern) {
        List<MonitorHandler> family = findByPattern(normalizedPattern);
        if (family.isEmpty()) {
            return Optional.empty();
        }
        return family.stream()
                .min(this::compareLinePreference)
                .or(() -> Optional.of(family.get(0)));
    }

    public int handlerCount() {
        return byName.size();
    }

    /**
     * Имена обработчиков по шаблону с плейсхолдерами и суффиксом * (любой хвост).
     * Пример: OnClickR_LI{li}_M02_P03_T* + li=02 → все OnClickR_LI02_M02_P03_T01…
     */
    public List<String> findNamesMatchingPattern(String pattern, Map<String, String> placeholders) {
        String prefix = HandlerMappingRegistry.applyPlaceholders(pattern, placeholders);
        boolean wildcard = prefix.endsWith("*");
        String base = wildcard ? prefix.substring(0, prefix.length() - 1) : prefix;
        List<String> names = new ArrayList<>();
        for (String name : byName.keySet()) {
            if (wildcard) {
                if (name.startsWith(base)) {
                    names.add(name);
                }
            } else if (name.equals(base)) {
                names.add(name);
            }
        }
        Collections.sort(names);
        return names;
    }

    /**
     * OnClickR_L01_P03 → OnClickR_L#_P#
     */
    public static String normalizeNamePattern(String handlerName) {
        if (handlerName == null || handlerName.isEmpty()) {
            return handlerName;
        }
        return handlerName.replaceAll("\\d+", "#");
    }

    private int compareLinePreference(MonitorHandler a, MonitorHandler b) {
        int lineA = extractLineNumber(a.getName()).orElse(Integer.MAX_VALUE);
        int lineB = extractLineNumber(b.getName()).orElse(Integer.MAX_VALUE);
        return Integer.compare(lineA, lineB);
    }

    private static Optional<Integer> extractLineNumber(String handlerName) {
        Matcher m = LINE_P_PATTERN.matcher(handlerName);
        if (m.find()) {
            return Optional.of(Integer.parseInt(m.group(1)));
        }
        return Optional.empty();
    }
}
