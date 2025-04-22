# pre-requisites
- an aws account
- access keys
- credentials profile
- eks cluster
- aws cli
- kubectl

# Steps:
- add profile and access keys to your .aws/credentials.
- change kubenetes context
```bash
aws eks update-kubeconfig --name=<cluster_name> --region <region_name> --profile="<credentials_profile_name>"
```
-  list all pods in cluster
```bash
 kubectl get pod -A
```
- take note of a "argocd-server-xxxxxx-xxxxx" service.<br>
  <img width="153" alt="image" src="https://github.com/user-attachments/assets/2dc529f2-b19f-4e00-9d9d-f6d64c88395f" />

- port forward argo-cd service to localhost:8080
``` bash
 kubectl port-forward -n argocd pod/argocd-server-xxxx-xxxx 8080:8080
```
- Navigate to http://localhost:8080/
- Username: admin, password: {to obtain password, run the following bash}
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d
```
