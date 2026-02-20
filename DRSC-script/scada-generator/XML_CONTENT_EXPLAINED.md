# Что содержит XML файл и что происходит с разными данными

## Структура сгенерированного XML файла

### Текущая структура (MVP версия)

XML файл `project.xml` содержит следующую структуру:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ScadaProject id="имя_файла_pdf">
  <!-- 1. Секция оборудования -->
  <Equipments>
    <!-- Пока пусто, т.к. парсер PDF не извлекает оборудование -->
  </Equipments>
  
  <!-- 2. Секция логики управления -->
  <ControlLogics>
    <ControlLogic id="имя_lua_файла" name="MainLogic">
      <LuaCode><![CDATA[
        -- Весь код из Lua файла целиком
        ...
      ]]></LuaCode>
    </ControlLogic>
  </ControlLogics>
</ScadaProject>
```

---

## Что именно содержит каждая секция

### 1. `<ScadaProject>` — корневой элемент

**Атрибут `id`:**
- Берётся из **имени PDF файла**
- Например: `id="O1-Моцарелла ЧБ.pdf"` или `id="project-description.pdf"`

**Откуда берётся:**
```java
// PdfBoxPdfParser.java
String projectId = pdfPath.getFileName().toString();
```

---

### 2. `<Equipments>` — список оборудования

**Текущее состояние:** **ПУСТО** (пустая секция)

**Почему пусто:**
- Парсер PDF (`PdfBoxPdfParser`) пока только читает текст, но не извлекает структурированные данные
- В будущем здесь будут `<Equipment>` элементы с:
  - `id` — идентификатор оборудования
  - `name` — название
  - `type` — тип (PUMP, VALVE, TANK, и т.д.)
  - `<Tags>` — список тегов/сигналов этого оборудования

**Что будет в будущем:**
```xml
<Equipments>
  <Equipment id="ALPMAGW5AI480512" name="Датчик уровня" type="SENSOR">
    <Tags>
      <Tag id="V" name="Значение" type="ANALOG_INPUT" address="359596032"/>
      <Tag id="ST" name="Состояние" type="DIGITAL_INPUT" address="359530496"/>
    </Tags>
  </Equipment>
</Equipments>
```

---

### 3. `<ControlLogics>` — логика управления

**Содержит:** Один или несколько блоков `<ControlLogic>`

**Что в каждом блоке:**

- **`id`** — имя Lua файла (например, `"main.plua"`)
- **`name`** — всегда `"MainLogic"` (пока фиксированное)
- **`<LuaCode>`** — **весь код из Lua файла целиком** в формате CDATA

**Пример:**
```xml
<ControlLogic id="main.plua" name="MainLogic">
  <LuaCode><![CDATA[
--Проект 'O1-Моцарелла'
package.path = package.path .. ';./dairy-sys/?.lua'
prg = require("prg")
alpma = require("alpmagate")
pumps = require("error_pumps")
...
(весь код из файла main.plua)
  ]]></LuaCode>
</ControlLogic>
```

**Откуда берётся:**
```java
// SimpleLuaParser.java
String code = Files.readString(luaPath, StandardCharsets.UTF_8);
logic.setLuaCode(code); // Весь файл целиком
```

---

## Что происходит с разными наборами данных

### Сценарий 1: Проект "Моцарелла"

**Входные файлы:**
- PDF: `data\Моцарелла\O1-Моцарелла ЧБ.pdf`
- Lua: `data\Моцарелла\main.plua`

**Результат:**
```xml
<ScadaProject id="O1-Моцарелла ЧБ.pdf">
  <Equipments>
    <!-- Пусто -->
  </Equipments>
  <ControlLogics>
    <ControlLogic id="main.plua" name="MainLogic">
      <LuaCode><![CDATA[
        --Проект 'O1-Моцарелла'
        package.path = package.path .. ';./dairy-sys/?.lua'
        prg = require("prg")
        alpma = require("alpmagate")
        ... (код из main.plua проекта Моцарелла)
      ]]></LuaCode>
    </ControlLogic>
  </ControlLogics>
