# Add the eks-charts Helm chart repository. AWS maintains this repository on GitHub.
helm repo add eks https://aws.github.io/eks-charts

# Update your local repo to make sure that you have the most recent charts.
helm repo update eks

# Install the AWS Load Balancer Controller.
# Replace my-cluster with the name of your cluster. In the following command, aws-load-balancer-controller is the Kubernetes service account that you created in a previous step.
# For more information about configuring the helm chart, see values.yaml on GitHub.
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=2526-dev-alpha \
  --set serviceAccount.create=true \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=vpc-0747bfb553e0f0ea1
# If you're deploying the controller to Amazon EC2 nodes that have restricted access to the Amazon EC2 instance metadata service (IMDS), or if you're deploying to Fargate, then add the following flags to the helm command that follows:
