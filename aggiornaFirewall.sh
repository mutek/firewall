#!/usr/bin/env sh
#
# Luca Cappelletti (copyleft) 2013
# GNU/GPL
# luca.cappelletti@gmail.com
# 
# 
#

SECONDI=120

while true
do

	sleep $SECONDI

	cd /root/Firewall

	/root/Firewall/Avvia.sh

	wait

done