</ScadaProject>
```

**Особенности:**
- `id` проекта = имя PDF файла
- Lua код = весь файл `main.plua` проекта Моцарелла
- Оборудование пустое (парсер ещё не извлекает)

---

### Сценарий 2: Проект CIP6

**Входные файлы:**
- PDF: `data\Моцарелла\O1-Моцарелла ЧБ.pdf` (можно использовать тот же)
- Lua: `data\BR1-CIP6-master (3)\BR1-CIP6-master\main.plua`

**Команда:**
```powershell
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\BR1-CIP6-master (3)\BR1-CIP6-master\main.plua" `
  --output "demo-output-cip6"
```

**Результат:**
```xml
<ScadaProject id="O1-Моцарелла ЧБ.pdf">
  <Equipments>
    <!-- Пусто -->
  </Equipments>
  <ControlLogics>
    <ControlLogic id="main.plua" name="MainLogic">
      <LuaCode><![CDATA[
        -- Код из main.plua проекта CIP6
        -- Другой код, другие модули, другая логика
        ... (код из CIP6 main.plua)
      ]]></LuaCode>
    </ControlLogic>
  </ControlLogics>
</ScadaProject>
```

**Что изменилось:**
- ✅ Lua код **другой** (из CIP6 проекта)
- ✅ `id` проекта **тот же** (из имени PDF)
- ⚠️ Оборудование всё ещё пустое

---

### Сценарий 3: Разные PDF файлы

**Входные файлы:**
- PDF: `my-project.pdf` (другой файл)
- Lua: `data\Моцарелла\main.plua`

**Результат:**
```xml
<ScadaProject id="my-project.pdf">
  <!-- id изменился на имя нового PDF -->
  <Equipments>
    <!-- Пусто -->
  </Equipments>
  <ControlLogics>
    <ControlLogic id="main.plua" name="MainLogic">
      <LuaCode><![CDATA[
        ... (код из main.plua)
      ]]></LuaCode>
    </ControlLogic>
  </ControlLogics>
</ScadaProject>
```

**Что изменилось:**
- ✅ `id` проекта = имя нового PDF файла
- ✅ Lua код остался тем же (из Моцареллы)

---

### Сценарий 4: Несколько Lua файлов (будущее)

**Сейчас:** Программа принимает только **один** Lua файл

**В будущем:** Можно будет передавать несколько файлов, и каждый будет отдельным `<ControlLogic>`:

```xml
<ControlLogics>
  <ControlLogic id="main.plua" name="MainLogic">
    <LuaCode><![CDATA[...]]></LuaCode>
  </ControlLogic>
  <ControlLogic id="prg.lua" name="ProgramLogic">
    <LuaCode><![CDATA[...]]></LuaCode>
  </ControlLogic>
  <ControlLogic id="alpmagate.lua" name="AlpmaGate">
    <LuaCode><![CDATA[...]]></LuaCode>
  </ControlLogic>
</ControlLogics>
```

---

## Сравнение: что есть сейчас vs что будет

### Сейчас (MVP):

| Элемент | Источник данных | Статус |
|---------|----------------|--------|
| `ScadaProject.id` | Имя PDF файла | ✅ Работает |
| `<Equipments>` | PDF (парсинг) | ⚠️ Пусто (парсер не извлекает) |
| `<ControlLogic>` | Lua файл | ✅ Работает (весь файл целиком) |
| `<LuaCode>` | Lua файл | ✅ Работает (весь код) |
| `<Tags>` | Lua (анализ кода) | ⚠️ Пусто (парсер не анализирует) |

### В будущем:

| Элемент | Источник данных | План |
|---------|----------------|------|
| `ScadaProject.id` | PDF (извлечение из документа) | Улучшить |
| `<Equipments>` | PDF (парсинг таблиц) | ✅ Реализовать |
| `<Equipment>` | PDF (распознавание структуры) | ✅ Реализовать |
| `<Tags>` | Lua (поиск `DI/DO/AI/AO`) | ✅ Реализовать |
| `<ControlLogic>` | Lua (разбиение на функции) | ✅ Улучшить |

---

## Практические примеры

### Пример 1: Генерация для Моцареллы

```powershell
# Запуск
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\Моцарелла\main.plua" `
  --output "output-mozzarella"

# Результат: output-mozzarella\project.xml
# Содержит: id="O1-Моцарелла ЧБ.pdf" + код из main.plua
```

---

### Пример 2: Генерация для CIP6

```powershell
# Запуск
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\BR1-CIP6-master (3)\BR1-CIP6-master\main.plua" `
  --output "output-cip6"

