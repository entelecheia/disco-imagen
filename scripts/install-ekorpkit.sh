#!/bin/bash
set -x
set -o allexport
source .env
set +o allexport

EXTRA=${1:-$EKORPKIT_PIP_EXTRA}

pip install -U ekorpkit$EXTRA
