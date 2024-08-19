#!/bin/bash

export REGISTRY="mcpsgithub"
export REPOSITORY="todo-on-minikube"
export IMAGE_TAG="latest"

# Clone the application repostry to the local machine
git clone https://github.com/mcpsgithub/todo-on-minikube.git

# Change to new sub directory
cd ./$REPOSITORY

# Build webserver docker image locally 
docker build -t $REGISTRY/$REPOSITORY:$IMAGE_TAG .

# Push webserver container to local docker repository
docker push $REGISTRY/$REPOSITORY:$IMAGE_TAG

# name: Update MongoDB config and deploy MongoDB   
kubectl apply -f mongodb-secret.yaml
kubectl apply -f mongodb-config.yaml          
kubectl apply -f mongodb.yaml

# name: Deploy webapp
kubectl apply -f webapp.yaml