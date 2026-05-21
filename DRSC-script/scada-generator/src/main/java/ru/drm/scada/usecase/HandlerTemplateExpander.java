package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Клонирование обработчика: новое имя function extern, тело без изменений.
 */
public final class HandlerTemplateExpander {

    private static final Pattern LINE_P_PATTERN = Pattern.compile("(OnClickR_L)(\\d{2})(_P\\d{2})");

    private HandlerTemplateExpander() {
    }

    public static MonitorHandler withName(MonitorHandler template, String targetName) {
        return new MonitorHandler(targetName, template.getParameters(), template.getBody());
    }

    /**
     * OnClickR_L01_P03 + line=5 → OnClickR_L05_P03 (тело из шаблона).
     */
    public static Optional<MonitorHandler> expandLineAndParam(MonitorHandler template, int lineNumber) {
        Matcher m = LINE_P_PATTERN.matcher(template.getName());
        if (!m.find()) {
            return Optional.empty();
        }
        String targetName = m.group(1) + String.format("%02d", lineNumber) + m.group(3);
        return Optional.of(withName(template, targetName));
    }

    public static Optional<MonitorHandler> expandFromCanonical(
            HandlerTemplateCatalog catalog,
            String canonicalName,
            int lineNumber) {
        return catalog.findByName(canonicalName)
                .flatMap(template -> expandLineAndParam(template, lineNumber));
    }
}
