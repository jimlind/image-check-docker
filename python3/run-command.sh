#!/bin/sh
name="image-check-docker-python3"

docker run -t -w /src $name python3 run.py