# Задание 8. Поиск по хранилищу (AQL)

**Цель:** находить артефакты запросами, а не руками в интерфейсе.

AQL (Artifactory Query Language) — язык поиска, похожий на SQL.

## Шаги

1. Найдите все файлы myapp в своём репозитории (ВПИШИТЕ пароль):

```bash
curl -u admin:____ -X POST \
  -H "Content-Type: text/plain" \
  -d 'items.find({"repo": "myapp-local", "name": {"$match": "myapp*"}})' \
  http://localhost:8081/artifactory/api/search/aql
```

Посмотрите на результат: сколько файлов нашлось и по каким путям.

2. Измените запрос так, чтобы нашёлся **только файл версии 1.0.0**.
   ВПИШИТЕ условие вместо `____` (подсказка: есть поле `path`,
   а `"$match": "..."` понимает звёздочку):

```bash
curl -u admin:ВАШ_ПАРОЛЬ -X POST \
  -H "Content-Type: text/plain" \
  -d 'items.find({"repo": "myapp-local", ____})' \
  http://localhost:8081/artifactory/api/search/aql
```

## Результат

Второй запрос возвращает ровно один файл — из папки `myapp/1.0.0`.
В отчёт: ваш итоговый запрос.
