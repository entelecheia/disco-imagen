#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

DISCO_IMAGEN_DATA_DIR=${1:-$DISCO_IMAGEN_DATA_DIR}
if [[ "$DISCO_IMAGEN_DATA_DIR" == "" ]]; then
    DISCO_IMAGEN_DATA_DIR="/workspace/data/disco-imagen"
fi

mkdir -p /root/.cache/clip &&
    mkdir -p /root/.cache/torch/hub/checkpoints

cp -r $DISCO_IMAGEN_DATA_DIR/clip /root/.cache/clip
cp $DISCO_IMAGEN_DATA_DIR/model-lpips/vgg16-397923af.pth /root/.cache/torch/hub/checkpoints/vgg16-397923af.pth
