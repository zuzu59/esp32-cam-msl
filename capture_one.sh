#!/bin/bash
# Petit script qui ne fait que de prendre une image d'une mini caméra esp32-cam
# zf231112.1938

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "
Syntax:

./capture_one.sh folder_images room_name ip_camera

"
    exit
fi

zYEAR=`date +%Y` 
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H-%M-%S` 
zDIFF='diff/'${YEAR}/${MONTH}/${DAY}/${TIME}
zTarget={$1}/${YEAR}/${MONTH}/${DAY}

echo -e $zTarget

#mkdir -p ./$1/$zYEAR/$zMONTH/$zDAY

exit




while :; do wget -O "./images/cam_67_$(date +"%Y%m%d.%H%M%S").jpg" http://192.168.0.67/1600x1200.jpg; sleep 3; done

