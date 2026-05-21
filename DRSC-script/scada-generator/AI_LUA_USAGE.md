# ИИ-анализ Lua (извлечение тегов)

## Назначение

Дополнительное извлечение имён тегов (DI/DO/AI/AO) из Lua при помощи OpenAI.
Полезно для динамических конструкций, которые не ловит regex:
- конкатенация: `"PREFIX"..var.."SUFFIX"`
- `string.format`
- циклы и переменные

## Использование

### Запуск с ИИ

```powershell
$env:OPENAI_API_KEY = "sk-..."   # один раз в сессии или в переменных среды

java -jar scada-generator.jar generate -l "data/BN1_Rastvorenie/BN1_Rastvorenie/docs" -o output --ai
java -jar scada-generator.jar update -l "data/BN1_Rastvorenie/BN1_Rastvorenie/docs" -e project -m meta --ai
```

### Без ИИ (по умолчанию)

```powershell
java -jar scada-generator.jar generate -l "data/BN1_Rastvorenie/BN1_Rastvorenie/docs" -o output
```

Без флага `--ai` используются только результаты regex-парсера.

## Требования

- Переменная окружения `OPENAI_API_KEY`
- Счёт OpenAI (оплата за использование API)

## Лимиты

- Lua-код обрезается до 8000 символов
- Таймаут запроса: 60 секунд
- Модель: gpt-4o-mini
