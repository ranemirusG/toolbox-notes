# SSH (Securie Shell Protocol)


permissions are too open
```
chmod 600 ~/.ssh/id_rsa
```

copy files
```
scp -P 2220 bandit17@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./localDir/
```


use `-T `parameter over ssh to disable the pseudo -tty allocation
```
ssh -T bandit18@bandit.labs.overthewire.org -p 2220
```



remote execution of commands by adding the commands after the common SSH expression
```
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
```



## SSH Tunneling / Port Forwarding

ssh -L [local_port]:[remote_host]:[remote_port] user@[IP]
ssh -L [local_port]:[remote_host]:[remote_port] user@[IP] -p [PORT]






