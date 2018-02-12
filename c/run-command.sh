#!/bin/sh
name="image-check-docker-c"

docker run -t -v $(pwd)/src:/src -w /src $name ./run
