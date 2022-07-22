#!/bin/bash

mkdir -p ~/workspace/projects
cd ~/workspace/projects
git clone https://github.com/entelecheia/disco-imagen.git
cd ~/workspace/projects/disco-imagen
sudo bash ./scripts/docker/build.sh
sudo bash ./scripts/docker/jupyter.sh
