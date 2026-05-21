package ru.drm.scada.usecase;

import ru.drm.scada.generator.UnitsScriptFormat;

import java.nio.file.Path;

/**
 * Контекст инкрементального обновления (метаданные, эталон скриптов, правила типов).
 */
public record DeltaUpdateContext(
        Path metadataStore,
        Path handlersCatalogSource,
        Path typeMappingSource,
        Path tagOverridesSource,
        UnitsScriptFormat scriptFormat,
        boolean includeOnChange,
        boolean generateMapsStub
) {
    public static DeltaUpdateContext of(Path metadataStore) {
        return new DeltaUpdateContext(metadataStore, null, null, null,
                UnitsScriptFormat.FLAT, false, false);
    }

    public static DeltaUpdateContext of(
            Path metadataStore,
            Path handlersCatalogSource,
            Path typeMappingSource) {
        return new DeltaUpdateContext(metadataStore, handlersCatalogSource, typeMappingSource, null,
                UnitsScriptFormat.FLAT, false, false);
    }

    public static DeltaUpdateContext full(
            Path metadataStore,
            Path handlersCatalogSource,
            Path typeMappingSource,
            Path tagOverridesSource,
            UnitsScriptFormat scriptFormat,
            boolean includeOnChange,
            boolean generateMapsStub) {
        return new DeltaUpdateContext(metadataStore, handlersCatalogSource, typeMappingSource,
                tagOverridesSource, scriptFormat, includeOnChange, generateMapsStub);
    }
}
