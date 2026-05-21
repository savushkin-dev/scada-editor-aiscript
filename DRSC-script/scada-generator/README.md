# scada-generator

Модуль генерации и инкрементального обновления SCADA XML‑проекта из **Lua**‑файлов и текстового описания
с возможностью использования **искусственного интеллекта**.

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

- `generate` — генерация/перегенерация SCADA‑проекта из Lua‑источников (с ИИ или без)
- `update` — инкрементальное обновление существующего проекта
- `watch` — наблюдение за каталогом Lua и автоматический `update`

Дополнительно: [`AI_LUA_USAGE.md`](AI_LUA_USAGE.md), [`LINUX_DEPLOYMENT_GUIDE.md`](LINUX_DEPLOYMENT_GUIDE.md).

## Команда generate

Показать справку:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate --help
```

Запуск (пример, текущая реализация):

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  -l "C:\path\to\lua-sources" `
  -o "C:\path\to\out-project" `
  -s "C:\path\to\BN1_Rastvorenie_scripts\scripts.txt"
```

С поддержкой ИИ‑анализа Lua:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  -l "C:\path\to\lua-sources" `
  -o "C:\path\to\out-project" `
  --ai
```

Параметры:

- `-l, --lua`: путь к Lua‑файлу или директории с Lua‑файлами (логика процесса).
- `-o, --output`: каталог, куда будет сгенерирован SCADA‑проект.
- `-s, --handlers-source`: каталог шаблонов (`scripts.txt`) — при generate создаёт начальный `Units.script`.
- `--type-mapping`: путь к `type-mapping.yaml` (по умолчанию рядом с `-s`).
- `--ai`: при наличии используется ИИ для извлечения дополнительных тегов из Lua
  (см. подробнее `AI_LUA_USAGE.md`).

## Команда update

Показать справку:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar update --help
```

Запуск (пример, текущая реализация):

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar update `
  -l "C:\path\to\lua-sources" `
  -e "C:\path\to\existing-project" `
  -m "C:\path\to\metadata-dir" `
  -s "C:\path\to\BN1_Rastvorenie_scripts\scripts.txt" `
  [--ai]
```

Параметры:

- `-l, --lua`: путь к Lua‑файлу или директории с Lua‑файлами.
- `-e, --existing`: каталог существующего SCADA‑проекта.
- `-m, --metadata`: каталог для хранения служебных метаданных (для диффа и обновления).
- `-s, --handlers-source`: каталог шаблонов обработчиков Monitor (`scripts.txt`); при update дописывает `Units.script` для новых тегов по `type-mapping.yaml`.
- `--type-mapping`: путь к `type-mapping.yaml` (по умолчанию — рядом с `--handlers-source`).
- `--ai`: включить ИИ‑анализ Lua при обновлении.

## Запуск из IntelliJ IDEA (если удобнее “нажимать”)

- Откройте папку `C:\DRM\scada-generator` как Maven‑проект (IntelliJ сама подхватит `pom.xml`).
- В правой панели **Maven**:
  - **Lifecycle → test** — прогон тестов
  - **Lifecycle → package** — сборка jar
- Для запуска:
  - откройте класс `ru.drm.scada.cli.ScadaGeneratorCli`
  - нажмите **Run**
  - аргументы задаются в **Run/Debug Configurations → Program arguments**:
    - пример: `generate -l data\BN1_Rastvorenie\BN1_Rastvorenie\docs -o out-demo -s data\BN1_Rastvorenie_scripts\scripts.txt`

## Частые проблемы

- **В терминале `java -version` показывает не 17**
  - Это не всегда критично, если `JAVA_HOME` указывает на JDK 17.
  - Проверьте: `echo $env:JAVA_HOME` и `& "$env:JAVA_HOME\bin\java.exe" -version`.

- **Первый запуск `mvnw` долго скачивает**
  - Это нормально: Maven и зависимости кладутся в `C:\Users\<you>\.m2`.

