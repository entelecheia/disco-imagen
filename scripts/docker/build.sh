#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

docker build \
    --network=host --rm \
    --build-arg workspace_dir=$EKORPKIT_WORKSPACE_ROOT \
    --build-arg project_name=$EKORPKIT_PROJECT \
    --build-arg jupyter_port=$JUPYTER_PORT \
    --build-arg jupyter_token=$JUPYTER_TOKEN \
    ./scripts/docker -t $DOCKER_IMAGE_NAME \
