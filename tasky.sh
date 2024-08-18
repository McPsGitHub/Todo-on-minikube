#!/bin/bash

export REGISTRY="McPsGitHub"
export REPOSITORY="todo-on-minikube"
export IMAGE_TAG="latest"

# Clone the application repostry to the local machine
git clone https://github.com/mcpsgithub/todo-on-minikube.git

# Build webserver docker image locally 
docker build -t $REGISTRY/$REPOSITORY:$IMAGE_TAG .

# Run webserver docker container
# run: docker run $REGISTRY/${REPO_FULL_NAME,,}:$IMAGE_TAG

# name: Update MongoDB config and deploy MongoDB   
kubectl apply -f mongodb-secret.yaml
kubectl apply -f mongodb-config.yaml          
kubectl apply -f mongodb.yaml

# name: Deploy webapp
kubectl apply -f webapp.yaml