# SSH


SSH was initially developed to give administrators the ability to log in to their servers remotely through an encrypted connection. Before SSH, tools such as `rsh`, `rlogin` and `Telnet` provided similar remote administration capabilities, but over an unencrypted connection.


Port 22


`libssh` is a multiplatform C library implementing the SSHv2 protocol on client and server side.

`libssh` V0.6.0-0.8.0 is vulnerable to an authentication bypass vulnerability in the libssh server code that can be exploited to execute commands on the target server.






- Credential-based authentication: Username and Password

- Key-Based SSH authentication
An attacker has gained a foothold in a server that is running SSH, and they want to ensure they have persistence and can connect back to it if their reverse shell dies. SSH is configured using key-based authentication, instead of usernames and passwords. What file needs to be modified to allow them to connect to SSH from a remote host?: `authorized_keys`, the remote host that is attempting to connect must have their private key in the authorized_keys file, allowing it to successfully connect.








## Permissions
`chmod 0400 [SSH KEY]`
Modify the permissions of the key file so that only the user/owner can read the file; if we don't, the ssh program will a throw an error stating that the access permissions are too open.
 

```
chmod 600
```








## Generate SSH pair
```
ssh-keygen
ssh-keygen -t rsa
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Show Fingerprint of a Key
ssh-keygen -l -f /path/to/key

# Add a Host Key to Known Hosts Manually
ssh-keyscan -H hostname >> ~/.ssh/known_hosts
```











## Config files



### Authorized keys:
```
~/.ssh/authorized_keys
```
This file is used to specify which public keys are allowed to access the account. When someone tries to log in via SSH, the server checks if the user's public key matches any of the keys listed in this file.


Example:
```
"comment here" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOMAXqYDrvKuG0L+G20mS7ARlXSBnLd8sxCXCB2V/CHDftnyxwQMqkc7B14GncT4dUzd1iRmrxczF6ED45Yl8lhRXwJxDOtXLYInwA/9KVgFU5ncDdooIgWe//5HW0yZDBCsKiw2IpoxfGskRMeUufiPW7x+pG/RL6wbf3YLila1cT1o/XTuESVX8DFWQEa5Lq21F7LDmoEGfUQFqf33bWA5Cy4KrUfWmiSZrlC0y2nk6qJVIDJHAmhReM2DRYjNyxKb/B5kNE7yj94kh9EmYWffAN/rlFk1JWk7gCjClp/fdpsTIANFFsyfZ0ADMpknYURWY4Urjlm7XZ+OTjx+Sn4gnQq8+/wPi4ypqKL403OMecFGhnsvI20Pefq+c44K+R52igJAEQA7z3Jv74lPUO5F9PVXyOg6N46e2j/3UCyfYKaJncfB0Zc55BU1nQKFS2SjjTvTAD7Lhg0F1q0HKbM4z12ph8OzzzMvLoOYwujt/etKXm9qMLOwMcgfA+R0k= elaine@tri-island
```

- Comment Section: This part is a comment. In SSH authorized keys files, comments can be placed at the beginning of a line before the key or at the end of the line after the key.
`"comment here"`

- Key Type: This indicates the type of key being used. In this case, it's an RSA key.
`ssh-rsa`

- Public Key: It's a base64-encoded string that represents the key in a format that SSH can use.
This part is what gets matched against the private key when someone tries to log in.
`AAAAB3NzaC1yc2EAAAADAQABAAABgQDOMAXqYDrvKuG0L...`

- Comment Section (Again): This is another comment, usually indicating the username or email address of the person who owns this key. In this case, it seems to belong to a user named "Elaine," possibly from a domain or organization named "tri-island."
`elaine@tri-island`





#### Add keys to SSH `authorized_keys` file

1. Generate a public-private key pair on your local machine using `ssh-keygen`
2. Copy the public key to the remote server using `ssh-copy-id`
```
ssh-copy-id user@remote_server
```

















### Private key:
```
$HOME/.ssh/id_rsa
```








### Known Hosts:
```
~/.ssh/known_hosts
```
This file is used to store the public keys of the SSH servers you have connected to. It's a way for the client to verify the identity of the server it is connecting to.

Example:
```
|1|zHw31fL+n3cjyMTCU3zxE/Ai+0w=|a3KWorIpXnNPZLgRG7PpbH3Cxos= ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIr1k5/j/3yvWf8rLays4s/EPgkqySLYjRHL6QAq2yN8
```

- Hashed hostname/IP address of the server.
`|1|zHw31fL+n3cjyMTCU3zxE/Ai+0w=|a3KWorIpXnNPZLgRG7PpbH3Cxos=`

- This is the key type, indicating that the server is using an Ed25519 key.
`ssh-ed25519`

- This is the server's public key in base64 format.
`AAAAC3NzaC1lZDI1NTE5AAAAIIr1k5/j/3yvWf8rLays4s/EPgkqySLYjRHL6QAq2yN8`














Look for stuff in config files

`sudo cat /etc/ssh/sshd_config | grep -i passwordauthentication`



/etc/ssh/sshd_config
	AllowUsers [USERNAME]
















### Server

#### Change port

/etc/ssh/sshd_config (deamon config)

And then:
```
systemctl restart sshd.service
# or
systemctl restart sshd
```




















## Commands


`~` is a escape character, only recognized after `Enter`. So to send a ssh session to 
background: `~ Ctrl+Z`


### disable the pseudo -tty allocation
use `-T `parameter:
```
ssh -T bandit18@bandit.labs.overthewire.org -p 2220
```


### remote execution of commands by adding the commands after the common SSH expression
```
ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
```






### SCP / copy files
version segura basada en RCP

```
scp -P 2220 bandit17@bandit.labs.overthewire.org:/home/bandit13/sshkey.private ./localDir/


scp -i /path/to/id_rsa [source] [user@host:destination]


```







## SSH Tunneling / Port Forwarding

ssh -L [local_port]:[remote_host]:[remote_port] user@[IP]
ssh -L [local_port]:[remote_host]:[remote_port] user@[IP] -p [PORT]






## Multiplexing
SSH multiplexing is a technique that allows multiple SSH sessions to share a single TCP connection to a remote server. This can significantly reduce the overhead of establishing new connections, making subsequent SSH operations faster and more efficient.


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




