# wp-mariadb-k8s-setup
```
kubectl apply -f mysql-user-secret.yaml && \
kubectl apply -f mysql-host-config.yaml
```


```

kubectl label nodes minikube type=db && \
kubectl apply -f mysql-deployment.yaml && \
kubectl apply -f mysql-svc.yaml && \
kubectl apply -f wp-deployment.yaml && \
kubectl apply -f wp-np-svc.yaml && \
kubectl apply -f wp-svc.yaml && \
kubectl appy -f ingress.yaml
```

```
ipaddr=$(kubectl get ingress --namespace=default | grep wp-ingress | awk '{print $4}') && \
sudo sed -i '1 i\'$ipaddr'\tk8s.example.com' /etc/hosts
```