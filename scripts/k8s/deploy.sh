#!/bin/bash

# Create Namespace demo-ops
if ! kubectl get ns | grep -q demo-ops; then
    echo "Creating Namespace demo-ops ..."
    kubectl create ns demo-ops
else
    echo "Namespace demo-ops already exists."
fi


# Deploy Redis
kubectl apply -f kubernetes_deployment/redis.yml -n demo-ops

# Deploy App
kubectl apply -f kubernetes_deployment/app.yml -n demo-ops

# Deploy Nginx
kubectl apply -f kubernetes_deployment/nginx.yml -n demo-ops