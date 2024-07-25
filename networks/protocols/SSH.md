# SSH


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

