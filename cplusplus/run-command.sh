#!/bin/sh
name="image-check-docker-cplusplus"

docker run -t -v $(pwd)/src:/src -w /src $name ./run