#!/bin/bash
bean=`cat /proc/user_beancounters`
guar=`echo "$bean" | grep vmguar | awk '{ print $4;}'`
priv=`echo "$bean" | grep privvm | awk '{ print $2;}'`
let totale=guar/256
let usata=priv/256
let libera=totale-usata
let percentuale=usata*100/totale
echo "Memoria VPS:"
echo "totale: $totale mb   usata: $usata mb ($percentuale%)   libera: $libera mb"
