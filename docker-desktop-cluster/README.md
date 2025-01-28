<!-- Run the following command to create the cluster with the specified configuration -->
kind create cluster --config kind-cluster-config.yaml

<!-- Once the cluster is created, you can switch to the new context and verify the nodes: -->
kubectl config use-context kind-clovis-cluster
kubectl get nodes