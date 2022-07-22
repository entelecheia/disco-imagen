#!/bin/bash

mkdir -p ~/workspace/projects
cd ~/workspace/projects
git clone https://github.com/entelecheia/disco-imagen.git
cd ~/workspace/projects/disco-imagen
bash ./scripts/docker/build.sh
bash ./scripts/docker/jupyter.sh
