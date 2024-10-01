#!/bin/bash

# brew install linkerd

# Install linkerd in the cluster
linkerd check --pre
linkerd install --crds | kubectl apply -f -
linkerd install | kubectl apply -f -
linkerd check

# optional but nice to have
linkerd viz install | k apply -f -
linkerd viz check