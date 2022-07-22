#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

NV_VISIBLE_DEVICES=${1:-"all"}
CMD=${2:-/bin/bash}

docker run -itd --rm \
  --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=$NV_VISIBLE_DEVICES \
  --network=host \
  --ipc=host \
  --shm-size=$DOCKER_SHM_SIZE \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  -e WANDB_API_KEY=$WANDB_API_KEY \
  -v $WORKSPACE_HOST:$WORKSPACE_DOCKER \
  --name $DOCKER_CONTAINER_NAME \
  $DISCO_IMAGEN_DOCKER $CMD
