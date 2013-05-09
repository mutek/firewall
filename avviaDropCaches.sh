#!/usr/bin/env sh
#
# Luca Cappelletti (copyleft) 2013
# GNU/GPL
# luca.cappelletti@gmail.com
# 
# 
#

SECONDI=60

while true
do

	sleep $SECONDI

	cd /root/Firewall/DROPCACHES

	/root/Firewall/DROPCACHES/DropCaches.sh

	wait

done
