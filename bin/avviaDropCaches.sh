#!/usr/bin/env sh
#
# avviaDropCaches.sh
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

SECONDI=60

while true
do

	sleep $SECONDI

	cd /root/Firewall/DROPCACHES

	/root/Firewall/DROPCACHES/DropCaches.sh

	wait

done
