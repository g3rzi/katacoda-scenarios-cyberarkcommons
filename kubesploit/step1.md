This is a Kubernetes environment with Master ("controlplane") and Worker ("node01").   
The cluster should start automatically, but if not, you can start it by running `launch.sh`{{execute}}.  

Make sure both of them are ready with `kubectl get nodes`{{execute}}.  
If they are not, wait a couple of seconds and try again.   


`Open`{{execute T3}} new terminal (wait for the shell to pop-up) and start a container with the following information: 
```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
EOF```{{execute T2}}  


Check that it was created and running with `kubectl get pods`{{execute}}.  