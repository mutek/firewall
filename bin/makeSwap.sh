#!/usr/bin/env sh
#
# makeSwap.sh
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

NOME_FILE=$1

[ -z $1 ] && NOME_FILE="2GB.swap"

dd if=/dev/zero of=./$NOME_FILE bs=2M count=1024
wait

mkswap -L $NOME_FILE ./$NOME_FILE
wait

chmod 0600 ./$NOME_FILE
wait

# per attivarla
# swapon ./$NOME_FILE

# attivazione al boot
# aggiungere ad fstab:
# /cartella/di/$NOME_FILE swap swap defaults 0 0
