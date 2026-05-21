package ru.drm.scada.generator;

import ru.drm.scada.domain.ProjectModel;
import ru.drm.scada.usecase.ProjectGenerationException;
import ru.drm.scada.usecase.ProjectGenerator;

import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;

/**
 * Выполняет несколько генераторов последовательно.
 */
public class CompositeProjectGenerator implements ProjectGenerator {

    private final List<ProjectGenerator> delegates;

    public CompositeProjectGenerator(ProjectGenerator... delegates) {
        this.delegates = Arrays.asList(delegates);
    }

    @Override
    public void generate(ProjectModel model, Path outputDirectory) throws ProjectGenerationException {
        for (ProjectGenerator g : delegates) {
            g.generate(model, outputDirectory);
        }
    }
}
