# SSH

Port 22


`libssh` is a multiplatform C library implementing the SSHv2 protocol on client and server side.

`libssh` V0.6.0-0.8.0 is vulnerable to an authentication bypass vulnerability in the libssh server code that can be exploited to execute commands on the target server.














## Permissions
`chmod 0400 [SSH KEY]`
Modify the permissions of the key file so that only the user/owner can read the file; if we don't, the ssh program will a throw an error stating that the access permissions are too open.
 










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








###Known Hosts:
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
	






