#!/bin/bash

# Petit script pour démarrer un mini serveur WEB, attention cela n'utilise plus python mais lighttpd !
#
# ATTENTION: il faut modifier le port et le dossier racine dans le fichier $zAPP_FOLDER/lighttpd.conf !
#
#zf231211.1756, zf240731.1556, zf240926.1702


zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=/mnt/data


# permet de rendre non fonctionnel le directory browsing dans la racine
# afin de diminuer la surface d'attaque
touch $zDATA_FOLDER/index.html

sudo lighttpd -f $zAPP_FOLDER/lighttpd.conf


echo -e "

Si jamais pour info:

crontab -e
@reboot  sleep 30 && /home/ubuntu/dev/esp32-cam-st-luc/start_web_server.sh

Et pour l'arrêter facilement il faut faire: 

sudo pkill lighttpd

"


exit


while true ; do
    pushd $zDATA_FOLDER; python3 -m http.server 30080; popd
done

