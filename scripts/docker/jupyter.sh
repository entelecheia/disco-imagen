#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

if [ "$HOST_WORKSPACE_ROOT" == "" ]; then
  HOST_WORKSPACE_ROOT=${HOME}${EKORPKIT_WORKSPACE_ROOT}
  echo "HOST_WORKSPACE_ROOT is empty, using: $HOST_WORKSPACE_ROOT"
fi

docker run -itd --rm \
  --runtime=nvidia \
  --network=$DOCKER_NETWORK \
  --ipc=$DOCKER_IPC \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --env-file .env \
  --volume $HOST_WORKSPACE_ROOT:$EKORPKIT_WORKSPACE_ROOT \
  --name $DOCKER_CONTAINER_NAME \
  $DOCKER_IMAGE_NAME
