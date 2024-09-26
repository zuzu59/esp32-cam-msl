#!/bin/bash
# Petit script qui ne fait que de prendre une image d'une mini caméra esp32-cam
# zf231114.1053, zf240926.1650

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "
Syntax:

./capture_one.sh image_folder ip_camera image_name

"
    exit
fi

echo -e "
Dossier pour l'image: $1
IP de la caméra: $2
Nom de l'image: $3
"


mkdir -p $1
wget -O $1/$3 http://$2/1280x1024.jpg


