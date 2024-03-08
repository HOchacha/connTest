#!/bin/bash
echo "=======build start======="

docker build -t hochacha/echo-server ./server
docker push hochacha/echo-server 

docker build -t hochacha/echo-client ./server
docker push hochacha/echo-client



kubectl apply -f server/deployment.yaml
kubectl apply -f echo-server-service.yaml
kubectl apply -f client/deployment.yaml



