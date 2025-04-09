# setting up credentials in credentials file
- place your aws_access_key_id, aws_secret_access_key of owner account into `.aws/credentials`
```.txt
[<profile_name>]
aws_access_key_id=<value>
aws_secret_access_key=<value>
```
# setting up kubernetes cluster pod context
```bash
aws s3 ls --profile=<profile_name>
aws eks update-kubeconfig --name=<cluster_name> --region <cluster_region> --profile="<profile_name>"
```
