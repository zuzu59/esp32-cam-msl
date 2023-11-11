#!/bin/bash
#Petit script pour tester la prise d'images d'une mini caméra esp32-cam
#zf231111.1654


while :; do wget -O "./images/cam_67_$(date +"%Y%m%d.%H%M%S").jpg" http://192.168.0.67/1600x1200.jpg; sleep 3; done

