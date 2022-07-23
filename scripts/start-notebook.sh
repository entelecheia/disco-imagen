#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

jupyter notebook \
    --no-browser -NotebookApp.token=$JUPYTER_TOKEN \
    --notebook-dir=$EKORPKIT_PROJECT_DIR \
    --port=$JUPYTER_PORT --ip=0.0.0.0 \
    --allow-root
