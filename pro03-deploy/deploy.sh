#!/usr/bin/env bash
# deploy.sh — находит последнюю версию myapp и распаковывает в deploy/
set -euo pipefail

PASSWORD="____"   # ВПИШИТЕ пароль
REPO="myapp-local"
ART_URL="http://localhost:8081/artifactory"

versions=$(curl -fsS -u "admin:$PASSWORD" "$ART_URL/api/storage/$REPO/myapp/" \
  | grep -o '"uri" : "/[^"]*"' \
  | sed 's#"uri" : "/##; s#"##' \
  | sort -V)

# 1. ВПИШИТЕ: как взять последнюю строку списка:
latest=$(echo "$versions" | ____)
echo "Последняя версия: $latest"

file="myapp-$latest.tar.gz"
curl -fsS -u "admin:$PASSWORD" -o "/tmp/$file" \
  "$ART_URL/$REPO/myapp/$latest/$file"

rm -rf deploy && mkdir deploy
# 2. ВПИШИТЕ команду распаковки /tmp/$file в каталог deploy:
____

echo "Развёрнута версия: $(cat deploy/VERSION)"
