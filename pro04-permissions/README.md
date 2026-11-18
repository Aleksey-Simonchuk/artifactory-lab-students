# Pro 4. Права доступа

**Что делаем:** создаём пользователя `developer`, которому можно публиковать,
но нельзя удалять, и проверяем, что ограничение работает.

**Зачем:** в жизни CI публикует артефакты не под admin, а под учёткой
с минимальными правами — принцип наименьших привилегий.

## Шаг 1. Создайте пользователя

**Administration → User Management → Users → New User**:
- User Name: `developer`
- Email: любой (например `dev@example.com`)
- Password: придумайте и запомните

## Шаг 2. Создайте разрешение (Permission)

**Administration → User Management → Permissions → New Permission**:
1. Имя: `myapp-dev`.
2. Вкладка **Repositories**: добавьте `myapp-local` в Selected Repositories.
3. Вкладка **Users**: добавьте `developer`, отметьте права **Read**
   и **Deploy/Cache**. Право **Delete/Overwrite** — НЕ отмечайте.

## Шаг 3. Проверьте загрузку (должна пройти)

```bash
echo "test" > test.txt
curl -u developer:ПАРОЛЬ_DEVELOPER -T test.txt \
  -w "\nHTTP-код: %{http_code}\n" \
  http://localhost:8081/artifactory/myapp-local/developer-test/test.txt
```

## Шаг 4. Проверьте удаление (должно быть запрещено)

```bash
curl -u developer:ПАРОЛЬ_DEVELOPER -X DELETE \
  -w "\nHTTP-код: %{http_code}\n" \
  http://localhost:8081/artifactory/myapp-local/developer-test/test.txt
```

## Шаг 5. Уберите за собой

Удалите `developer-test` под admin (тем же запросом с `-u admin:...`).

## Результат

Загрузка — 201, удаление — 403.

**В отчёт:** оба кода и ответ на вопрос: почему CI-пользователю
не дают право удалять?
