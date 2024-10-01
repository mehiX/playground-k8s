#!/bin/bash

kubectl get deployments.apps curl -o yaml | linkerd inject - | kubectl apply -f -

watch kubectl get pods

