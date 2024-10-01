#!/bin/bash

# we do this automatically in the Rancher namespaces projects (where we also set resources limits for namespaces)
# https://git.lpc.logius.nl/logius/open/dgp/digipoort/infra/rancher-namespaces/pipeline/-/blob/main/jobs/namespaces-jobs.yml?ref_type=heads#L44
# !! In the LPC cluster it is a label, not an annotation: l12m-linkerd=enabled
kubectl annotate namespace test \
    --overwrite \
    "linkerd.io/inject"="enabled"

# we do this automatically in the common helm chart
# https://git.lpc.logius.nl/logius/open/dgp/digipoort/tools/helm-charts/-/blob/master/values.yaml?ref_type=heads#L134
kubectl get deployments.apps nginx -o yaml | linkerd inject - | kubectl apply -f -

watch kubectl get pods
