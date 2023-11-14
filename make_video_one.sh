#!/bin/bash
# Petit script pour la réalisation d'un petit film à base d'images pour tous les espaces du MsL
# zf231114.1125
#
# Sources: https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "
Syntax:

./make_video_one.sh images_folder video_folder

"
    exit
fi

echo -e "
Dossier pour les images: $1
Dossier pour les vidéos: $2
"

ffmpeg -framerate 8 -pattern_type glob -i "$1/*.jpg" -vf crop=in_w:in_w*3/4,scale=1600:1200 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p $2/0_video.mp4


