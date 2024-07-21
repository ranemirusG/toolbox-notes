# SSH (Securie Shell Protocol)


`~` is a escape character, only recognized after `Enter`. So to send a ssh session to background: `~ Ctrl+Z`


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






## Multiplexing

- <https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Multiplexing>


```

# 1. Verify SSH Configuration

Ensure that your `~/.ssh/config` file is correctly set up. It should look something like this:

Host *
    ControlMaster auto
    ControlPath ~/.ssh/control-%r@%h:%p
    ControlPersist 10m





# 2. Check for Configuration Errors
Run the following command to check for configuration errors:bash

ssh -T -o ControlMaster=auto -o ControlPath=~/.ssh/control-%r@%h:%p -o ControlPersist=10m user@hostname




# 3. Inspect the ControlPath Socket
Verify that the control socket file is being created:bash

ls -l ~/.ssh/control-*



You should see a file corresponding to the control path specified. If it's missing, it could indicate that the master connection isn't being established properly.


# 4. Check for Existing Master Connection
You can check if there’s an existing master connection with:bash

ps aux | grep ssh




Look for processes related to SSH that might indicate the master connection


# 6. Start the Master Connection Explicitly

Instead of relying on ```ControlMaster auto```, try starting the master connection explicitly:bash

ssh -M -S ~/.ssh/control-%r@%h:%p user@hostname

Then, open a new session that uses this master connection:bash

ssh -S ~/.ssh/control-%r@%h:%p user@hostname



If changes don't seem to apply, restarting the SSH service on your local machine can sometimes help:bash

sudo systemctl restart ssh







```





## AUTOMATE LOGIN WITH SCRIPT

Example with dockerlabs.es "LittlePivot"
This will login as "manchi", switch to "seller" and then "root".


```bash
#!/usr/bin/expect -f

# Set variables
set remote_host "10.10.10.2"
set remote_user "manchi"
set manchi_password "lovely"
set seller_password "qwerty"
set cmd "/bin/bash"

# Start the SSH session
spawn ssh $remote_user@$remote_host

# Handle the SSH password prompt
expect "password:"
send "$manchi_password\r"

# Switch to the seller user
expect "$ "
send "su - seller\r"

# Handle the seller user password prompt
expect "Password:"
send "$seller_password\r"

# Set the environment variable and run the command
expect "$ "
send "export CMD=$cmd\r"
send "sudo php -r \"system('$cmd');\"\r"

# Expect the command to complete and print the result
expect "$ "
send "whoami\r"

# The session remains open for further commands
interact

```
