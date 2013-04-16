#!/usr/bin/env sh
#
# Luca Cappelletti 2013
#
# GNU/GPL
#
# header iptable per mitigare questioni torride
#

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
wait
iptables -A INPUT -f -j DROP
wait
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
wait
iptables -A INPIT -p tcp --tcp-flags ALL NONE -j DROP
wait

# la seguente sequenza svolge un throttling a 60 secondi
iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --set
wait
iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 6 -j DROP
wait
