#!/bin/bash
# Petit script pour faire une mosaïque avec les images des caméras
# zf231116.1837, zf240926.1653

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "
Syntax:

./make_mosaic.sh images_folder time_name

"
    exit
fi

zCAM1=$1/metal/$2.jpg
zCAM2=$1/bois/$2.jpg
zCAM3=$1/laser/$2.jpg
zCAM4=$1/social/$2.jpg
zMOSAIC=$1/mosaic/$2.jpg

echo -e "
Dossier pour les images: $1
Heure de l'image: $2
Caméra 1: $zCAM1
Caméra 2: $zCAM2
Caméra 3: $zCAM3
Caméra 4: $zCAM4
Mosaïque: $zMOSAIC
"

mkdir -p $1/mosaic

montage $zCAM1 $zCAM2 $zCAM3 $zCAM4 -tile 2x2 -geometry +2+2 $zMOSAIC

