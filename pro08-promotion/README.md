# Pro 8. Promotion: из dev в прод

**Что делаем:** заводим два репозитория — `myapp-dev-local` и
`myapp-prod-local` — и «промоутим» проверенную версию.

**Зачем:** в прод попадает тот же бинарник, что прошёл тесты, —
не пересборка. Пересобранный «тот же» артефакт может отличаться
(другой коммит, другие зависимости). Правило: **промоутим биты,
а не исходники**.

## Шаг 1. Создайте два репозитория

Через UI (как в задании 4), оба Generic: `myapp-dev-local`
и `myapp-prod-local`.

## Шаг 2. Опубликуйте версию в dev

```bash
cd ../task06-build-app   # там живёт myapp/
# соберите архив версии 1.2.0 (поменяйте VERSION и main.py), затем:
curl -u admin:ВАШ_ПАРОЛЬ -T myapp-1.2.0.tar.gz \
  http://localhost:8081/artifactory/myapp-dev-local/myapp/1.2.0/myapp-1.2.0.tar.gz
```

## Шаг 3. Промоутните в prod

В платной версии есть специальный API. В OSS делаем руками, но честно —
без пересборки: скачали из dev → загрузили в prod:

```bash
curl -u admin:ВАШ_ПАРОЛЬ -o promo.tar.gz \
  http://localhost:8081/artifactory/myapp-dev-local/myapp/1.2.0/myapp-1.2.0.tar.gz

curl -u admin:ВАШ_ПАРОЛЬ -T promo.tar.gz \
  http://localhost:8081/artifactory/myapp-prod-local/myapp/1.2.0/myapp-1.2.0.tar.gz
```

## Шаг 4. Докажите, что это тот же файл

```bash
shasum -a 256 promo.tar.gz
```

Сравните с checksums в ответе из шага 2. Совпали — промоушн честный.

## Результат

Версия 1.2.0 лежит в обоих репозиториях, sha256 совпадает.

**В отчёт:** суммы из dev и prod рядом. Ответ письменно: что плохого
в схеме «для прода пересоберём заново»?
