#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
DOCKER_IMAGE_PATH=kde6260/housing-prices:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment housing-prices --image=$DOCKER_IMAGE_PATH

# Step 3:
# List kubernetes pods
kubectl get pods | grep housing-prices
POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

# Step 4:
# Forward the container port to a host
kubectl port-forward $POD_NAME 8000:80
