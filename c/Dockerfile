# Use a minimal docker image
FROM alpine:3.7

# Install C Compiler
RUN apk add --update gcc musl-dev sdl2-dev sdl2_image-dev jpeg-dev

# Copy the local src directory to Docker
COPY ./src /src