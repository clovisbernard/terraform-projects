#!/bin/bash

# install repo
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm repo update
aws eks update-kubeconfig --name 2526-dev-alpha --region us-east-1
helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
# helm upgrade csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --values values.yaml -n kube-system
# install provider
kubectl apply -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml


eksctl delete iamserviceaccount \
    --name api-sa \
    --namespace default \
    --region us-east-1 \
    --cluster 2526-dev-alpha


eksctl create iamserviceaccount --name api-sa --region=us-east-1 --cluster 2526-dev-alpha --attach-policy-arn arn:aws:iam::410052665018:policy/csr-eks-access-secret-manager --approve --override-existing-serviceaccounts