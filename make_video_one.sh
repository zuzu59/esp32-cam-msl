#!/bin/bash
# Petit script pour la réalisation d'un petit film à base d'images pour les images de la caméra de St-Luc
# zf231209.1734, zf240925.0039
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



# Créer un dossier temporaire pour les images avec timestamps
tmp_dir=$(mktemp -d)

# Générer la liste des fichiers avec leur chemin d'accès complet
find "$1" -type f -name "*.jpg" -printf "%p\n" | sort -V > "$1/images.txt"

# Lire chaque ligne du fichier de liste de concaténation et générer les images avec timestamps
while IFS= read -r file_path; do
    # Extraire le timestamp du nom du fichier
    timestamp=$(basename "$file_path" | cut -d'.' -f1)
    formatted_timestamp=$(echo "$timestamp" | sed -e 's/\(..\)\(..\)\(..\)/\1:\2:\3/')

    # Afficher les valeurs des variables pour vérification
    echo "Timestamp: $timestamp"
    #echo "Formatted Timestamp: $formatted_timestamp"

    # Générer l'image avec le timestamp incrusté
    output_file="$tmp_dir/$(basename "$file_path")"
    convert "$file_path" -gravity NorthWest -pointsize 24 -fill white -annotate +10+10 "$formatted_timestamp" "$output_file"
done < "$1/images.txt"

# Générer la liste des fichiers temporaires avec leur chemin d'accès complet
find "$tmp_dir" -type f -name "*.jpg" -printf "file '%p'\n" | sort -V > "$tmp_dir/images_with_timestamps.txt"

# Exécuter la commande ffmpeg pour générer la vidéo
ffmpeg_command="ffmpeg"
ffmpeg_command+=" -f concat"
ffmpeg_command+=" -safe 0"
ffmpeg_command+=" -i '$tmp_dir/images_with_timestamps.txt'"
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


