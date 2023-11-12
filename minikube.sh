#!/bin/bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start -p adjust-infra --extra-config=apiserver.service-node-port-range=1-65535
