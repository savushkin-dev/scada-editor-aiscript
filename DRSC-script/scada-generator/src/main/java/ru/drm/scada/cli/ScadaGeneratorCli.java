package ru.drm.scada.cli;

import picocli.CommandLine;
import picocli.CommandLine.Command;

/**
 * Точка входа CLI-приложения.
 */
@Command(
        name = "scada-generator",
        mixinStandardHelpOptions = true,
        description = "SCADA project generator from Lua sources.",
        subcommands = {
                GenerateCommand.class,
                UpdateCommand.class,
                WatchCommand.class
        }
)
public class ScadaGeneratorCli implements Runnable {

    @Override
    public void run() {
        CommandLine.usage(this, System.out);
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new ScadaGeneratorCli()).execute(args);
        System.exit(exitCode);
    }
}

