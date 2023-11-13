#!/bin/bash
# Petit script pour tester la réalisation d'un petit film à base d'images pour tous les espaces du MsL
# zf231113.1925
#
# Sources: https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/


zIMAGES_FOLDER="./images"
zVIDEOS_FOLDER="./videos"

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
#ffmpeg -framerate 8 -pattern_type glob -i "$zTarget/$zESPACE/*.jpg" -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v h264_videotoolbox -b:v 10000k -r 30 -pix_fmt yuv420p $zTarget/$zESPACE/0_video.mp4
#ffmpeg -framerate 8 -pattern_type glob -i "$zTARGET_IMAGES/$zESPACE/*.jpg" -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p $zTARGET_VIDEOS/$zESPACE/0_video.mp4
ffmpeg -framerate 8 -pattern_type glob -i "$zTARGET_IMAGES/$zESPACE/*.jpg" -vf crop=in_w:in_w*3/4,scale=1600:1200 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p $zTARGET_VIDEOS/$zESPACE/0_video.mp4


