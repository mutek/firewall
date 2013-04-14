#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
#
# filtra rozzo il file auth.log e cava gli IP delle righe  Invalid user
#

NOME_LOG="auth.log"

[ ! -f /var/log/$NOME_LOG ] && echo "Non trovo il file "$NOME_LOG && exit 1

cat /var/log/auth.log | grep "Invalid user" | cut -d":" -f 4 | cut -d" " -f 6 | sort -gu
