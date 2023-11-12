## Dependency Installation 
1. Docker
2. Minikube: https://minikube.sigs.k8s.io/docs/start/
3. k8s:  Kubectl installation: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
4. helm: https://helm.sh/docs/intro/install/
5. argocd CLI
6. argocd infra
   
# script way install
      - chmod docker.sh; ./docker.sh
      - chmod +x minikube.sh; ./minikube.sh
      - chmod +x k8s.sh; ./k8s.sh
      - chmod +x helm.sh; ./helm.sh
      - chmod +x argocdcli.sh; ./argocdcli.sh
   
       - kubectl create namespace argocd
       - kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.9.0-rc2/manifests/install.yaml
       - kubectl config set-context --current --namespace=argocd
       - kubectl get pods
       - kubectl exec -it argocd-server-******** /bin/bash
       - argocd admin initial-password
       - argocd login localhost:8080 --insecure


# Push on dockerhub with token
            - echo $PAT
            - export PAT=your_personal_access_token
            - echo $PAT | docker login --username saeed9124 --password-stdin
            - docker tag ruby-app docker.io/saeed9124/ruby-app:tag
            - docker push docker.io/saeed9124/ruby-app:tag

# K8s commands
       - kubectl create namespace prod
       - kubectl config set-context --current --namespace=prod
## Production Layer
       - kubectl -n prod get deployment
       - kubectl -n prod get pods
       - kubectl -n prod get svc #To get url of the load balancer 

       - minikube -p adjust-infra service loadbalancer-service -n prod
# varify deployment on minikube if public ip is not allocated one way to check
![image](https://github.com/saeed0808/devops/assets/46480999/82ada74e-9fc6-4bd8-a85d-7fbcb0a30bba)

