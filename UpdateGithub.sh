#!/usr/bin/env sh
#
# Luca Cappelletti 2013
# GNU/GPL
#
# UpdateGithub.sh
#

git config --global user.name "Luther Blissett"
git config --global user.email luther.blissett@www.localhost.localdomain

echo "Aggiungo i cambiamenti al database locale"
git add .
echo "Inserisci una descrizione dei tuoi cambiamenti"
read n
echo "Eseguo la finalizzazione dei cambiamenti in locale"
git commit -a -m "$n"

echo "Invio i cambiamenti locali al deposito remoto..."
git push origin master
echo "ok"
