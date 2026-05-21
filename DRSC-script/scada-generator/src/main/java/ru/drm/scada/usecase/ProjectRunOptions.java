package ru.drm.scada.usecase;

import java.nio.file.Path;

/**
 * Дополнительные параметры generate/update (overrides, Maps stub).
 */
public record ProjectRunOptions(
        Path tagOverridesSource,
        boolean generateMapsStub
) {
    public static ProjectRunOptions defaults() {
        return new ProjectRunOptions(null, false);
    }
}
