# SMB (Server Message Block Protocol) / Samba

Default Port: 445

Is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network.

Clients connect to servers using TCP/IP (actually NetBIOS over TCP/IP as specified in RFC1001 and RFC1002), NetBEUI or IPX/SPX.




## Shares

An SMB-enabled storage on the network is called a share.
These can be accessed by any client that has the address of the server and the proper credentials. Like many other file access protocols, SMB requires some security layers to function appropriately within a network topology. If SMB allows clients to create, edit, retrieve, and remove files on a share, there is a clear need for an authentication mechanism.

At a user level, SMB clients are required to provide a username/password combination to see or interact with the contents of the SMB share.


### Common shares
C$: Default administrative share for the C: drive.
ADMIN$: Administrative share that provides access to the Windows directory.
IPC$: Used for inter-process communication.


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

```


### `SMBClient`

```
smbclient -L $ip

smbclient -N -L \\\\{TARGET_IP}\\
# -N: No password
# -L : This option allows you to look at what services are available on a serve


smbclient \\\\$ip\\C$
smbclient \\\\$ip\\CustomShare

smbclient //$ip/sharename -U username



```




### nmap
`nmap --script smb-enum-shares,smb-enum-users -p 445 192.168.1.100`




### `Enum4linux`

Is a tool used to enumerate SMB shares on both Windows and Linux systems. It is basically a wrapper around the tools in the Samba package and makes it easy to quickly extract information from the target pertaining to SMB.

```
enum4linux -a $ip
``