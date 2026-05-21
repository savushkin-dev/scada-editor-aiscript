package ru.drm.scada.usecase;

import ru.drm.scada.generator.UnitsScriptFormat;

import java.nio.file.Path;

/**
 * Дополнительные параметры generate/update (формат script, OnChange, Maps).
 */
public record ProjectRunOptions(
        Path tagOverridesSource,
        UnitsScriptFormat scriptFormat,
        boolean includeOnChange,
        boolean generateMapsStub
) {
    public static ProjectRunOptions defaults() {
        return new ProjectRunOptions(null, UnitsScriptFormat.FLAT, false, false);
    }
}
