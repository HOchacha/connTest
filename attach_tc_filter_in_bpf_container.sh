#!/bin/bash

# 네임스페이스를 인자로 받습니다
if [ $# -ne 1 ]; then
    echo "Usage: $0 <namespace>"
    exit 1
fi

NAMESPACE=$1

# echo-server 파드 이름을 찾습니다
POD_NAME=$(kubectl get pods -n $NAMESPACE -l app=echo-server -o jsonpath='{.items[0].metadata.name}')

if [ -z "$POD_NAME" ]; then
    echo "Error: No echo-server pod found in namespace $NAMESPACE"
    exit 1
fi

echo "Found pod: $POD_NAME"

# bpf 컨테이너에서 스크립트를 실행합니다
kubectl exec -it -n $NAMESPACE $POD_NAME -c bpf -- ./root/attach_tc.sh