package ru.drm.scada.usecase;

import java.util.ArrayList;
import java.util.List;

/**
 * Проверки качества результата generate/update для acceptance-сценария BN1.
 */
public final class ProjectQualityValidator {

    public record QualityReport(
            boolean passed,
            int unitCount,
            int handlersAdded,
            int matchedNoHandlersCount,
            int unknownTypeCount,
            List<String> violations) {
    }

    private ProjectQualityValidator() {
    }

    public static QualityReport validate(
            int unitCount,
            int handlersInScript,
            DeltaUpdateReport report,
            int minUnits,
            int minHandlers) {
        List<String> violations = new ArrayList<>();
        if (unitCount < minUnits) {
            violations.add("units=" + unitCount + " < min=" + minUnits);
        }
        if (handlersInScript < minHandlers) {
            violations.add("handlersInScript=" + handlersInScript + " < min=" + minHandlers);
        }
        if (report != null) {
            long dupHandlers = report.getHandlersAdded().stream().distinct().count();
            if (dupHandlers < report.getHandlersAdded().size()) {
                violations.add("duplicate handlers in report");
            }
        }
        boolean passed = violations.isEmpty();
        int matchedNo = report != null ? report.getMatchedNoHandlers().size() : 0;
        int unknown = report != null ? report.getUnknownTypeTags().size() : 0;
        int added = report != null ? report.getHandlersAdded().size() : handlersInScript;
        return new QualityReport(passed, unitCount, added, matchedNo, unknown, violations);
    }
}
