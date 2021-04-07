

#### Load the mount container breakout module and run it

Load the module from terminal 1 by going back to the `main`{{execute T1}} and then run `use module linux/go/mountContainerBreakout`{{execute T1}}.  
You can view all the information with `info`{{execute T1}} command.  
Notice that it will run on all the agents.  

Execute it with `run`{{execute T1}} and wait for the output.  


#### Breakout  

This module will search for the host device and mount it.  
Notice that it will work only on privileged containers or containers that can mount devices.  
Once it succeeded, it will mount the host to the `/mnt0` (it can als be `mnt1`, `mnt2`, and so on until it will find a folder that doesn't exist) folder.  


#### Verify the access to the host  
Make sure you are on the main menu using `main`{{execute T1}}.  
Load the bash module using `use module linux/x64/bash/exec/bash`{{execute T1}}.   
Set the `Command` to list the files under `mnt0` by running `set Command "ls -ll /mnt0"`{{execute T1}} and `run`{{execute T1}}.  
You will see a file named "/this_is_node01_host" which means that you can access the host.  
You can verify it by checking it in `node01` by running `ls -ll /`{{execute HOST2}}.  
Feel free to create other files inside `node01`'s host and check that you can see them.  

