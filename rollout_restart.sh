#!/bin/bash

#kubectl rollout restart deployment/istiod -n istio-system

kubectl rollout restart deployment/echo-client -n test
kubectl rollout restart deployment/echo-server -n test

