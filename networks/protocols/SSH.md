# SSH

Port 22


`libssh` is a multiplatform C library implementing the SSHv2 protocol on client and server side.

`libssh` V0.6.0-0.8.0 is vulnerable to an authentication bypass vulnerability in the libssh server code that can be exploited to execute commands on the target server.




## Permissions
chmod 0400 [SSH KEY]



## Config files

Look for stuff in config files

`sudo cat /etc/ssh/sshd_config | grep -i passwordauthentication`



/etc/ssh/sshd_config
	AllowUsers [USERNAME]
	





## Commands
```
# Generate SSH pair
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Show Fingerprint of a Key
ssh-keygen -l -f /path/to/key

# Add a Host Key to Known Hosts Manually
ssh-keyscan -H hostname >> ~/.ssh/known_hosts


```

