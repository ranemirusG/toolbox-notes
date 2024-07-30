# SMB (Server Message Block Protocol) / Samba

The generic term for this service is CIFS (Common Internet File System)

Is a client-server communication protocol used for sharing access to files, peripherals (printers, etc), serial ports and other resources on a network.

Ports: 445, 137, 138, 139

SMB originally operated on NetBIOS over IEEE 802.2 - NetBIOS Frames or NBF - and over IPX/SPX, and later on NetBIOS over TCP/IP (NetBT), but Microsoft has since deprecated these protocols. On NetBT, the server component uses three TCP or UDP ports: 137 (NETBIOS Name Service), 138 (NETBIOS Datagram Service), and 139 (NETBIOS Session Service).


SAMBA is the Linux implementation of SMB, and allows Windows systems to access Linux shares and devices.

Clients connect to servers using TCP/IP (actually NetBIOS over TCP/IP as specified in RFC1001 and RFC1002), NetBEUI or IPX/SPX.

The SMB protocol has evolved over time, and its various versions are commonly referred to as dialects. <https://4sysops.com/archives/the-smb-protocol-all-you-need-to-know/>





`nmbd` NetBIOS Message Block Daemon: The nmbd server daemon understands and replies to NetBIOS name service requests such as those produced by SMB/CIFS in Windows-based systems.


`smbd` (Server Message Block Daemon) provides file sharing and printing services to Windows clients.



SMB is a protocol that can be used for many different services.
Services talk to one another through pipes.
Named Pipes are pipes that are known.
So if we can get into SMB, there is a chances that we can get into other services that are pipes, if we know the names of the pipes.












## Shares

An SMB-enabled storage on the network is called a share.
These can be accessed by any client that has the address of the server and the proper credentials. Like many other file access protocols, SMB requires some security layers to function appropriately within a network topology. If SMB allows clients to create, edit, retrieve, and remove files on a share, there is a clear need for an authentication mechanism.

At a user level, SMB clients are required to provide a username/password combination to see or interact with the contents of the SMB share.


### Common shares
- `C$`: Default administrative share for the C: drive.
- `ADMIN$`: Administrative share that provides access to the Windows directory.
- `IPC$`: Used for inter-process communication.


The `IPC$` share is also known as a null session connection. By using this session, Windows
lets anonymous users perform certain activities, such as enumerating the names of domain
accounts and network shares. <https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/inter-process-communication-share-null-session>




## Resources
- Samba (https://www.samba.org/)
- smbclient (https://www.samba.org/samba/docs/current/man-html/smbclient.1.html)
- rpcclient (https://www.samba.org/samba/docs/current/man-html/rpcclient.1.html)
- nmblookup (https://www.samba.org/samba/docs/current/man-html/nmblookup.1.html)
- Nmap Script: smb-os-discovery (https://nmap.org/nsedoc/scripts/smb-os-discovery.html)
- Metasploit Module: SMB Version Detection https://www.rapid7.com/db/modules/auxiliary/scanner/smb/smb_version










## SMB Commands

```
# Download file
get [FILE]

# Exit
exit

```




## Tools


### `net` Windows

```
net use \\192.168.1.100\sharename /user:username password
net use Z: \\[IP]\[SHARE] [PASSWORD] /user:[USERNAME]

# Remove / Unmount
net use * /delete

```


### `SMBClient`

```
smbclient -L $ip

smbclient -N -L \\\\{TARGET_IP}\\
# -N: No password
# -L : This option allows you to look at what services are available on a serve


smbclient \\\\$ip\\C$
smbclient \\\\$ip\\CustomShare
smbclient //[IP]/Public -N

# Access share 
smbclient \\\\[IP]\\sharename -U [USERNAME]

# Try in user share (with password)
smbclient //[IP]/jane -U jane
smbclient //[IP]/admin -U admin




```











### nmap
`nmap --script smb-enum-shares,smb-enum-users -p 445 192.168.1.100`


```

# What is the workgroup name of samba server?
nmap -sV -p 445 [TARGET]

# Find the exact version of samba server by using appropriate nmap script
nmap --script smb-os-discovery.nse -p 445 [TARGET]

# Find the NetBIOS computer name of samba server
nmap --script smb-os-discovery.nse -p 445 [TARGET]
nmblookup -A [TARGET]

# determine whether anonymous connection (null session) is allowed
# If the server allows anonymous connections, you will see a list of available shares.
# If anonymous connections are not allowed, you will see an error message indicating that the connection failed.

smbclient -L [TARGET] -N
rpcclient -U "" [TARGET] -N
rpcclient -U "" [TARGET]

```
rpcclient > enumdomusers
rpcclient > lookupnames admin
```


# 1 list the supported protocols and dialects
nmap -p445 --script smb-protocols [TARGET]

# 2 Running security mode script to return the information about the SMB security level
nmap -p445 --script smb-security-mode [TARGET]

# 3.a Enumerating the users logged into a system through an SMB share
nmap -p445 --script smb-enum-sessions [TARGET]

# 3.b In case guest login is not enabled we can always use valid credentials of the target machine to discover the same information

nmap -p445 --script smb-enum-sessions --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 4.a Enumerating all available shares
nmap -p445 --script smb-enum-shares [TARGET	]

# 4.b Scanning all shares using valid credentials to check the permissions

nmap -p445 --script smb-enum-shares --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 5 Enumerate the windows users on a target machine
nmap -p445 --script smb-enum-users --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 6 Get information about the server statistics. It uses port 445 and port 139 to fetch the
details.

nmap -p445 --script smb-server-stats --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 7 Enumerating available domains on a target machine
nmap -p445 --script smb-enum-domains --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 9 Enumerating available user groups on a target machine

nmap -p445 --script smb-enum-groups --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 10 Enumerating services on a target machine

nmap -p445 --script smb-enum-services --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]


# 11 Enumerating all the shared folders and drives then running the ls command

nmap -p445 --script smb-enum-shares,smb-ls --script-args smbusername=[USERNAME],smbpassword=[PASSWORD] [TARGET]





```












### `Enum4linux`

Is a tool used to enumerate SMB shares on both Windows and Linux systems. It is basically a wrapper around the tools in the Samba package and makes it easy to quickly extract information from the target pertaining to SMB.

```
enum4linux -a $ip
enum4linux -o $ip
enum4linux -U $ip
enum4linux -G $ip

# Look for users SID
enum4linux -r -u [USERNAME] -p [PASSWORD] $ip
``