#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

jupyter notebook \
    -NotebookApp.token=$JUPYTER_TOKEN \
    --notebook-dir=$EKORPKIT_PROJECT_DIR \
    --no-browser \
    --ip=0.0.0.0 \
    --port=$JUPYTER_PORT \
    --allow-root
