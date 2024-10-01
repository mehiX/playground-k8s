#!/bin/bash

cat << EOF | kind create cluster --name test-linkerd --image kindest/node:v1.28.13 --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
