#!/bin/bash

this="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $this/ig
if [ ! -f "$this/ig/input-cache/publisher.jar" ]; then
     $this/ig/_updatePublisher.sh -y
fi

sushi .
./_genonce.sh $1
