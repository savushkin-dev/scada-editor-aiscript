# Git. Перенос проекта с svn на git #

## 1. Перенос общего репозитория с svn на git ##

Переходим в каталог **"p:/PTUSA-projects/"**. В данном каталоге создаём файл **users.txt** со следующим содержимым:

```
artem = Artem Rudnitsky <artem.rudnitsky@gmail.com>
id = Dzmitry Ivaniuk <dzimitriy@gmail.com>
id@BMK = Dzmitry Ivaniuk <dzimitriy@gmail.com>
Tol = Anatoli Bohush <anatoli.bohush@gmail.com>
tol = Anatoli Bohush <anatoli.bohush@gmail.com>
VisualSVN Server = Dzmitry Ivaniuk <dzimitriy@gmail.com>
pai = Alexandra Novik <pai@pda.savushkin.by>
asvovik = Vladimir Hodor <asvovik@pda.savushkin.by>
asutppr = Dzmitry Ivaniuk <dzimitriy@gmail.com>
ak89 = Artsem Kuzin <ak89@pda.savushkin.by>
painter = Uladzimir Lavrentev <painter@pda.savushkin.by>
sedr = Dzmitri Umetsky <sedrpdasavushkinby@gmail.com>
tsam = AndreiSavushkin <58879232+AndreiSavushkin@users.noreply.github.com>
asutp3 = Yuri Fedoseev <yuri.fedoseev.oggy@gmail.com>
asutp10 = Alexandr Behunkov <asutp10@pda.savushkin.by>
Kirill = Kirill Meankouski <kirill.simatic@gmail.com>
kirill = Kirill Meankouski <kirill.simatic@gmail.com>
olya = Olya Boguto <Olya2@pda.savushkin.by>
Olya = Olya Boguto <Olya2@pda.savushkin.by>
bien = Oleg Bugera <bien@pda.savushkin.by>
Bien = Oleg Bugera <bien@pda.savushkin.by>
gra = Artem Gribcov <GRA@pda.savushkin.by>
GRA = Artem Gribcov <GRA@pda.savushkin.by>
asutp5 = Zhanna Cherevko <zh.cherevko@pda.savushkin.by>
asutp4 = Alexey Volkov <asutp4@pda.savushkin.by>
alena = Alena Bugera <Alena@pda.savushkin.by>
Alena = Alena Bugera <Alena@pda.savushkin.by>
asutp2 = Artem Vlasovec <asutp2@pda.savushkin.by>
asutp6 = Serega Moroz <serega-pro01@mail.ru>
asutp7 = Andrey Nemenkov <a.nemenkov@pda.savushkin.by>
dva = Viktor Denisenko <dva@pda.savushkin.by>
zezyotko = Vadim Zezyotko <zetvadik@gmail.com>
ser = Sergei Silakov <silakov_2001@mail.ru>
```

Далее используем следующую команду:

``` bash
git.exe svn clone "https://10.0.16.7/svn/ptusa/trunk/PTUSA projects/projects" "P:/PTUSA-projects-git" --authors-file=users.txt --no-metadata
```

Данная операция занимает **несколько часов** (на момент написания руководства в репозитории находилось более 15'000 фиксаций). После завершения (успешного) операции в каталоге "P:/PTUSA-projects-git" будет общий гит-репозиторий всех проектов.

Для обновления уже существующего репозитория используем следующую команду (находясь в каталоге репозитория):

``` bash
git.exe svn fetch
git.exe reset --hard remotes/git-svn
```

## 2. Установка git-filter-repo

Устанавливаем git-filter-repo из https://github.com/newren/git-filter-repo.

## 3. Перенос конкретного проекта в отдельный репозиторий ##

Делаем копию общего репозитория **"P:/PTUSA-projects-git"** в каталог требуемого отдельного проекта, например, в **"p:/PTUSA-projects/BR1/BR1-Приемка"**. Далее переходим в данный каталог и выполняем следующую команду:

``` bash
git filter-repo --subdirectory-filter BR1-Приемка --subdirectory-filter "BR1 Приемка" --force
```

После выполнения команды в данном репозитории останется только проект **"BR1-Приемка"**.

## 4. Создание проекта на GitHub

Создаем проект (например, BR1-Acceptance) на GitHub на основе шаблона **"savushkin-r-d/SITE1-Project-name"**. Таким образом, в данном проекте есть необходимые файлы и подмодули для размещения проекта на GitHub. Заключительным этапом является добавление измененных данных и их фиксация в полученный ранее репозиторий.

## 5 Объединение истории изменений и сгенерированного на GitHub проекта

Для добавления удаленного репозитория находясь в каталоге проекта выполняем следующую команду:

``` bash
git remote add upstream https://github.com/savushkin-r-d/BR1-Acceptance.git
git fetch
```

Переключаемся на ветвь upstream/master:

``` bash
git checkout upstream/master
```

Выполняем перебазирование ветви master:

``` bash
git rebase master
```

### 5.1 Изменение readme.md

Первые строки данного файла из шаблона:

``` md
# **SITE1-Название-проекта (SITE1-Project-name)** #

Проект автоматизации.
```
изменяем на следующие:

``` md
# **BR1-Приемка (BR1-Acceptance)** #

Проект автоматизации приёмки молока в ПФ г. Брест.
```

### 5.2 Изменение CODEOWNERS

Изменяем содержимое файла **CODEOWNERS** с учётом актуального ответственного за проект:

``` md
# Lines starting with '#' are comments.
# Each line is a file pattern followed by one or more owners.

# These owners will be the default owners for everything in the repo.
*       @Serega-pixel

# Owner for user logic.
*.plua @idzm @AlexandrBehunkov
```

Добавляем изменения в индекс:

``` bash
git add .
```

Фиксируем изменения:

``` bash
git commit --amend -m "Проект переведен на GitHub"
```

Добавляем изменения в ветку master:


``` bash
git branch temp
git checkout master
git merge temp
```

Добавляем изменения в удаленный репозиторий:

``` bash
git push upstream master --force
```

Удаляем временную ветвь:

``` bash
git branch -d temp
```

### 5.3 Итоговый скрипт

Вот данные команды, объединённые в один скрипт:

``` bash
git remote add upstream https://github.com/savushkin-r-d/BR1-Acceptance.git
git fetch
git checkout upstream/master
git rebase master

sed -i 's/SITE1-Название-проекта (SITE1-Project-name)/BR1-Приемка (BR1-Acceptance)/' ./docs/README.MD
sed -i 's/Проект автоматизации./Проект автоматизации приёмки молока в ПФ г. Брест./' ./docs/README.MD
sed -i 's/@KUZMA-1989/@Serega-pixel/' ./.github/CODEOWNERS # These owners will be the default owners for everything in the repo.
sed -i 's/@idzm/@AlexandrBehunkov/' ./.github/CODEOWNERS # Owner for user logic (*.plua).

git add .
git commit --amend -m "Проект переведен на GitHub"
git branch temp
git checkout master
git merge temp
git push upstream master --force
git branch -d temp
```

## 6 Настройка проекта на GitHub

Настраиваем параметры защищённой ветви **master**.
