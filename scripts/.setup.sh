#!/bin/bash

mkdir -p ~/workspace/projects
cd ~/workspace/projects
git clone https://github.com/entelecheia/disco-imagen.git
cd ~/workspace/projects/disco-imagen
source ./scripts/docker/build.sh
source ./scripts/docker/jupyter.sh
