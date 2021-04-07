#!/bin/bash
#HOST_IP=`ip addr show ens3  | awk '$1 == "inet" { print $2 }' | cut -d/ -f1`
#sed 's/    Interface: "127.0.0.1"/    Interface: '"$HOST_IP"'/g' config.yaml
#HOST_IP=`kubectl get nodes -o jsonpath='{ $.items[?(@.metadata.name=="controlplane")].status.addresses[?(@.type=="InternalIP")].address }'` && sed 's/    Interface: "127.0.0.1"/    Interface: '"$HOST_IP"'/g' config.yaml`{{execute}}
#Run the file `./kubesploitAgent-Linux-x64_katacoda

HOST=`hostname`
if [ "$HOST" == "controlplane" ]; then
	  echo "This is the Host"
	  ./launch.sh
	  #kubectl run priv-container --image=alpine --overrides='{"spec": {"template": {"spec": {"containers": [{"name": "priv-container", "image": "alpine", "command": ["sh", "-c", "sleep 1000"], "securityContext": {"privileged": true} }]}}}}' -- sh -c 'sleep 1000'
fi





