package ru.drm.scada.domain;

/**
 * Тип сигнала/тега SCADA.
 */
public enum TagType {
    ANALOG_INPUT,
    ANALOG_OUTPUT,
    DIGITAL_INPUT,
    DIGITAL_OUTPUT,
    INTERNAL,
    CALCULATED
}

