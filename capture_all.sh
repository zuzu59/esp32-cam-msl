#!/bin/bash
#Petit script pour prendre une image de toutes les mini caméras esp32-cam
#zf231116.1835, zf240928.1722


zAPP_FOLDER=$(/usr/bin/dirname $0)
#zDATA_FOLDER=$zAPP_FOLDER/data
zDATA_FOLDER=/mnt/data
zIMAGES_FOLDER=$zDATA_FOLDER/images
zACTUAL_FOLDER=$zDATA_FOLDER/actual

zYEAR=`date +%Y` 
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H%M%S` 

zTARGET=$zIMAGES_FOLDER/$zYEAR/$zMONTH/$zDAY

echo -e $zTARGET



zESPACE=bois
$zAPP_FOLDER/capture_one.sh $zTARGET/$zESPACE esp-cam-msl4.local $zTIME.jpg
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg

zESPACE=metal
$zAPP_FOLDER/capture_one.sh $zTARGET/$zESPACE esp-cam-msl1.local $zTIME.jpg
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg

zESPACE=laser
$zAPP_FOLDER/capture_one.sh $zTARGET/$zESPACE esp-cam-msl2.local $zTIME.jpg
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg

zESPACE=social
$zAPP_FOLDER/capture_one.sh $zTARGET/$zESPACE esp-cam-msl3.local $zTIME.jpg
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg


zESPACE=mosaic
$zAPP_FOLDER/make_mosaic.sh $zTARGET $zTIME
cp $zTARGET/$zESPACE/$zTIME.jpg $zACTUAL_FOLDER/$zESPACE.jpg






echo -e "

Si jamais pour info:

crontab -e
*/1 * * * * /root/dev/esp32-cam-msl/capture_all.sh                      #(capture une image toutes les 1 minutes)
"

