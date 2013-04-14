#!/usr/bin/env sh

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
wait
iptables -A INPUT -f -j DROP
wait
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
wait
iptables -A INPIT -p tcp --tcp-flags ALL NONE -j DROP
