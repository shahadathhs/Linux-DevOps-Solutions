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
   
   
