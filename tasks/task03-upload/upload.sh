#!/usr/bin/env bash
# upload.sh — публикация артефакта в Artifactory
# ВПИШИТЕ свой пароль администратора:
PASSWORD="____"
VERSION="1.0.0"

tar -czf myapp-$VERSION.tar.gz -C myapp .

curl -u admin:$PASSWORD -T myapp-$VERSION.tar.gz \
  http://localhost:8081/artifactory/myapp-local/myapp/$VERSION/myapp-$VERSION.tar.gz
