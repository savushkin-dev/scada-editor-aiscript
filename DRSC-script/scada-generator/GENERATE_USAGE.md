# Практическое руководство: использование команды `generate`

## Что можно сделать с командой `generate` прямо сейчас

Команда `generate` принимает **PDF-файл** и **Lua-файл**, обрабатывает их и создаёт **XML-проект SCADA**.

---

## Доступные файлы для генерации

### В папке `data/Моцарелла/`:

**PDF-файлы:**
- `O1-Моцарелла ЧБ.pdf` — описание проекта "Моцарелла"

**Lua-файлы:**
- `main.plua` — главный файл логики (рекомендуется)
- `prg.lua` — дополнительные модули
- `alpmagate.lua`, `error_pumps.lua`, `bertschmozgate1.lua`, `main.objects.lua` — вспомогательные модули

### В папке `data/BR1-CIP6-master (3)/BR1-CIP6-master/`:

**Lua-файлы:**
- `main.plua` — главный файл логики проекта CIP6
- `prg.lua`, `cip.lua`, `main.io.lua` и другие модули

---

## Как запустить генерацию

### Вариант 1: Генерация из проекта "Моцарелла"

**Открой PowerShell и выполни:**

```powershell
cd C:\DRM\scada-generator

# Сначала собери проект (если ещё не собрал)
.\mvnw.cmd package

# Запуск генерации
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\Моцарелла\main.plua" `
  --output "generated-projects\mozzarella-demo"
```

**Что произойдёт:**
- Программа прочитает PDF и Lua файлы
- Создаст папку `generated-projects\mozzarella-demo`
- Сгенерирует файл `project.xml` в этой папке

---

### Вариант 2: Генерация из проекта CIP6

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\BR1-CIP6-master (3)\BR1-CIP6-master\main.plua" `
  --output "generated-projects\cip6-demo"
```

---

### Вариант 3: Свои файлы

Если у тебя есть свои PDF и Lua файлы:

```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "C:\path\to\your\project.pdf" `
  --lua "C:\path\to\your\logic.lua" `
  --output "C:\path\to\output\folder"
```

---

## Что создаётся после генерации

### Структура выходной папки:

```
generated-projects/
└── mozzarella-demo/
    └── project.xml          ← сгенерированный XML-проект
```

### Содержимое `project.xml`:

Генератор создаёт XML со следующей структурой:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ScadaProject id="O1-Моцарелла ЧБ">
  <Equipments>
    <!-- Список оборудования (если парсер PDF извлёк данные) -->
    <Equipment id="..." name="..." type="...">
      <Tags>
        <!-- Теги/сигналы оборудования -->
        <Tag id="..." name="..." type="..." source="..." address="..."/>
      </Tags>
    </Equipment>
  </Equipments>
  <ControlLogics>
    <!-- Логика управления из Lua -->
    <ControlLogic id="main.plua" name="MainLogic">
      <LuaCode><![CDATA[
        -- Весь код из Lua-файла здесь
        ...
      ]]></LuaCode>
    </ControlLogic>
  </ControlLogics>
</ScadaProject>
```

---

## Как посмотреть результат

### Способ 1: Открыть в текстовом редакторе

**В PowerShell:**

```powershell
# Открыть в блокноте
notepad generated-projects\mozzarella-demo\project.xml

# Или в VS Code (если установлен)
code generated-projects\mozzarella-demo\project.xml
```

**В IntelliJ IDEA:**
- Открой папку `generated-projects\mozzarella-demo`
- Дважды кликни на `project.xml`
- IntelliJ покажет XML с подсветкой синтаксиса

---

### Способ 2: Просмотр в браузере

XML можно открыть в браузере (Chrome, Edge) — он покажет структуру с форматированием:

```powershell
# Открыть в браузере по умолчанию
Start-Process "generated-projects\mozzarella-demo\project.xml"
```

---

### Способ 3: Проверка через PowerShell

**Посмотреть содержимое файла:**

```powershell
# Показать первые 50 строк
Get-Content generated-projects\mozzarella-demo\project.xml -Head 50

# Показать размер файла
(Get-Item generated-projects\mozzarella-demo\project.xml).Length

# Проверить, что файл создан
Test-Path generated-projects\mozzarella-demo\project.xml
```

---

## Что сейчас генерируется (текущий MVP)

### ✅ Что работает:

1. **Чтение PDF**
   - Извлекает имя файла → `projectId`
   - Пока не извлекает структурированные данные (оборудование, теги)

2. **Чтение Lua**
   - Читает весь файл целиком
   - Создаёт один блок `ControlLogic` с полным кодом

3. **Генерация XML**
   - Создаёт файл `project.xml`
   - Структура: `<ScadaProject>` → `<Equipments>` → `<ControlLogics>`
   - Lua-код помещается в `<LuaCode><![CDATA[...]]></LuaCode>`

