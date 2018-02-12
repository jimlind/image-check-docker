#!/bin/sh
name="image-check-docker-c"

docker build -t $name .
docker run -t -v $(pwd)/src:/src -w /src $name sh -c "gcc run.c -w -lSDL2 -lSDL2_image -o run"