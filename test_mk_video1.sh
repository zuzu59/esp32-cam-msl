#!/bin/bash
#Petit script pour tester la réalisation d'un petit film à base d'images
#zf231111.1713


ffmpeg -framerate 30 -pattern_type glob -i '*.jpg' -vf crop=in_w:in_w*9/16,scale=1920:1080 -c:v libx264 -b:v 10000k -r 30 -pix_fmt yuv420p out.mp4

