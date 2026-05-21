package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Разрешение имени обработчика в MonitorHandler по каталогу scripts.txt.
 * Универсальный путь: точное имя → подстановка линии LI → нормализованный паттерн.
 */
public final class HandlerTemplateResolver {

    private static final Pattern CLICK_L_P = Pattern.compile("OnClickR_L(\\d{2})_P(\\d{2})");
    private static final Pattern COLOR_L_P = Pattern.compile("OnGetColorR_L(\\d{2})_P(\\d{2})");

    private HandlerTemplateResolver() {
    }

    public static Optional<MonitorHandler> resolve(HandlerTemplateCatalog catalog, String targetName) {
        Optional<MonitorHandler> existing = catalog.findByName(targetName);
        if (existing.isPresent()) {
            return existing;
        }
        var click = CLICK_L_P.matcher(targetName);
        if (click.matches()) {
            int line = Integer.parseInt(click.group(1));
            String canonical = "OnClickR_L01_P" + click.group(2);
            return HandlerTemplateExpander.expandFromCanonical(catalog, canonical, line);
        }
        var color = COLOR_L_P.matcher(targetName);
        if (color.matches()) {
            int line = Integer.parseInt(color.group(1));
            String canonical = "OnGetColorR_L01_P" + color.group(2);
            return catalog.findByName(canonical)
                    .map(t -> HandlerTemplateExpander.withName(
                            t, t.getName().replaceFirst("L\\d{2}", "L" + String.format("%02d", line))));
        }
        return resolveByNormalizedPattern(catalog, targetName);
    }

    private static Optional<MonitorHandler> resolveByNormalizedPattern(
            HandlerTemplateCatalog catalog,
            String targetName) {
        String pattern = HandlerTemplateCatalog.normalizeNamePattern(targetName);
        return catalog.findCanonicalForPattern(pattern)
                .map(t -> HandlerTemplateExpander.withName(t, targetName));
    }
}
