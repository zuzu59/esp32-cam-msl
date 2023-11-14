#!/bin/bash
#Petit script pour démarrer un mini serveur WEB
#zf231114.1543

zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=$zAPP_FOLDER/data

while true ; do
    pushd $zDATA_FOLDER; python3 -m http.server 8080; popd
done
