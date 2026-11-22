#!/usr/bin/env bash
# upload.sh — публикация готового архива в Artifactory
# ВПИШИТЕ свой пароль администратора:
PASSWORD="KWA55_21vsky"
VERSION="1.0.0"

curl -u admin:$PASSWORD -T myapp-$VERSION.tar.gz \
  http://localhost:8081/artifactory/myapp-local/myapp/$VERSION/myapp-$VERSION.tar.gz
