#!/bin/bash
#Petit script pour prendre une image de toutes les mini caméras esp32-cam
#zf231114.1430


zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=$zAPP_FOLDER/data
zIMAGES_FOLDER=$zDATA_FOLDER/images
zACTUAL_FOLDER=$zDATA_FOLDER/actual

zYEAR=`date +%Y` 
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H%M%S` 

zTARGET=$zIMAGES_FOLDER/$zYEAR/$zMONTH/$zDAY

echo -e $zTARGET

zESPACE=bois
$zAPP_FOLDER/capture_one.sh $zTARGET/$zESPACE 192.168.8.60 $zTIME.jpg
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg

echo -e "

Si jamais pour info:

crontab -e
*/1 * * * * /home/ubuntu/dev/esp32-cam-msl/capture_all.sh  (capture une image toutes les 1 minutes)

"

