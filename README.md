# Connection Test in k8s & Istio Environment
- This repository is for building echo server & client and check the network packet with tcpdump
- Nov. 04, 2024: Add Runtime Ciphersuites Tracking program
# Scripts
### deploy_echo.sh
deploy echo-server and echo-client in `test` k8s namespace
- echo-server: python script which listening the stream from port 12345
    - bpf: runtime ciphersuites capture container
    - svc: set the abstract ip for echo-server
- echo-client: python script which writes to socket heading to `echo-server.test.svc`
### delete_deployment.sh
- remove all of the resources distributed by `deploy-echo.sh`
### grab_packet.sh
- get the packet capture
```POD_NAME=<pod-name> NAMESPACE=<namespace> ./grab_packet.sh```
### listen_ciphersuites.sh
- just catenate the `/sys/kernel/debug/tracing/trace_pipe` file
### rollout_restart.sh
- restart pods distributed by `deploy-echo.sh`