#!/usr/bin/env sh
#
# Luca Cappelletti
# luca.cappelletti@gmail.com
# ogni 3600 secondi riavvia Apache con la speranza di un buon flush
# almeno nella peggiore delle ipotesi prima o poi rifai ssh
#

SECONDI=300

while true
do

sleep $SECONDI

/etc/init.d/apache2 stop
wait
sleep 1
/etc/init.d/apache2 start

done
