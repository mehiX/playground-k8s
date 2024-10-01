#!/bin/bash

NGINX_IP=$(kubectl get pod \
	--selector app=nginx \
	--field-selector status.phase=Running \
	-o jsonpath="{.items[0].status.podIP}")

# generate some traffic
kubectl exec -ti \
	$(kubectl get po --selector app=curl --field-selector status.phase=Running -o name) \
	-c curl -- curl http://${NGINX_IP} -v --connect-timeout 5

echo 

# the request should be succesful and the nginx logs should show it was actually ngnix serving it
kubectl logs $(kubectl get po --selector app=nginx -o name) nginx | grep "GET /"