# SSH (Securie Shell Protocol)


## credential-based authentication
Username and password

##  key-based SSH authentication
An attacker has gained a foothold in a server that is running SSH, and they want to ensure they have persistence and can connect back to it if their reverse shell dies. SSH is configured using key-based authentication, instead of usernames and passwords. What file needs to be modified to allow them to connect to SSH from a remote host?: `authorized_keys`, the remote host that is attempting to connect must have their private key in the authorized_keys file, allowing it to successfully connect.



permissions are too open
```
chmod 600 ~/.ssh/id_rsa
```



## disable the pseudo -tty allocation
use `-T `parameter:
```
ssh -T bandit18@bandit.labs.overthewire.org -p 2220
```



## remote execution of commands by adding the commands after the common SSH expression
```
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
```






## SCP / copy files
```
scp -P 2220 bandit17@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./localDir/
```







## SSH Tunneling / Port Forwarding

ssh -L [local_port]:[remote_host]:[remote_port] user@[IP]
ssh -L [local_port]:[remote_host]:[remote_port] user@[IP] -p [PORT]








