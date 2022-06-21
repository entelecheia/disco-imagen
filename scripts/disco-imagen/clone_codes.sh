#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

DISCO_IMAGEN_PROJECT_DIR=${1:-$DISCO_IMAGEN_PROJECT_DIR}
if [[ "$DISCO_IMAGEN_PROJECT_DIR" == "" ]]; then
    DISCO_IMAGEN_PROJECT_DIR="/workspace/projects/disco-imagen"
fi

git clone https://github.com/alembics/disco-diffusion.git $DISCO_IMAGEN_PROJECT_DIR/disco-diffusion &&
    git clone https://github.com/openai/CLIP $DISCO_IMAGEN_PROJECT_DIR/CLIP &&
    git clone https://github.com/assafshocher/ResizeRight.git $DISCO_IMAGEN_PROJECT_DIR/ResizeRight &&
    git clone https://github.com/MSFTserver/pytorch3d-lite.git $DISCO_IMAGEN_PROJECT_DIR/pytorch3d-lite &&
    git clone https://github.com/isl-org/MiDaS.git $DISCO_IMAGEN_PROJECT_DIR/MiDaS &&
    git clone https://github.com/crowsonkb/guided-diffusion.git $DISCO_IMAGEN_PROJECT_DIR/guided-diffusion &&
    git clone https://github.com/shariqfarooq123/AdaBins.git $DISCO_IMAGEN_PROJECT_DIR/AdaBins