### ⚠️ Ограничения текущей версии:

- **Оборудование (`<Equipments>`) будет пустым** — парсер PDF пока не извлекает структурированные данные
- **Теги (`<Tags>`) будут пустыми** — парсер Lua пока не анализирует код и не находит `DI/DO/AI`
- **Формат XML — базовый**, не специфичный для Monitor (следующий этап разработки)

---

## Пример реального запуска

### Полный пример с выводом:

```powershell
# Переходим в проект
cd C:\DRM\scada-generator

# Собираем (если нужно)
.\mvnw.cmd package

# Запускаем генерацию
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\Моцарелла\main.plua" `
  --output "demo-output"

# Проверяем результат
if (Test-Path "demo-output\project.xml") {
    Write-Host "✅ Файл создан успешно!" -ForegroundColor Green
    Write-Host "Размер: $((Get-Item demo-output\project.xml).Length) байт"
    Write-Host "Путь: $(Resolve-Path demo-output\project.xml)"
} else {
    Write-Host "❌ Файл не найден" -ForegroundColor Red
}

# Открываем файл
notepad demo-output\project.xml
```

---

## Что можно делать с сгенерированным XML

### 1. Просмотр и анализ

- Открыть в текстовом редакторе или IDE
- Проверить структуру проекта
- Посмотреть Lua-код в секции `<LuaCode>`

### 2. Сравнение с эталоном

Сравнить с эталонным проектом Monitor:

```powershell
# Эталонный файл Monitor
code "data\Моцарелла\O1_MOZARELLA.files\O1_MOZARELLA.files\Units.xml"

# Сгенерированный файл
code "demo-output\project.xml"
```

**Что увидишь:**
- Эталонный `Units.xml` содержит реальные юниты Monitor с каналами
- Сгенерированный `project.xml` пока содержит только базовую структуру + Lua-код

### 3. Использование в других инструментах

- XML можно открыть в любом XML-редакторе
- Можно использовать для анализа структуры проекта
- Можно использовать как основу для дальнейшей обработки

---

## Ошибки и их решение

### Ошибка: "PDF file does not exist"

**Причина:** Неправильный путь к PDF файлу

**Решение:**
```powershell
# Проверь путь
Test-Path "data\Моцарелла\O1-Моцарелла ЧБ.pdf"

# Используй полный путь, если относительный не работает
--pdf "C:\DRM\scada-generator\data\Моцарелла\O1-Моцарелла ЧБ.pdf"
```

---

### Ошибка: "Lua file does not exist"

**Причина:** Неправильный путь к Lua файлу

**Решение:**
```powershell
# Проверь путь
Test-Path "data\Моцарелла\main.plua"

# Используй полный путь
--lua "C:\DRM\scada-generator\data\Моцарелла\main.plua"
```

---

### Ошибка: "NoClassDefFoundError"

**Причина:** Зависимости не скопированы в `target/lib`

**Решение:**
```powershell
# Пересобери проект
.\mvnw.cmd clean package
```

---

## Полезные команды для работы с результатами

### Просмотр структуры XML:

```powershell
# Показать первые строки
Get-Content demo-output\project.xml -Head 30

# Найти все теги Equipment
Select-String -Path demo-output\project.xml -Pattern "<Equipment"

# Найти Lua-код
Select-String -Path demo-output\project.xml -Pattern "LuaCode" -Context 0,5
```

### Сравнение файлов:

```powershell
# Сравнить два XML файла (если есть diff утилита)
Compare-Object (Get-Content file1.xml) (Get-Content file2.xml)
```

---

## Что дальше (планы развития)

### Следующие версии генератора:

1. **Генерация в формате Monitor**
   - Создание `Units.xml` в формате Monitor
   - Создание `Project.xml` в формате Monitor
   - Структура будет соответствовать эталонным файлам

2. **Извлечение оборудования из PDF**
   - Парсинг таблиц из PDF
   - Автоматическое создание `Equipment` с тегами

3. **Анализ Lua-кода**
   - Поиск вызовов `DI/DO/AI/AO`
   - Автоматическое создание `Tag` из Lua

4. **Инкрементальное обновление**
   - Команда `update` будет обновлять только изменения
   - Сохранение предыдущей версии проекта

---

## Быстрая справка

**Синтаксис команды:**
```powershell
java -jar scada-generator-0.1.0-SNAPSHOT.jar generate \
  --pdf <путь_к_pdf> \
  --lua <путь_к_lua> \
  --output <папка_для_результата>
```

**Результат:**
- Создаётся папка `--output`
- В ней создаётся файл `project.xml`
- XML содержит структуру проекта и Lua-код

**Просмотр результата:**
```powershell
notepad <папка_для_результата>\project.xml
```

---

**Готово к использованию!** 🚀
