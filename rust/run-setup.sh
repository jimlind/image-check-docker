#!/bin/sh
name="image-check-docker-rust"

docker build -t $name .
docker run -t -v $(pwd)/src:/src -w /src/code/ $name sh -c "cargo build --release && cp /src/code/target/release/run /src/exe/run"