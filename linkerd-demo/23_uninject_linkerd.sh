#!/bin/bash

kubectl annotate namespace test \
    --overwrite \
    linkerd.io/inject-

kubectl get deployments.apps nginx -o yaml | linkerd uninject - | kubectl apply -f -
kubectl get deployments.apps curl -o yaml | linkerd uninject - | kubectl apply -f -

kubectl rollout restart deployments nginx curl

watch kubectl get pods