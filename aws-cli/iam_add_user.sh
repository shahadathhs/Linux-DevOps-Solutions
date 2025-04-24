aws identitystore list-users --identity-store-id <refer_iam_center_settings>  --region <eks_region> --profile <profile_name>
aws identitystore create-group-membership --identity-store-id <refer_iam_center_settings> --group-id <corresponding to the group you want to add the user in> --member-id UserId=<corresponding to the user you want to add> --region <eks_region> --profile <profile_name> 
