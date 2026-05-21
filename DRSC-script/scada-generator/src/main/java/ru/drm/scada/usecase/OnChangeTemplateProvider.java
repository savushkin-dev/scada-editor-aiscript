package ru.drm.scada.usecase;

import ru.drm.scada.domain.MonitorHandler;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Шаблоны OnChangeM / OnChangeST из demo-handlers-stub (для блочного Units.script).
 */
public final class OnChangeTemplateProvider {

    private static final Pattern FUNCTION =
            Pattern.compile("function extern (\\w+)\\(([^)]*)\\);\\s*([\\s\\S]*?)endf;", Pattern.MULTILINE);

    private final List<MonitorHandler> templates;

    public OnChangeTemplateProvider(List<MonitorHandler> templates) {
        this.templates = templates != null ? List.copyOf(templates) : List.of();
    }

    public static OnChangeTemplateProvider loadDefault() throws IOException {
        Path stub = Path.of("data/demo-handlers-stub/Units.script.stub.example");
        if (!Files.exists(stub)) {
            return new OnChangeTemplateProvider(List.of());
        }
        return load(stub);
    }

    public static OnChangeTemplateProvider load(Path stubPath) throws IOException {
        String text = Files.readString(stubPath);
        List<MonitorHandler> handlers = new ArrayList<>();
        Matcher m = FUNCTION.matcher(text);
        while (m.find()) {
            String name = m.group(1);
            if (name.startsWith("OnChange")) {
                handlers.add(new MonitorHandler(name, m.group(2), m.group(3).trim()));
            }
        }
        return new OnChangeTemplateProvider(handlers);
    }

    public List<MonitorHandler> templatesForUnit(String unitId) {
        return templates;
    }

    public boolean isEmpty() {
        return templates.isEmpty();
    }
}
