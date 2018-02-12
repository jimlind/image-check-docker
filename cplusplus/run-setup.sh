#!/bin/sh
name="image-check-docker-cplusplus"

docker build -t $name .
docker run -t -v $(pwd)/src:/src -w /src $name sh -c "g++ run.cpp -w -lSDL2 -lSDL2_image -o run"