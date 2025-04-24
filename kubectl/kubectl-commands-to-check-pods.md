# list all pods in namespace dev
kubectl get pods -n dev
# to delete a pod in namespace
kubectl delete pod <pod_name> -n <name_Space>
# to check logs
kubectl logs po/<pod_name> -n <name_Space>
