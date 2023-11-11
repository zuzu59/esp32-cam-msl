# esp32-cam-msl
Petit système de caméras surveillance low cost à base de mini caméras ESP32-CAM

zf231111.1712

## Buts
Construire un système de surveillance low cost à base de mini caméras ESP32-CAM !

On peut très facilement écrire avec l'Arduino IDE un firmware sur mesure pour ces mini caméras qui permettent juste de prendre une photos JPG avec un petit serveur WEB intégré.

Une moulinette va interroger les mini caméras de surveillance pour prendre une photo toutes les minutes. A la fin de la journée une petite vidéo de 3mn est faite avec ces photos.


## Prérequis
* Avoir une machine Linux
* Avoir des mini caméras ESP32-CAM
* Avoir Arduino IDE pour flasher le firmware


## Utilisation
Pour les tests actuellement, faire tourner le script:
```
test1.sh
```
dans une console ssh. Ce script va prendre une photos tous les x secondes



## Sources
https://www.rickmakes.com/create-timelapse-from-ip-camera-using-curl-wget-and-ffmpeg/


<br>
<br>
<br>
<br>
<br>
<br>


les reste du Readme est en cours de rédaction ! zf231111.1705

<br>
<br>
<br>
<br>
<br>
<br>




Faire simplement:
  ```
  ./start.sh
  ```

Après on peut simplement ouvrir avec son browser:
http://localhost:4567


