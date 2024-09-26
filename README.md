# esp32-cam-msl
Petit système de caméras surveillance low cost à base de mini caméras ESP32-CAM

zf231113.1342, zf240926.1705

## Buts
Construire un système de surveillance low cost à base de mini caméras ESP32-CAM !

On peut très facilement écrire avec l'Arduino IDE un firmware sur mesure pour ces mini caméras qui permettent juste de prendre une photos JPG avec un petit serveur WEB intégré.

Une moulinette va interroger les mini caméras de surveillance pour prendre une photo toutes les minutes. A la fin de la journée une petite vidéo de 3mn est faite pour le résumé de la journée de ces photos.


## Prérequis
* Avoir une machine Linux
* Avoir des mini caméras ESP32-CAM
* Avoir Arduino IDE pour flasher le firmware


## Installation
Il faut installer en autre ceci:

```
sudo update ; sudo apt install imagemagick lighttpd
```


## Utilisation
### Capture des images des caméras
Pour les tests de capture actuellement, dans une console ssh, faire tourner le script:
```
test_capture1.sh
```
Ce script va prendre une photos tous les x secondes de toutes les caméras


### Réalisation des vidéos de résumés journaliers
Pour les tests de réalisation de vidéo actuellement, dans une console ssh, faire tourner le script:
```
test_mk_video1.sh
```
Ce script va réaliser une vidéo de toutes les images capturées de toutes les caméras



## Firmware à flasher dans les mini caméras ESP32-CAM
Pour l'instant (zf231113.1207) il n'est pas encore documenté ici :-(

Mais ses sources sont inspirés de ceci:

https://github.com/yoursunny/esp32cam/tree/main/examples/WifiCam



## Sources
https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/


