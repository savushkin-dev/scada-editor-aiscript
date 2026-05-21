package ru.drm.scada.domain;

/**
 * Тип оборудования (примерный перечень, может расширяться).
 */
public enum EquipmentType {
    PUMP,
    VALVE,
    TANK,
    SENSOR,
    CONTROLLER,
    UNIT,    // Monitor unit (ALPMAGW5, LA_TANK1, P4790 и т.п.)
    GENERIC
}

