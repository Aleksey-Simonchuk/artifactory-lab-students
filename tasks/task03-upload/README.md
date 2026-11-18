# Задание 3. Первая публикация артефакта

**Цель:** собрать «релиз» приложения и загрузить его в репозиторий.

## Шаги

1. В этой папке (`tasks/task03-upload`) создайте приложение — каталог
   с двумя файлами:

```bash
mkdir myapp
echo "print('hello from myapp')" > myapp/main.py
echo "1.0.0" > myapp/VERSION
```

2. Откройте файл `upload.sh` и ВПИШИТЕ свой пароль в строку `PASSWORD="____"`.
3. Запустите скрипт:

```bash
chmod +x upload.sh
./upload.sh
```

Скрипт упакует `myapp/` в архив и загрузит его в репозиторий по адресу
`myapp-local/myapp/1.0.0/`.

4. Найдите файл в интерфейсе: **Application** (иконка кубика) →
   **Artifactory** → **Artifacts** → `myapp-local` → `myapp` → `1.0.0`.

## Результат

В ответе сервера — JSON с контрольными суммами `sha1`, `sha256`, `md5`.
В отчёт: этот JSON.
