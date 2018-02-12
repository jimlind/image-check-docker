# Use a minimal docker image
FROM alpine:3.7

# Install Node.js
RUN apk add --update nodejs nodejs-npm
RUN npm install jimp

# Copy the local src directory to Docker
COPY ./src /src