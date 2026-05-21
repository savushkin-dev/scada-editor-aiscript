**Эти команды нужно выполнить от пользователя с sudo-доступом.**

Документ подготовлен под текущий стек проекта: **Java 17 + Maven (CLI-приложение, без веб-сервера и без обязательной БД)**.  
Базовая ОС: **Ubuntu 22.04 / Debian 12**.

---

## 1) Список предустановленного ПО на сервере Linux

Минимально необходимое ПО:

- `openjdk-17-jdk` — запуск и сборка приложения.
- `git` — получение исходного кода.
- `curl` — служебные проверки/загрузка (часто уже установлен).
- `ca-certificates` — TLS-сертификаты для HTTPS (Maven/Git).
- `unzip` — иногда требуется вспомогательно.
- `systemd` — обычно уже есть в Ubuntu/Debian (для фонового сервиса при необходимости).

Опционально:

- `maven` — **не обязателен**, т.к. в проекте есть Maven Wrapper (`mvnw`), но можно поставить для админ-задач.
- `ufw` — если на сервере используется этот firewall-инструмент.

---

## 2) Пошаговые команды Linux для настройки среды и развертывания

## Шаг 0. Обновление пакетов и установка зависимостей

```bash
sudo apt-get update -y
sudo apt-get install -y openjdk-17-jdk git curl ca-certificates unzip
```

Проверка Java:

```bash
java -version
javac -version
```

Ожидается версия **17**.

---

## Шаг 1. Создание системного пользователя и каталогов

> Запуск приложения от отдельного технического пользователя безопаснее, чем от `root`.

```bash
sudo useradd --system --create-home --home-dir /opt/scada-generator --shell /bin/bash scada || true
sudo mkdir -p /opt/scada-generator/app
sudo mkdir -p /opt/scada-generator/data
sudo mkdir -p /opt/scada-generator/logs
sudo chown -R scada:scada /opt/scada-generator
```

---

## Шаг 2. Клонирование проекта

> Замените URL на ваш реальный репозиторий.

```bash
sudo -u scada git clone <REPO_URL> /opt/scada-generator/app
```

Если репозиторий уже склонирован:

```bash
sudo -u scada git -C /opt/scada-generator/app pull --ff-only
```

---

## Шаг 3. Сборка приложения

```bash
cd /opt/scada-generator/app
sudo -u scada chmod +x mvnw
sudo -u scada ./mvnw -B -DskipTests clean package
```

Если нужно прогнать тесты перед сборкой:

```bash
cd /opt/scada-generator/app
sudo -u scada ./mvnw -B test
sudo -u scada ./mvnw -B clean package
```

После сборки должны появиться:

- `target/scada-generator-0.1.0-SNAPSHOT.jar`
- `target/lib/`

---

## Шаг 4. Проверка CLI-команд вручную

```bash
cd /opt/scada-generator/app
sudo -u scada java -jar target/scada-generator-0.1.0-SNAPSHOT.jar --help
sudo -u scada java -jar target/scada-generator-0.1.0-SNAPSHOT.jar generate --help
sudo -u scada java -jar target/scada-generator-0.1.0-SNAPSHOT.jar update --help
```

---

## Шаг 5 (опционально). Создание `systemd`-сервиса для фонового режима `watch`

> Нужен только если требуется постоянный фоновый процесс.

Создать unit-файл:

```bash
sudo tee /etc/systemd/system/scada-generator-watch.service > /dev/null <<'EOF'
[Unit]
Description=SCADA Generator Watch Service
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=scada
Group=scada
WorkingDirectory=/opt/scada-generator/app
ExecStart=/usr/bin/java -jar /opt/scada-generator/app/target/scada-generator-0.1.0-SNAPSHOT.jar watch
Restart=on-failure
RestartSec=5
StandardOutput=append:/opt/scada-generator/logs/watch.out.log
StandardError=append:/opt/scada-generator/logs/watch.err.log
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=full
ProtectHome=true

[Install]
WantedBy=multi-user.target
EOF
```

Применить и запустить:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now scada-generator-watch.service
```

Проверка статуса и логов:

```bash
sudo systemctl status scada-generator-watch.service --no-pager
sudo journalctl -u scada-generator-watch.service -n 100 --no-pager
```

Остановка/перезапуск:

```bash
sudo systemctl stop scada-generator-watch.service
sudo systemctl restart scada-generator-watch.service
```

---

## Шаг 6 (опционально). Firewall/порты

Для текущего CLI-проекта входящие порты обычно **не требуются**.  
Если `watch` не поднимает HTTP-сервер, открывать порты не нужно.

Если в инфраструктуре обязателен `ufw`:

```bash
sudo ufw status verbose
```

(Правила на открытие портов добавлять только при фактической необходимости.)

---

## Проверка

Чек-лист для руководителя/администратора:

- Java 17 установлена:
  - `java -version` показывает `17.x`.
- Проект собран:
  - существует `target/scada-generator-0.1.0-SNAPSHOT.jar`.
- CLI работает:
  - `java -jar ... --help` выводит справку.
  - `generate --help` и `update --help` выполняются без ошибок.
- (Если включали сервис):
  - `systemctl status scada-generator-watch.service` = `active (running)`.
  - в логах нет критических ошибок запуска.

Быстрая итоговая проверка командами:

```bash
java -version
sudo -u scada test -f /opt/scada-generator/app/target/scada-generator-0.1.0-SNAPSHOT.jar && echo "JAR OK"
sudo -u scada java -jar /opt/scada-generator/app/target/scada-generator-0.1.0-SNAPSHOT.jar --help >/dev/null && echo "CLI OK"
sudo systemctl is-active scada-generator-watch.service 2>/dev/null || true
```

---

## Примечания по эксплуатации

- Для обновления версии приложения:
  1. `git pull --ff-only`
  2. `./mvnw -B -DskipTests clean package`
  3. `sudo systemctl restart scada-generator-watch.service` (если сервис используется)
- Рекомендуется хранить рабочие входные/выходные данные в `/opt/scada-generator/data`.
- Не запускать приложение от `root` в штатном режиме.
