#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

docker run -itd --rm \
  --runtime=nvidia \
  --network=$DOCKER_NETWORK \
  --ipc=$DOCKER_IPC \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --env-file .env \
  --volume $WORKSPACE_HOST:$EKORPKIT_WORKSPACE_ROOT \
  --name $DOCKER_CONTAINER_NAME \
  $DISCO_IMAGEN_DOCKER
