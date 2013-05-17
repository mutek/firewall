#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
#
# Esegue la procedura di popolamento del fw
#
#
# Copyleft 2013 Luca Cappelletti <luca.cappelletti@gmail.com>
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#

cat IP.txt > IP.rollback
wait

cat IP.txt > IP.tmp
wait

# preleva materiale popolato dagli altri server che allineano git
# cosi invece di rischiare i merge si lavora di pull e poi push preservando le localita
# il futuro sort -u provvede poi a svolgere la formalizzazione giusta dell'unione degli insiemi (valori presi una volta sola)
for i in $(ls *.other)
do

	cat $i >> IP.tmp
	wait

done

./Failed_password_for_root.sh >> IP.tmp
wait

./Invalid_user.sh >> IP.tmp
wait

./BREAK.sh >> IP.tmp
wait

cat IP.tmp | sort -u | sort -n > IP.txt
wait

cp IP.txt IP.$(hostname).other
wait

iptables -F
wait

iptables -X
wait

./Header.sh
wait

./DropIP.sh IP.txt
wait

## Attiva per il Debug
##iptables -L
