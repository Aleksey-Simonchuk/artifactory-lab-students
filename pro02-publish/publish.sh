#!/usr/bin/env bash
# publish.sh — упаковка и публикация артефакта с проверкой результата
# Использование: ./publish.sh <версия>
set -euo pipefail

VERSION="${1:?Использование: ./publish.sh <версия>}"
PASSWORD="____"   # ВПИШИТЕ пароль
REPO="myapp-local"
ART_URL="http://localhost:8081/artifactory"
ART_NAME="myapp-$VERSION.tar.gz"

# 1. ВПИШИТЕ команду упаковки каталога myapp в архив $ART_NAME
#    (вы делали это в задании 6):
____

# 2. Загружаем и запоминаем HTTP-код ответа
CODE=$(curl -s -u "admin:$PASSWORD" -o /dev/null -w "%{http_code}" \
  -T "$ART_NAME" \
  "$ART_URL/$REPO/myapp/$VERSION/$ART_NAME")

# 3. ВПИШИТЕ код успешной загрузки:
if [[ "$CODE" == "____" ]]; then
  echo "Опубликовано: $REPO/myapp/$VERSION/$ART_NAME"
else
  echo "Ошибка публикации: HTTP $CODE" >&2
  exit 1
fi
