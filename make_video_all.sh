#!/bin/bash
# Petit script pour la réalisation d'un petit film à base d'images pour tous les espaces du MsL
# zf231116.1859, zf240928.1701
#
# Sources: https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/

zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=/mnt/data
zIMAGES_FOLDER=$zDATA_FOLDER/images
zACTUAL_FOLDER=$zDATA_FOLDER/actual
zVIDEOS_FOLDER=$zDATA_FOLDER/videos

zYEAR=`date +%Y`
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H%M%S`

zTARGET_IMAGES=$zIMAGES_FOLDER/$zYEAR/$zMONTH/$zDAY
zTARGET_VIDEOS=$zVIDEOS_FOLDER/$zYEAR/$zMONTH/$zDAY

echo -e $zTARGET_IMAGES
echo -e $zTARGET_VIDEOS



zESPACE="bois"
mkdir -p $zTARGET_VIDEOS/$zESPACE
rm $zTARGET_VIDEOS/$zESPACE/0_video.mp4
$zAPP_FOLDER/make_video_one.sh $zTARGET_IMAGES/$zESPACE $zTARGET_VIDEOS/$zESPACE
cp $zTARGET_VIDEOS/$zESPACE/0_video.mp4 $zACTUAL_FOLDER/$zESPACE.mp4

zESPACE="metal"
mkdir -p $zTARGET_VIDEOS/$zESPACE
rm $zTARGET_VIDEOS/$zESPACE/0_video.mp4
$zAPP_FOLDER/make_video_one.sh $zTARGET_IMAGES/$zESPACE $zTARGET_VIDEOS/$zESPACE
cp $zTARGET_VIDEOS/$zESPACE/0_video.mp4 $zACTUAL_FOLDER/$zESPACE.mp4

zESPACE="laser"
mkdir -p $zTARGET_VIDEOS/$zESPACE
rm $zTARGET_VIDEOS/$zESPACE/0_video.mp4
$zAPP_FOLDER/make_video_one.sh $zTARGET_IMAGES/$zESPACE $zTARGET_VIDEOS/$zESPACE
cp $zTARGET_VIDEOS/$zESPACE/0_video.mp4 $zACTUAL_FOLDER/$zESPACE.mp4

zESPACE="social"
mkdir -p $zTARGET_VIDEOS/$zESPACE
rm $zTARGET_VIDEOS/$zESPACE/0_video.mp4
$zAPP_FOLDER/make_video_one.sh $zTARGET_IMAGES/$zESPACE $zTARGET_VIDEOS/$zESPACE
cp $zTARGET_VIDEOS/$zESPACE/0_video.mp4 $zACTUAL_FOLDER/$zESPACE.mp4

zESPACE="mosaic"
mkdir -p $zTARGET_VIDEOS/$zESPACE
rm $zTARGET_VIDEOS/$zESPACE/0_video.mp4
$zAPP_FOLDER/make_video_one.sh $zTARGET_IMAGES/$zESPACE $zTARGET_VIDEOS/$zESPACE
cp $zTARGET_VIDEOS/$zESPACE/0_video.mp4 $zACTUAL_FOLDER/$zESPACE.mp4



echo -e "

Si jamais pour info:

crontab -e
*/5 * * * * /home/ubuntu/dev/esp32-cam-msl/make_video_all.sh  (réalise une vidéo toutes les 5 minutes)

"
