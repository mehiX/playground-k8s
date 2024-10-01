#!/bin/bash

kubectl create namespace test && kubectl config set-context --current --namespace test

kubectl create deployment nginx --image nginx --port 80
kubectl create deployment curl --image alpine/curl -- sleep infinity

watch kubectl get pods
