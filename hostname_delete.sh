#!/bin/bash

ipaddr=$(cat /etc/hosts | head -n 1 | awk '{print $1}')

if [ "$ipaddr" != "127.0.0.1" ]; then
    sudo sed -i '1d' /etc/hosts
else 
    echo "There is no ingress controller ip adress on hosts."
fi