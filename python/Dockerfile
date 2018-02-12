# Use a minimal docker image
FROM alpine:3.7

# Install Python
RUN apk update && apk add python py-pip build-base python-dev zlib-dev jpeg-dev
RUN pip install Pillow

# Copy the local src directory to Docker
COPY ./src /src