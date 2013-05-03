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
printf .
iptables -A INPUT -f -j DROP
wait
printf .
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
wait
printf .
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
wait
printf .
# la seguente sequenza svolge un throttling a 60 secondi
iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --set
wait
printf .
iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 6 -j DROP
wait
printf .

# sulla 22 dallo stesso IP ci lavoriamo in 4 gatti quindi:
iptables  -A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above 4 -j REJECT
wait
printf .

# limita sulla 80
iptables -A INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
wait
printf .
iptables -A INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 6 -j DROP
wait
printf .

# massimo 20 per IP sulla 80
iptables -A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 20 -j REJECT --reject-with tcp-reset
wait
printf .
