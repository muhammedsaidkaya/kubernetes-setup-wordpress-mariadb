#!/bin/bash

#add path
declare -a StringArray=( \
"mysql-user-secret.yaml" \
"mysql-host-config.yaml" \
"mysql-deployment.yaml" \
"mysql-svc.yaml" \
"wp-deployment.yaml" \
"wp-svc.yaml" \
"wp-np-svc.yaml" \
"ingress.yaml" \
)

for value in ${StringArray[@]};
do
    kubectl apply -f $value
done