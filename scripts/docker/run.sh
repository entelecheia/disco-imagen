#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

NV_VISIBLE_DEVICES=${1:-"all"}
CMD=${2:-/bin/bash}

docker run -it --rm \
  --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=$NV_VISIBLE_DEVICES \
  --network=host \
  --ipc=host \
  --shm-size=$DOCKER_SHM_SIZE \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  -e WANDB_API_KEY=$WANDB_API_KEY \
  -e EKORPKIT_CONFIG_DIR=$EKORPKIT_CONFIG_DIR \
  -e EKORPKIT_PROJECT=$EKORPKIT_PROJECT \
  -e EKORPKIT_WORKSPACE_ROOT=$EKORPKIT_WORKSPACE_ROOT \
  -v $WORKSPACE_HOST:$WORKSPACE_DOCKER \
  --name $DOCKER_CONTAINER_NAME \
  $DISCO_IMAGEN_DOCKER $CMD

  # -p $JUPYTER_HOST_PORT:$JUPYTER_PORT \
