#!/bin/bash

# monitor tcp traffic (add -x so that tshark shows packages data)
kubectl debug -i $(kubectl get po --selector app=curl --field-selector status.phase=Running -o name) \
	--target curl \
	--image cr.l5d.io/linkerd/debug:stable-2.14.10 -- tshark -i eth0 -f "tcp port 80" -d "tcp.port==80,ssl" -l

# can also use linkerd tap
# linkerd viz tap ns/test