#/bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace

kubectl get pods -n monitoring
kubectl get svc -n monitoring

helm install prometheus prometheus-community/prometheus --namespace monitoring --create-namespace -f values.yaml

