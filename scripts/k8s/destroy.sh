#!/bin/bash

# Destroy Redis
kubectl delete -f kubernetes_deployment/redis.yml -n demo-ops

# Destroy App
kubectl delete -f kubernetes_deployment/app.yml -n demo-ops

# Destroy Nginx
kubectl delete -f kubernetes_deployment/nginx.yml -n demo-ops