# Pro-задание 4. Права доступа

**Цель:** создать пользователя с ограниченными правами и проверить,
что ограничения работают.

В реальной жизни CI-система публикует артефакты не под admin, а под отдельной
учёткой, которой нельзя, например, удалять.

## Шаги

1. В UI: **Administration → User Management → Users → New User**.
   Имя: `developer`, придумайте пароль, задайте email (любой).
2. **Administration → User Management → Permissions → New Permission**:
   - имя: `myapp-dev`;
   - вкладка Repositories → добавьте `myapp-local`;
   - Users → добавьте `developer` с правами **Read** и **Deploy/Cache**,
     без **Delete**.
3. Проверьте из терминала (ВПИШИТЕ пароль developer). Загрузка — должна
   пройти:

```bash
echo "test" > test.txt
curl -u developer:____ -T test.txt \
  -w "\nHTTP-код: %{http_code}\n" \
  http://localhost:8081/artifactory/myapp-local/developer-test/test.txt
```

4. А теперь попробуйте удалить этот файл от его имени:

```bash
curl -u developer:____ -X DELETE \
  -w "\nHTTP-код: %{http_code}\n" \
  http://localhost:8081/artifactory/myapp-local/developer-test/test.txt
```

5. Удалите файл под admin, чтобы не мусорить.

## Результат

Загрузка — 201, удаление — 403. В отчёт: оба кода.
Вопрос на понимание: почему CI-пользователю не дают право удалять артефакты?
