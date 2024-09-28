#!/bin/bash
# Petit script qui ne fait que de prendre une image d'une mini caméra esp32-cam et lui ajoute un timestamp en haut à gauche
# zf231114.1053, zf240928.1632

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "
Syntax:

./capture_one.sh image_folder ip_camera image_name

"
    exit
fi

echo -e "
Dossier pour l'image: $1
IP de la caméra: $2
Nom de l'image: $3
"


mkdir -p $1
# Récupère l'image de la caméra
wget -O $1/$3 http://$2/1280x1024.jpg

# Récupère le nom de l'image complet
file_path=$1/$3

# Extraire le timestamp du nom du fichier
timestamp=$(basename "$file_path" | cut -d'.' -f1)
formatted_timestamp=$(echo "$timestamp" | sed -e 's/\(..\)\(..\)\(..\)/\1:\2:\3/')

# Afficher les valeurs des variables pour vérification
#echo "Timestamp: $timestamp"
#echo "Formatted Timestamp: $formatted_timestamp"

# Générer l'image avec le timestamp incrusté
convert "$file_path" -gravity NorthWest -pointsize 24 -fill white -annotate +10+10 "$formatted_timestamp" "$file_path"
