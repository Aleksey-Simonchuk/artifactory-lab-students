#!/usr/bin/env bash
# info.sh — выводит sha256 артефакта
# ВПИШИТЕ пароль и слово для поиска в grep:
PASSWORD="____"

curl -s -u admin:$PASSWORD \
  http://localhost:8081/artifactory/api/storage/myapp-local/myapp/1.0.0/myapp-1.0.0.tar.gz \
  | grep "____" | cut -d'"' -f4
