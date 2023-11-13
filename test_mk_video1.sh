#!/bin/bash
# Petit script pour tester la réalisation d'un petit film à base d'images pour tous les espaces du MsL
# zf231113.1601
#
# Sources: https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/


zIMAGE_FOLDER="./images"
zYEAR=`date +%Y` 
zMONTH=`date +%m`
zDAY=`date +%d`
zTIME=`date +%H%M%S` 

zTarget=$zIMAGE_FOLDER/$zYEAR/$zMONTH/$zDAY

echo -e $zTarget

zESPACE="bois"
rm $zTarget/$zESPACE/0_video.mp4
#ffmpeg -framerate 8 -pattern_type glob -i "$zTarget/$zESPACE/*.jpg" -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v h264_videotoolbox -b:v 10000k -r 30 -pix_fmt yuv420p $zTarget/$zESPACE/0_video.mp4
ffmpeg -framerate 8 -pattern_type glob -i "$zTarget/$zESPACE/*.jpg" -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p $zTarget/$zESPACE/0_video.mp4

#zESPACE="metal"
#rm $zTarget/$zESPACE/0_video.mp4
#ffmpeg -framerate 8 -pattern_type glob -i "$zTarget/$zESPACE/*.jpg" -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v h264_videotoolbox -b:v 10000k -r 30 -pix_fmt yuv420p $zTarget/$zESPACE/0_video.mp4


exit


#ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p out.mp4
ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v h264_videotoolbox -b:v 10000k -r 30 -pix_fmt yuv420p out.mp4

