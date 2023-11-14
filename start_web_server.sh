#!/bin/bash
#Petit script pour démarrer un mini serveur WEB
#zf231114.1552

zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=$zAPP_FOLDER/data

#permet de rendre non fonctionnel le directory browsing dans la racine
#afin de diminuer la surface d'attaque
touch $zDATA_FOLDER/index.html

while true ; do
    pushd $zDATA_FOLDER; python3 -m http.server 8080; popd
done
