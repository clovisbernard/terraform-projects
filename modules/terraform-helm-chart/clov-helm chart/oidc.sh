# Determine the OIDC issuer ID for your cluster.
# Retrieve your cluster's OIDC issuer ID and store it in a variable. Replace my-cluster with your own value.
cluster_name=2526-dev-alpha
oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
echo $oidc_id

# Determine whether an IAM OIDC provider with your cluster's issuer ID is already in your account.
aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4

# Create an IAM OIDC identity provider for your cluster with the following command.
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve