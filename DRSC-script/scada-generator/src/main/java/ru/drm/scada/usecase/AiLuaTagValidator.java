package ru.drm.scada.usecase;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * Валидация тегов, предложенных ИИ, перед добавлением в модель.
 */
public final class AiLuaTagValidator {

    private static final Pattern TAG_ID = Pattern.compile("^[A-Za-z][A-Za-z0-9_]{0,63}$");

    private AiLuaTagValidator() {
    }

    public static Set<String> filterValid(Set<String> proposed) {
        if (proposed == null || proposed.isEmpty()) {
            return Set.of();
        }
        Set<String> valid = new LinkedHashSet<>();
        for (String tag : proposed) {
            if (tag != null && TAG_ID.matcher(tag.trim()).matches()) {
                valid.add(tag.trim());
            }
        }
        return valid;
    }
}
