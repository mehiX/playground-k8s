#!/bin/bash

# make sure we only answer requests from meshed clients
kubectl annotate pod --selector 'app=nginx' \
    --overwrite \
    "config.linkerd.io/default-inbound-policy"="all-authenticated"

# redo the test by sending traffic, get 403 and show that the request never arrived at nginx
# kubectl logs $(kubectl get po --selector app=nginx -o name) nginx | grep "GET /"