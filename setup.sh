#!/bin/bash

kubectl apply -f mysql-user-secret.yaml
kubectl apply -f mysql-host-config.yaml

kubectl label nodes $1 type=db
kubectl apply -f db-pv.yaml
kubectl apply -f db-pvc.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-svc.yaml
kubectl apply -f wp-deployment.yaml
kubectl apply -f wp-np-svc.yaml
kubectl apply -f wp-svc.yaml
kubectl apply -f ingress.yaml





# Sadece k8s.example.com ile gelmesi için
# * k8s.example.com a karşılık node un ip adresi /etc/hosts a eklendi
# * Ingress ile k8s.example.com dan gelen requestler ClusterIP wp-svc nin 8888 ine yönlendirildi.
# * Apache configi değiştirilip, sadece k8s.example.com ServerName i olan requestler kabul edildi.


ipaddr=$(kubectl get nodes -o wide | grep $1 | awk '{print $6}')
sudo sed -i '1 i\'$ipaddr'\tk8s.example.com' /etc/hosts


kubectl exec -it pod/wp-deployment-d8676558-f9xxk -- /bin/bash
apt-get update
apt-get install apt-file
apt-file update
apt-get install vim     # now finally this will work !!!

vim /etc/apache2/sites-enabled/000-default.conf
ServerName = k8s.example.com



