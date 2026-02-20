# scada-generator

Генератор и инкрементальный апдейтер SCADA XML‑проекта из **PDF** и **Lua** источников.

Проект — **CLI-приложение** (командная строка) на Java.

## Требования

- **JDK 17** (проект компилируется с `--release 17`).
- Интернет-доступ на первый запуск (Maven Wrapper скачает Maven и зависимости в локальный кеш).

## Быстрый старт (Windows / PowerShell)

Перейдите в папку проекта:

```powershell
cd C:\DRM\scada-generator
```

### Проверить окружение

```powershell
.\mvnw.cmd -v
```

В выводе важно увидеть `Java version: 17...`.

### Прогнать тесты и собрать jar

```powershell
.\mvnw.cmd test
.\mvnw.cmd package
```

На выходе будет jar:

- `target\scada-generator-0.1.0-SNAPSHOT.jar`

и папка с runtime‑зависимостями:

- `target\lib\...`

### Запуск CLI и подсказка по командам

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar --help
```

Доступные команды:

- `generate` — генерация проекта
- `update` — инкрементальное обновление проекта
- `watch` — заготовка (пока не реализовано)

## Команда generate

Показать справку:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate --help
```

Запуск (пример):

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "C:\path\to\spec.pdf" `
  --lua "C:\path\to\logic.lua" `
  --output "C:\path\to\out-project"
```

Что делают параметры:

- `--pdf`: путь к PDF с описанием проекта/оборудования
- `--lua`: путь к Lua-скрипту (логика)
- `--output`: каталог, куда будет сгенерирован проект

## Команда update

Показать справку:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar update --help
```

Запуск (пример):

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar update `
  --pdf "C:\path\to\spec.pdf" `
  --lua "C:\path\to\logic.lua" `
  --existing "C:\path\to\existing-project" `
  --metadata "C:\path\to\metadata-dir"
```

## Запуск из IntelliJ IDEA (если удобнее “нажимать”)

- Откройте папку `C:\DRM\scada-generator` как Maven‑проект (IntelliJ сама подхватит `pom.xml`).
- В правой панели **Maven**:
  - **Lifecycle → test** — прогон тестов
  - **Lifecycle → package** — сборка jar
- Для запуска:
  - откройте класс `ru.drm.scada.cli.ScadaGeneratorCli`
  - нажмите **Run**
  - аргументы задаются в **Run/Debug Configurations → Program arguments**:
    - пример: `generate --pdf C:\...\spec.pdf --lua C:\...\logic.lua --output C:\...\out`

## Частые проблемы

- **В терминале `java -version` показывает не 17**
  - Это не всегда критично, если `JAVA_HOME` указывает на JDK 17.
  - Проверьте: `echo $env:JAVA_HOME` и `& "$env:JAVA_HOME\bin\java.exe" -version`.

- **Первый запуск `mvnw` долго скачивает**
  - Это нормально: Maven и зависимости кладутся в `C:\Users\<you>\.m2`.

