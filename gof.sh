#!/bin/bash

OUT_DATA_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
INPUT_DATA_PATH="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

docker run --rm -it -v $OUT_DATA_PATH:/workdir -v $INPUT_DATA_PATH:/data  docker.kodality.com/fsh-builder /bin/bash -c "gofsh data -o /workdir/out-fsh"