# Результат: output-cip6\project.xml
# Содержит: id="O1-Моцарелла ЧБ.pdf" + код из CIP6 main.plua
```

---

### Пример 3: Сравнение результатов

**Создай оба проекта и сравни:**

```powershell
# Генерация Моцареллы
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\Моцарелла\main.plua" `
  --output "compare\mozzarella"

# Генерация CIP6
& "$env:JAVA_HOME\bin\java.exe" -jar target\scada-generator-0.1.0-SNAPSHOT.jar generate `
  --pdf "data\Моцарелла\O1-Моцарелла ЧБ.pdf" `
  --lua "data\BR1-CIP6-master (3)\BR1-CIP6-master\main.plua" `
  --output "compare\cip6"

# Сравнение Lua кода
Select-String -Path "compare\mozzarella\project.xml" -Pattern "LuaCode" -Context 0,10
Select-String -Path "compare\cip6\project.xml" -Pattern "LuaCode" -Context 0,10
```

**Что увидишь:**
- Оба файла имеют одинаковый `id` (из PDF)
- Но разный Lua код (из разных файлов)
- Оба имеют пустые `<Equipments>`

---

## Что можно делать с XML файлом

### 1. Просмотр и анализ

- Открыть в текстовом редакторе
- Открыть в XML-редакторе (IntelliJ, VS Code)
- Просмотреть Lua код в секции `<LuaCode>`

### 2. Использование Lua кода

- Скопировать код из `<LuaCode><![CDATA[...]]></LuaCode>`
- Использовать в других проектах
- Анализировать логику

### 3. Сравнение проектов

- Сравнить Lua код разных проектов
- Найти различия в логике
- Понять структуру проектов

### 4. Базовая структура проекта

- XML показывает структуру SCADA-проекта
- Можно использовать как основу для дальнейшей обработки
- Можно преобразовать в другие форматы

---

## Ограничения текущей версии

### Что НЕ работает:

1. **Оборудование не извлекается из PDF**
   - Секция `<Equipments>` всегда пустая
   - Нужно улучшить `PdfBoxPdfParser`

2. **Теги не извлекаются из Lua**
   - Секция `<Tags>` всегда пустая
   - Нужно улучшить `SimpleLuaParser` для поиска `DI/DO/AI/AO`

3. **Формат не специфичен для Monitor**
   - XML в базовом формате
   - Нужно генерировать `Units.xml` в формате Monitor

4. **Только один Lua файл**
   - Программа принимает один файл
   - Нельзя передать несколько модулей

---

## Что будет в следующих версиях

### Версия 1.1: Генератор Monitor

```xml
<!-- Будет генерироваться Units.xml в формате Monitor -->
<units>
  <unit>
    <name>ALPMAGW5AI480512</name>
    <typename>wg</typename>
    <propertieslist>
      <property>
        <name>V</name>
        <channelid>359596032</channelid>
        ...
      </property>
    </propertieslist>
  </unit>
</units>
```

### Версия 1.2: Умный парсинг Lua

- Поиск вызовов `DI("ALPMAGW5DI...")`
- Автоматическое создание `<Tag>` элементов
- Связывание тегов с оборудованием

### Версия 1.3: Парсинг PDF

- Извлечение таблиц из PDF
- Распознавание оборудования
- Автоматическое создание `<Equipment>`

---

## Итоговая таблица: что в XML сейчас

| Секция | Содержимое | Источник | Статус |
|--------|-----------|----------|--------|
| `<ScadaProject id="...">` | Имя PDF файла | PDF (имя файла) | ✅ |
| `<Equipments>` | Пусто | PDF (парсинг) | ⚠️ Не реализовано |
| `<ControlLogics>` | Список логики | Lua файлы | ✅ |
| `<ControlLogic>` | Один блок | Lua файл | ✅ |
| `<LuaCode>` | Весь код файла | Lua файл | ✅ |
| `<Tags>` | Пусто | Lua (анализ) | ⚠️ Не реализовано |

---

**Вывод:** Сейчас XML содержит **базовую структуру проекта + весь Lua код**. В будущем будет содержать **оборудование, теги и формат Monitor**.
