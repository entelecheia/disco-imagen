#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport


ln -s ${DISCO_IMAGEN_DATA_DIR}/pretrained pretrained
ln -s ${DISCO_IMAGEN_DATA_DIR}/models models
