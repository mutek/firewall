#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
#
# gli passi un file con un elenco di IP e lui carica il fw
#
#

IP_LIST=$1

[ -z $IP_LIST ] && echo "uso: $0 FILE_LISTA_IP" && exit 1

[ ! -f $IP_LIST ] && echo "Non è un file" && exit 1

for IP in $(cat $IP_LIST)
do

	#echo "valuto: "$IP

	iptables -A INPUT -s $IP -j DROP

	wait

	printf .

done

echo ""

