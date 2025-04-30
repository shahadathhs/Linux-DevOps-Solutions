kubectl apply -f postgres-deployment.yaml -n <namespace> 
kubectl get pods -n <namespace> -l app=postgres
