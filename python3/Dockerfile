# Use a minimal docker image
FROM alpine:3.7

# Install Python
RUN apk update && apk add python3 python3-dev build-base zlib-dev jpeg-dev
RUN pip3 install Pillow

# Copy the local src directory to Docker
COPY ./src /src