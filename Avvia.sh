#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
#
# Esegue la procedura di popolamento del fw
#
#

cat IP.txt > IP.rollback
wait

cat IP.txt > IP.tmp
wait

./Failed_password_for_root.sh >> IP.tmp
wait

./Invalid_user.sh >> IP.tmp
wait

./BREAK.sh >> IP.tmp
wait

cat IP.tmp | sort -gu > IP.txt
wait

iptables -F
wait

./Header.sh
wait

./DropIP.sh IP.txt
wait

iptables -L
