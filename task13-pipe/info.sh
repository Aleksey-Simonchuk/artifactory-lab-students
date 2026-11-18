#!/usr/bin/env bash
# info.sh — выводит контрольную сумму артефакта
# ВПИШИТЕ пароль и название поля для grep:
PASSWORD="____"

curl -s -u admin:$PASSWORD \
  http://localhost:8081/artifactory/api/storage/myapp-local/myapp/1.0.0/myapp-1.0.0.tar.gz \
  | grep "____" | cut -d'"' -f4 | sort -u
