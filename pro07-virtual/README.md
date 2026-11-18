# Pro 7. Virtual-репозиторий: один URL поверх всего

**Что делаем:** объединяем local и remote под одним адресом.

**Зачем:** клиентам не нужно знать, где лежит файл — у нас или в кэше
внешнего мира. Все ходят на один URL, Artifactory сам ищет: сначала
в local, потом в remote.

## Шаг 1. Создайте virtual-репозиторий

**Administration → Repositories → Add Repositories → Virtual Repository**:
- тип: **Maven** (тот же, что у репозиториев внутри)
- Repository Key: `myapp-all`
- в список репозиториев добавьте `maven-central` (и `example-repo-local`,
  если он типа Generic — тогда virtual тоже делайте Generic и добавьте
  только его и `myapp-local`; типы внутри virtual должны совпадать)

Сохраните.

## Шаг 2. Скачайте внешний пакет через virtual

```bash
curl -s -u admin:ВАШ_ПАРОЛЬ -o /dev/null -w "%{http_code}\n" \
  http://localhost:8081/artifactory/myapp-all/junit/junit/4.13.2/junit-4.13.2.jar
```

Хотя в virtual мы ничего не загружали, файл отдаётся — Artifactory нашёл
его в `maven-central`.

## Шаг 3 (по желанию). Порядок поиска

В настройках virtual-репозитория репозитории можно таскать мышкой —
порядок в списке и есть порядок поиска. Ответьте письменно: что будет,
если в local и в remote лежит файл с одинаковым путём, и почему
порядок важен для безопасности (ключевые слова: dependency confusion).

## Результат

**В отчёт:** код ответа из шага 2, ответ на вопрос из шага 3.
