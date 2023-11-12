#!/bin/bash

# Download the latest kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate the binary (optional but recommended)
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum --check

# Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Alternatively, install kubectl in a user-specific bin directory
# chmod +x kubectl
# mkdir -p ~/.local/bin
# mv ./kubectl ~/.local/bin/kubectl

# Check the installed version of kubectl
kubectl version --client

# Display nodes in the current Kubernetes context
#kubectl get nodes

