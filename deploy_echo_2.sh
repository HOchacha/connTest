#!/bin/bash
kubectl apply -f ./server2/deployment.yaml -n test2
kubectl apply -f ./server2/echo-server-service.yaml -n test2
kubectl apply -f ./client2/deployment.yaml -n test2
