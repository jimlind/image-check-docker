#!/bin/sh
name="image-check-docker-python"

docker run -t -w /src $name python run.py