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






- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-smb>





## Shares

An SMB-enabled storage on the network is called a share.
These can be accessed by any client that has the address of the server and the proper credentials. Like many other file access protocols, SMB requires some security layers to function appropriately within a network topology. If SMB allows clients to create, edit, retrieve, and remove files on a share, there is a clear need for an authentication mechanism.

At a user level, SMB clients are required to provide a username/password combination to see or interact with the contents of the SMB share.






### SMB Default Folders

SMB (Server Message Block) is a network protocol primarily used for sharing files, printers, and other resources between computers on a network. When you configure an SMB server, certain default folders or shares are often created depending on the operating system and SMB implementation.

#### Windows SMB Default Shares

1. Administrative Shares: These are hidden shares that are accessible only to administrators.
   - C$ (or any drive letter, e.g., D$, E$): The root of each volume (drive) on the system is shared by default with a dollar sign ($) to denote that it is hidden. Default administrative share for the C: drive.
   - ADMIN$: This is a share to the Windows system root folder (usually `C:\Windows`). It is used for administrative purposes, such as remote management. Administrative share that provides access to the Windows directory.
   - IPC$: Stands for "Inter-Process Communication." This share is used for temporary connections between clients and servers for functions such as managing printers and services. Is also known as a null session connection. By using this session, Windows lets anonymous users perform certain activities, such as enumerating the names of domain accounts and network shares. <https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/inter-process-communication-share-null-session>
   - PRINT$: A share used for printer drivers, typically located in the `C:\Windows\System32\spool\drivers` directory.
   
   
   


2. User Profile Shares:
   - When configured, user profile directories may be shared for access from other machines. These are not default system shares but can be created automatically in some environments, like Active Directory.

3. NETLOGON: This is a share used in Active Directory environments for logon scripts and policies. It's typically located on domain controllers.

4. SYSVOL: Also used in Active Directory environments, this share contains files that must be available and synchronized across domain controllers, such as Group Policy data.





#### Linux/Unix SMB (Samba) Default Folders

When using Samba (the most common SMB server for Linux/Unix systems), there aren't default shares in the same way Windows has them, but there are typical configurations that admins often use:

1. [homes]: This share allows users to access their home directories. When configured, it dynamically creates a share for each user based on their username.
   - Example configuration:
     ```ini
     [homes]
        comment = Home Directories
        browseable = no
        writable = yes
     ```

2. [printers]: This share is used for printing services.
   - Example configuration:
     ```ini
     [printers]
        comment = All Printers
        path = /var/spool/samba
        browseable = no
        guest ok = no
        writable = no
        printable = yes
     ```

3. [public]: A common configuration for a public share where all users can read and/or write.
   - Example configuration:
     ```ini
     [public]
        comment = Public Share
        path = /srv/samba/public
        browseable = yes
        guest ok = yes
        writable = yes
     ```

















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


smbclient -L '//34.122.201.66/' -U '%'
smbclient '//10.10.16.165/SHARE' -U '%'

- <https://unix.stackexchange.com/questions/65106/accessing-a-smb-share-without-a-password>



smbclient -L $ip

smbclient -N -L \\\\{TARGET_IP}\\
# -N: No password
# -L : This option allows you to look at what services are available on a server



smbclient -p 4455 -L //192.168.50.63/ -U hr_admin --password=Welcome1234


smbclient \\\\$ip\\C$
smbclient \\\\$ip\\CustomShare
smbclient //[IP]/Public -N





# Access share 
smbclient \\\\[IP]\\sharename -U [USERNAME]


# Try in user share (with password)
smbclient //[IP]/jane -U jane
smbclient //[IP]/admin -U admin
smbclient //server/share -U domain/username


smbclient -U [USERNAME]%[PASSWORD] //[IP]/Users
smbclient -U SVC_TGS%GPPstillStandingStrong2k18 //10.10.10.100/Users

smbclient -p 4455 //192.168.50.63/scripts -U hr_admin --password=Welcome1234

# list shares
smbclient - L //[IP] -U [USERNAME]


# download the share's contents recursively so we can dig through it on our testing box
smbclient //10.10.11.222/[SHARE NAME] -N -c 'prompt OFF;recurse ON;lcd '[DESTINATION PATH]';mget *'


# Pass the Hash
smbclient \\\\[TARGET IP]\\[SHARE] -U Administrator --pw-nt-hash [NTLM HASH]

smbclient \\\\192.168.50.212\\secrets -U Administrator --pw-nt-hash 7a38310ea6f0027ee955abed1762964b

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



```
















### MSF / Metasploit

exploit/linux/samba/is_known_pipename











## PSExec

PsExec is a lightweight telnet-replacement developed by Microsoft that allows you execute processes on remote windows systems using any user’s credentials.

PsExec authentication is performed via SMB.

We can use the PsExec utility to authenticate with the target system legitimately and run arbitrary commands or launch a remote command prompt.



`PsExec.exe` on Windows

`psexec.py` python tool: `psexec.py Administrator@[IP] cmd.exe`





## MS17-010 EternalBlue

check if target is vulnerable:
with nmap
```
nmap -sV -p 445 --script=smb-vuln-ms17-010 [IP]
```

with MSF
```
auxiliary/scanner/smb/smb_ms17_010

exploit/windows/smb/ms17_010_eternalblue
```









