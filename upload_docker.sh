#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
DOCKER_IMAGE_PATH=kde6260/housing-prices:latest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKER_IMAGE_PATH"
docker tag housing-prices $DOCKER_IMAGE_PATH
docker login

# Step 3:
# Push image to a docker repository
docker push $DOCKER_IMAGE_PATH
