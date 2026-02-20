# Как отлаживать программу на Lua

## Установка **ZeroBrane Studio**

[Скачать](https://studio.zerobrane.com/download?not-this-time) и установить **ZeroBrane Studio**. Рекомендуется установить программу по следующему пути:

```sh
P:/ZeroBraneStudio
```

## Установка **Lua for Windows**

[Скачать](https://github.com/rjpcomputing/luaforwindows) и установить **Lua for Windows**.

## Запуск сервера отладки в **ZeroBrane Studio**

Открываем файл описания управляющей программы, который планируется отлаживать. Например, ```'main.plua'``` для проекта [T1-PLCnext-Demo](https://github.com/savushkin-r-d/T1-PLCnext-Demo). Далее указываем каталог проекта:

```Project --> Project Directory --> Set From Current File```

Устанавливаем галочку:

```Project --> Start debug server```

## Запуск проекта для отладки в **Visual Code**

В начало файла ```'main.plua'``` необходимо добавить следующие строки:

```Lua
package.path = package.path .. ';P:/ZeroBraneStudio/lualibs/?.lua;P:/ZeroBraneStudio/lualibs/mobdebug/?.lua'
package.cpath = package.cpath .. ';P:/ZeroBraneStudio/bin/clibs/?.dll'

require("mobdebug").start()
```

Далее запускаем в **Visual Code** проект на выполнение - по соединению с сервером в **ZeroBrane Studio** можно производить отладку программы.
