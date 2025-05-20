# helm
> Packet manager for Kubernetes

# Components of helm
1. adding repo
2. install helm charts

# charts
> bundle of application manifests or yaml to deploy an application

# Vital helm commands
## for applications with provided helm charts
1. helm add
 ```bash
helm repo add <helm_chart_repo_name(custom)> <link>
# helm repo add bitnami https://charts.bitnami.com/bitnami
 ``` 
2. helm install
  ```bash
  helm install <release-name> <chart-name>
  # helm install nginxv1 binami/nginx
  ```
3. To search for charts in a repo
  ```bash
  helm search repo <repo_name>| grep -i <application_name>
  # helm search repo binami | grep -i nginx
  ```
4. To view all helms
```bash
helm list
```
5. helm upgrade/uninstall
```bash
helm upgrade/uninstall <release_name>
```
## for applications without helm charts provided
1. helm create
```bash
helm create <release-name>
```
this creates:
- chart.yaml: contains metadata, version, owner
- templates (folder): deployment.yaml, configmap, service account info
- values.yaml: to customise the template
2. create helm package
  ```bash
  helm package <release-name>
  ```
3. ```bash
   helm repo index .
   ```

Note: while helm installing sometimes may require explicit values
eg: helm install ..... --set variable_name=value
to see these values,
```bash
helm show values <chart-name>
```
