#!/usr/bin/env bash
# cleanup.sh — оставляет 2 последние версии myapp, остальные удаляет
set -euo pipefail

PASSWORD="____"   # ВПИШИТЕ пароль
REPO="myapp-local"
ART_URL="http://localhost:8081/artifactory"
KEEP=2

# Список версий (папок внутри myapp/), отсортированный по номеру версии
versions=$(curl -fsS -u "admin:$PASSWORD" "$ART_URL/api/storage/$REPO/myapp/" \
  | grep -o '"uri" : "/[^"]*"' \
  | sed 's#"uri" : "/##; s#"##' \
  | sort -V)

total=$(echo "$versions" | wc -l | tr -d ' ')
echo "Найдено версий: $total, оставляем последние $KEEP"

# Берём все, кроме последних KEEP
to_delete=$(echo "$versions" | head -n "$((total - KEEP))")

for v in $to_delete; do
  # ВПИШИТЕ HTTP-метод, которым удаляют ресурс:
  curl -fsS -u "admin:$PASSWORD" -X ____ -o /dev/null "$ART_URL/$REPO/myapp/$v/"
  echo "Удалено: $v"
done
