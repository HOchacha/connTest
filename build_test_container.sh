#!/bin/bash
echo "=======build start======="

docker build -t hochacha/echo-server ./server
docker push hochacha/echo-server 

docker build -t hochacha/echo-client ./client
docker push hochacha/echo-client






