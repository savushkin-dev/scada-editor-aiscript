# Переход с svn на GitHub при разработке проектов визуализации Monitor

[1.1 Общие сведения](#11-общие-сведения)

[1.2 Поддержка старого репозитория svn](#12-поддержка-старого-репозитория-svn)


Перед переходом необходимо создать следующие каталоги:
1. Реализованные проекты (каталог по умолчанию - **"P:\PTUSA-projects"**);
2. Подкаталоги для площадок ( **"BR1"**, **"BR2"**, ...)


## 1.1 Общие сведения

В настоящее время проекты разрабатываются в каталоге **"p:\monitor"**. Также они хранятся в монорепозитории в **svn** (https://10.0.16.7/svn/projects/EasyServer/trunk/Monitor). Данный подход устарел. Осуществляется переход к распределенной работе с помощью веб-сервиса **GitHub**. Теперь проекты хранятся раздельно: один репозиторий - один проект. Например, проект для **МСА6** хранится здесь - https://github.com/savushkin-r-d/BR1-CIP6-visu.


## 1.2 Поддержка старого репозитория svn

Параллельно с **GitHub** в старом репозитории **svn** будут продолжаться сохраняться проекты. Но, чтобы не заниматься ручным копированием файлов, там будут храниться ссылки на файлы в проект на **GitHub**. Это сделано уже для проекта **МСА6**. Например, при первоначальном обновлении файлов проекта **МСА6** они имеют следующее содержимое (файл **BR1-MCA6.mpr**):

```
link P:/PTUSA-projects/BR1/BR1-CIP6-visu/BR1-MCA6.mpr
```

это означает, что это ссылка на другой файл, а именно на `P:/PTUSA-projects-visu/BR1/BR1-CIP6/BR1-MCA6.mpr`, который находится в другом каталоге. Предполагается, что проект https://github.com/savushkin-r-d/BR1-CIP6-visu извлечен в локальный каталог `P:/PTUSA-project/BR1/BR1-CIP6-visu/`.

Вначале запускаем командный интерпретатор от имени **Администратора**. Нажимаем `Win + R` на клавиатуре. В диалоговом окне набираем `cmd` в поле ввода и нажимаем затем `Ctrl + Shift + Enter`. Это запускает командную оболочку с привилегиями **Администратора**. Далее переходим в каталоге проектов (`"p:\monitor"`):

```cmd
p: && cd p:\monitor
```

Далее переходим к пункту **1.2.1** или **1.2.2**.

### 1.2.1 Создание ссылок вручную

Данные ссылки можно сделать самостоятельно с помощью команд (файлы, которые были извлечены ранее с помощью **svn**, при этом удаляются):

```cmd
echo off
del projects\BR1-MCA6.mpr
del projects\BR1-MCA6.mprx
del chbase\BR1-МСА6.cdbx
rmdir projects\BR1-MCA6.files

@mklink projects\BR1-MCA6.mpr p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mpr
mklink projects\BR1-MCA6.mprx p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mprx
mklink chbase\BR1-МСА6.cdbx p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-МСА6.cdbx
mklink /D projects\BR1-MCA6.files p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.files
echo on

```

Вот результат:

```cmd
p:\monitor>echo off
del projects\BR1-MCA6.mpr
del projects\BR1-MCA6.mprx
del chbase\BR1-МСА6.cdbx
rmdir projects\BR1-MCA6.files

@mklink projects\BR1-MCA6.mpr p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mpr
символическая ссылка создана для projects\BR1-MCA6.mpr <<===>> p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mpr
mklink projects\BR1-MCA6.mprx p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mprx
символическая ссылка создана для projects\BR1-MCA6.mprx <<===>> p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.mprx
mklink chbase\BR1-МСА6.cdbx p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-МСА6.cdbx
символическая ссылка создана для chbase\BR1-МСА6.cdbx <<===>> p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-МСА6.cdbx
mklink /D projects\BR1-MCA6.files p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.files
символическая ссылка создана для projects\BR1-MCA6.files <<===>> p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.files
echo on

p:\monitor>
```

### 1.2.2 Создание ссылок автоматически

Переходим в каталог проектов (`"p:\monitor\projects"`) и запускаем **GitBash**:

```cmd
cd projects
"C:/Program Files/Git/bin/sh.exe"

```

Вот результат:

```sh
p:\monitor>cd projects

p:\monitor\projects>"C:/Program Files/Git/bin/sh.exe"

id@id_s MINGW64 /p/monitor/projects
$
```

Далее запускаем следующий скрипт, в котором можно будет изменить путь расположения проекта (например, задать при вводе `d:/PTUSA-projects/` для каталога `d:/PTUSA-projects/BR1/BR1-CIP6-visu/`):

```sh
{
read -r -p "Введите путь к git-репозиториям проектов (или нажмите ВВОД для p:/PTUSA-projects): " gitlocation

if [ -z "$gitlocation" ] ; then
   echo -e "Use default git location [\E[32;40mp:/PTUSA-projects\E[37;40m]"
else
  echo -e "Use user git location [\E[32;40m$gitlocation\E[37;40m]"
fi

gitlocation=$(echo "$gitlocation" | tr '/' '\\\\')

grep -lr '^link ' . | while read placeholderfile
do
  linecount=`wc -l $placeholderfile | cut -c1`
  if [ $linecount -eq 0 ] ; then

    if [ -z "$gitlocation" ] ; then
      # Удаляем "link " из "link P:/PTUSA-projects/BR1/BR1-CIP6-visu/BR1-MCA6.mpr"
      linkfile=$(cut -c6- "$placeholderfile" | tr '/' '\\\\')
      echo "$linkfile"
    else
      # Удаляем "link P:/PTUSA-projects" из "link P:/PTUSA-projects/BR1/BR1-CIP6-visu/BR1-MCA6.mpr"
      linkfile=$(cut -c27- "$placeholderfile" | tr '/' '\\\\')
      echo "$linkfile"
      linkfile="${gitlocation}${linkfile}"
      echo "$linkfile"
    fi


    rm -f $placeholderfile
    placeholderfile=`echo "$placeholderfile" | tr '/' '\\\\'`

    echo -n -e "[\E[32;40mOK\E[37;40m] "
    cmd.exe //c "mklink $placeholderfile $linkfile"

    #echo -e "[\E[32;40mOK\E[37;40m] Replaced "$placeholderfile" to "$linkfile" with symlink"
  else
    echo -e "[\E[31;40mWARNING\E[37;40m] $placeholderfile contains newline(s)"
  fi
  tput sgr0
done
}
```

В результате его выполнения создаются символические ссылки на файлы проекта. Сообщения о созданных ссылках выводятся на экран:

```
[OK] символическая ссылка создана для .\BR1-MCA6.mpr <<===>> P:\PTUSA-projects\BR1\BR1-CIP6-visu\BR1-MCA6.mpr
[OK] символическая ссылка создана для .\BR1-MCA6.mprx <<===>> P:\PTUSA-projects\BR1\BR1-CIP6-visu\BR1-MCA6.mprx
```

Если нет сообщений, значит никаких ссылок не было создано. Для создания ссылок заново необходимо удалить файлы `BR1-MCA6.mpr` и `BR1-MCA6.mprx`, заново их извлечь с помощью **svn** и выполнить скрипт создания ссылок (1).

Аналогичные действия надо провести для каталога баз каналов `chbase` (`p:\monitor\chbase`).

Также необходимо добавить ссылку на каталог с файлами проекта (`BR1-MCA6.files`).
Делаем это путем выполнения следующей команды в `cmd` (чтобы вернуться в `cmd` из `bash` выполняем команду `exit`):

```
mklink /D P:\Monitor\projects\BR1-MCA6.files p:\PTUSA-projects\BR1\BR1-CIP6-visu\BR1-MCA6.files
```
Результат:

```
p:\monitor\projects>mklink /D P:\Monitor\projects\BR1-MCA6.files p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.files
символическая ссылка создана для P:\Monitor\projects\BR1-MCA6.files <<===>> p:\PTUSA-projects-visu\BR1\BR1-CIP6\BR1-MCA6.files
```

### 1.2.3 Результаты

Таким образом, ссылки успешно созданы. Теперь можно работать с проектом как обычно - править в папке **"p:\monitor"**, а запросы фиксировать на сервисе **GitHub**.
