#!/bin/bash


# Name the image for use in this project
DOCKERIMG="zeta/caravel"

cd dockerbuild

sudo docker build -t $DOCKERIMG .

cd ..



