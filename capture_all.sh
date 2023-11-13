#!/bin/bash
#Petit script pour prendre une image de toutes les mini caméras esp32-cam
#zf231113.1116

zIMAGE_FOLDER="./images"
zYEAR=`date +%Y` 
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H%M%S` 

zTarget=$zIMAGE_FOLDER/$zYEAR/$zMONTH/$zDAY

echo -e $zTarget

#mkdir -p $zTarget


./capture_one.sh $zTarget/bois 192.168.0.67 $zTIME.jpg
./capture_one.sh $zTarget/metal 192.168.0.67 $zTIME.jpg

