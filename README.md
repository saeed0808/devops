## Dependency Installation on ec2-server 
1. Docker
2. Minikube: https://minikube.sigs.k8s.io/docs/start/
3. k8s:  Kubectl installation: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
4. helm: https://helm.sh/docs/intro/install/
5. argocd CLI
6. argocd infra
7. Github repo

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

Assignment answer
# Modules
1. Pipeline design
2. Deploy
3. Improvements
# Pipeline design
    - The deployment can either use Kubernetes yml file or helm chart
    - Namespace: Development, Staging and Prod 
    - Loadbalancer in front of the application
    - Two pods were stated in the deployment file for high availability
# Module 2 - Deploy
Part 1 - Containerize
       - Create a Dockerfile build tag and push to docker hub
       - Optimize layers to reduce image size.
       - Remove unnecessary build dependencies and files.
        - Best Practices: Follow Docker best practices (e.g., using non-root user, defining health checks).
        
Part 2 - Manifests
I have created to helm charts in repo
                 - http-server-chart
                 - my-app
That over HA, LB, Zero downtime: Readiness and Liveness Probes
High Availability and Load Balancing:

# Module 3 - Improvements
For enhancing security, availability, reliability, and observability:

1. Security Improvements:
      - Implement network policies for inter-service communication.
      - Regularly audit and update to comply with security best practices.
2. Availability and Reliability: 
       - Set up auto-scaling based on metrics.
       - Implement robust backup and disaster recovery plans.
3. Observability:
        - Enhance logging and monitoring.
        - Integrate with centralized logging solutions like ELK Stack.
4. Performance Optimization:
        - Continuously profile and optimize application performance.
5. Documentation and Training:
   - Maintain comprehensive documentation. 
   - Regular training sessions for the team on new tools and practices.
    - Feedback Loop:
Establish a feedback loop from monitoring tools to continuously improve the application and infrastructure.
This approach addresses the complexity of your mixed environment and lays out a clear path for deployment and continuous improvement, ensuring that your application meets high standards of security, availability, reliability, and observability.

# OverAll
I have successfully completed the take-home challenge, 
I have created Once you update anything in the repo automatically pipeline will automatically trigger. for building docker and deployment app with helm on minikube 
This challenge represents a significant achievement in managing the end-to-end process of developing, deploying, and continuously improving a modern software application."

"Please inform me if I overlooked anything in this regard. I am eager to learn and put it into practice. Thank you." 😀
![image](https://github.com/saeed0808/devops/assets/46480999/82ada74e-9fc6-4bd8-a85d-7fbcb0a30bba)

