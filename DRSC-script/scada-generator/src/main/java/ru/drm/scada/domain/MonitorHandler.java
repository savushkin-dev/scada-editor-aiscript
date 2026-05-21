package ru.drm.scada.domain;

import java.util.Objects;

/**
 * Обработчик Monitor (фрагмент Units.script / scripts.txt): function extern … endf.
 */
public final class MonitorHandler {

    private final String name;
    private final String parameters;
    private final String body;

    public MonitorHandler(String name, String parameters, String body) {
        this.name = Objects.requireNonNull(name, "name");
        this.parameters = parameters != null ? parameters : "";
        this.body = body != null ? body : "";
    }

    public String getName() {
        return name;
    }

    public String getParameters() {
        return parameters;
    }

    public String getBody() {
        return body;
    }

    /** Полный текст объявления для записи в Units.script (плоский формат BN1). */
    public String toScriptSource() {
        return "function extern " + name + "(" + parameters + ");\n"
                + body
                + "endf;\n";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof MonitorHandler that)) return false;
        return name.equals(that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
