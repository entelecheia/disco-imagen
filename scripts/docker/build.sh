#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

docker build ./scripts/docker --rm -t $DISCO_IMAGEN_DOCKER
