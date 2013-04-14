#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
#
# elenca gli IP con tentativo di login root e password fallita
#

cat /var/log/auth.log | grep "Failed password for root" | cut -d":" -f 4 | cut -d" " -f 7 | sort -gu
