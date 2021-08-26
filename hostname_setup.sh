#!/bin/bash

ipaddr=$(kubectl get ingress \
--namespace=default \
| grep wp-ingress \
| awk '{print $4}'
)

sudo sed -i '1 i\'$ipaddr'\tk8s.example.com' /etc/hosts