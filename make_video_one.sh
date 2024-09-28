#!/bin/bash
# Petit script pour la réalisation d'un petit film à base d'images pour les images de la caméra
# zf231209.1734, zf240928.1705
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



# Créer un dossier temporaire
tmp_dir=$(mktemp -d)

# Générer la liste des fichiers avec leur chemin d'accès complet
find "$1" -type f -name "*.jpg" -printf "file '%p'\n" | sort -V > "$tmp_dir/images.txt"


# Exécuter la commande ffmpeg pour générer la vidéo
ffmpeg_command="ffmpeg"
ffmpeg_command+=" -f concat"
ffmpeg_command+=" -safe 0"
ffmpeg_command+=" -i '$tmp_dir/images.txt'"
ffmpeg_command+=" -c:v libx264"
ffmpeg_command+=" -b:v 1000k"
ffmpeg_command+=" -pix_fmt yuv420p"
ffmpeg_command+=" '$2/0_video.mp4'"

echo "Commande ffmpeg :"
echo $ffmpeg_command
eval $ffmpeg_command


# Nettoyer les fichiers temporaires
rm -rf "$tmp_dir"

echo "Vidéo générée : $2/0_video.mp4"


