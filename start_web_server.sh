#!/bin/bash

# Petit script pour démarrer un mini serveur WEB, attention cela n'utilise plus python mais lighttpd !
#
# ATTENTION: il faut modifier le port et le dossier racine dans le fichier $zAPP_FOLDER/lighttpd.conf !
#
#zf231211.1756, zf240731.1556, zf240929.1544
#
# Remarques:
# Pour que le directory browsing soit responsive sur un smartphone, il faut modifier le CSS du directory-browsing !
# C'est pourquoi il faut copier le fichier custom.css dans la racine du site
#
# Pour avoir un joli dashboard, il faut copier le fichier index.html dans la racine
# Mais attention, si le site WEB est en direct sur Internet, tout le monde pourra le voir.
# Il faut donc le protéger derrière ClourdFlared avec un mot de pass !
#
# Sources:
# https://redmine.lighttpd.net/projects/lighttpd/wiki/Mod_dirlisting#dir-listingexternal-css
#

zAPP_FOLDER=$(/usr/bin/dirname $0)
zDATA_FOLDER=/mnt/data


echo -e "
zAPP_FOLDER: $zAPP_FOLDER
zDATA_FOLDER: $zDATA_FOLDER
"

sudo pkill lighttpd

# permet de rendre non fonctionnel le directory browsing dans la racine
# afin de diminuer la surface d'attaque
#touch $zDATA_FOLDER/index.html

# permet d'avoir une page dashboard dans la racine du site
cp $zAPP_FOLDER/index.html $zDATA_FOLDER/index.html

# permet d'être responsive sur un smartphone
cp $zAPP_FOLDER/custom.css $zDATA_FOLDER/custom.css

sudo lighttpd -f $zAPP_FOLDER/lighttpd.conf


echo -e "

Si jamais pour info:

crontab -e
@reboot  sleep 30 && /root/dev/esp32-cam-st-luc/start_web_server.sh     # Démarre le serveur web au boot de la machine

Et pour l'arrêter, il faut faire: 

sudo pkill lighttpd

Pour le redémarer, il faut faire:

sudo pkill lighttpd ; ./start_web_server.sh


"
