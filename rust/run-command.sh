#!/bin/sh
name="image-check-docker-rust"

docker run -t -v $(pwd)/src:/src -w /src/exe $name ./run