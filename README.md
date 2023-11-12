# Install docker using script for ubuntu
chmod +x docker.sh
./docker.sh
sudo usermod -aG docker $USER
newgrp docker


# Install minikube k8s cluster
Minikube installation : https://minikube.sigs.k8s.io/docs/start/
- curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
- sudo install minikube-linux-amd64 /usr/local/bin/minikube
- minikube start -p adjust-infra --extra-config=apiserver.service-node-port-range=1-65535

# Install kubernetes
Kubectl installation: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client
kubectl get nodes


# Docker build and push image
echo $PAT
export PAT=your_personal_access_token
echo $PAT | docker login --username saeed9124 --password-stdin

docker tag ruby-app docker.io/saeed9124/ruby-app:tag
docker push docker.io/saeed9124/ruby-app:tag

kubectl config set-context --current --namespace=prod
#Production Layer
kubectl -n prod get deployment
kubectl -n prod get pods
kubectl -n prod get svc #To get url of the load balancer 

minikube -p adjust-infra service loadbalancer-service -n prod

# Install helm
https://helm.sh/docs/intro/install/

- From Apt (Debian/Ubuntu)
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

helm install my-http-server http-server-chart
helm install my-http-server http-server-chart -n prod

# Deplyment
kubectl create namespace prod
kubectl config set-context --current --namespace=prod
