# requirements
give user perms to view pod logs, execute commands in pod and also look into config maps and secrets.

# current environment
you have
1. aws console
2. a admin account
3. user
4. iam identity centre is linked to a external provider
5. sso

# Steps breakdown
> create a group and add user
1. go to aws account>iam identity centre>settings.
2. note down identity-store-id.
3. go to aws sso portal, take access key info
4. paste access key info into your cli 's ".aws/credentias"
5. make sure aws and kubectl cli is installed.
6. change kubectl context to your intended profile.
   ```bash
   aws eks update-kubeconfig --name=<cluster-name> --region <> --profile="<>"  # change  kubectl context to your profile and eks instance
   ```
7. create a group
   ```bash
   aws identitystore list-groups --identity-store-id d-99677357e3 --profile accelerator --region eu-central-1  # list all groups
   # create group
   aws identitystore create-group \
    --identity-store-id <> \
    --display-name "<>" \
    --description "<>" \
    --region <> \
    --profile <>
   ```
   note down group id
8. add user to the group:
   ```bash
   aws identitystore list-users   --identity-store-id <>   --region <>   --profile <>    # list all users in the account
   ```
   note down the user-id of your user
   ```bash
    aws identitystore create-group-membership --identity-store-id <> --group-id <> --member-id UserId=<> --region <> --profile <>  # link user to the group
   ```
9. create a permission set:
   navigate to iam identity centre> permission sets
   ![image](https://github.com/user-attachments/assets/fc6eaf26-ee13-4e36-8971-0f5cce4e88d8)
   click "create new permission set" > Custom Permission set > inline permission set
   ```json
   {
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "AllowEKS",
			"Effect": "Allow",
			"Action": [
				"eks:*"
			],
			"Resource": "*"
		}
	]
   }
   ```
   <img width="661" alt="image" src="https://github.com/user-attachments/assets/2a0f313f-4a9a-4de5-9349-0be833908b16" />
10. review and save
11. Next navigate to IAM Identity center > AWS Accounts > select your console account in the organisation main tab > choose the group > select assign users and groups.
12. Navigate to sso console, you will notice two permission sets under your aws account.
13. Go to main adminstrator access, and navigate to IAM>Roles>search for your permission set(it will be set to a default format)>click it.
14. Copy your arn.
15. go to the terminal.
16. create a .yaml
   ```yaml
   apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: eks-dev-readaccess
  namespace: <desired-namespace>
rules:
  - apiGroups: [""]
    resources: ["pods", "pods/log", "pods/exec", "configmaps", "secrets"]
    verbs: ["get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: eks-dev-readaccess-binding
  namespace: <desired-namespace>
subjects:
  - kind: Group
    name: <desired-group-name>
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: eks-dev-readaccess
  apiGroup: rbac.authorization.k8s.io
```
apply the yaml
```bash
kubectl apply -f <>.yaml
```
18. Navigate to eks>select your cluster>go to access tab>create new access entry
19. Under IAM Principal ARN - <Paste the arn>
Type - Standard
Open Optional > group Name > <place the name of the group specified in the .yaml>
20. Click next, open Access policies > Policy name: AmazonEKSAdminPolicy > Access scope: namespace - <namespace-you-would-like-the-user-to-access-only>
21. Click apply.
22. Now your perms have been applied successfully.

# Validation
1. to check pod logs
```bash
kubectl get pods -n <desired-namespace> # to view all pods
kubectl logs <pod-name> -n <desired-namespace> # to view specific pod logs
```
2. to verify if user can execute cmd in pod
```bash
kubectl exec -it <pod-name> -n <desired-namespace> -- /bin/bash # should open terminal instance within pod
```
3. to check map config and secrets
```bash
kubectl get secrets -n dev
kubectl get configmaps -n dev
```

   
   
   
   
