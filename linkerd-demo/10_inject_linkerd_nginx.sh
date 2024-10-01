#!/bin/bash

# we do this automatically in the Rancher namespaces projects (where we also set resources limits for namespaces)
# !! In the LPC cluster it is a label, not an annotation: l12m-linkerd=enabled
kubectl annotate namespace test \
    --overwrite \
    "linkerd.io/inject"="enabled"

# we do this automatically in the common helm chart
kubectl get deployments.apps nginx -o yaml | linkerd inject - | kubectl apply -f -

watch kubectl get pods
