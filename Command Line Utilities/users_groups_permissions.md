# Users / Groups / Permissions


## Users

### Windows

- Win+R > lusrmgr.msc
- Control Panel > User Accounts



```
# go to Users directory
sl $env:SystemDrive/users


whoami /user
whoami /priv
whoami /all

hostname



# Logged users
PsLoggedOn \\[HOSTNAME] # SysInternals

# user last logon
net user john | findstr /B /C:"Last logon"





# List users in domain
net user /[DOMAIN]
net user [USERNAME] /[DOMAIN]






# List active user accounts in local system
net user
net users
Get-LocalUser
Get-LocalUser | Format-Table Name, Enabled, LastLogon
Get-LocalUser | Sort-Object -Property Enabled | Format-Table Name, Enabled, LastLogon



# list all SIDs on a system
gcim Win32_Account | ft Name, SID

# list all User SID
gcim Win32_UserAccount | ft Name, SID
Get-WmiObject win32_useraccount | Select name,sid

# Get SID from User
$objUser = New-Object System.Security.Principal.NTAccount("DOMAIN_NAME", "USER_NAME")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value

#Get User from SID
$objSID = New-Object System.Security.Principal.SecurityIdentifier S-1-5-21-455291304-1752063992-2633877976-1002
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
$objUser.Value

# Local user to SID
$objUser = New-Object System.Security.Principal.NTAccount(LOCAL_USER_NAME)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value

















# add user
net user "username" "p@ssw0rd" /add
New-LocalUser

# delete user
net user "username" /delete
Remove-LocalUser -Name "Username"

# Change user password
net user <username> <newpassword>

# Enable / Disable user
Disable-LocalUser -Name "[USERNAME]"
net user [USERNAME] /active:no

# enable/disable the built-in Administrator:
net user administrator /active:yes
net user administrator /active:no


```



































### Linux

```
whoami

hostname
hostnamectl
hostnamectl status


# Show who is logged on and what are they doing
w
id
id [username]



# List all users
cat /etc/passwd
cut -d: -f1 /etc/passwd | sort | uniq
awk -F: '{print "User:", $1, "UID:", $3, "GID:", $4}' /etc/passwd

getent passwd | cut -d: -f1
getent passwd | awk -F: '{print $1, ":", $6}'

# List Users by Number of Processes
ps -e -o user= | awk '{if ($1 != "") print $1}' | sort | uniq -c | sort -n



# Run command as specific user
sudo -u [username] [command]



# terminate all processes for a specified user
pkill -KILL -u [USERNAME]


# logout using command line
loginctl terminate-user [USERNAME]







# sudo
usermod -aG sudo [USER NAME]
sudo -i
sudo -s
sudo su -; cd -


# switch user
su [USER NAME]
su - [USER NAME]
su -l [USER NAME]








# Delete user
userdel -r [USER NAME]
rm -rf /home/[USER NAME]
rm -rf /var/mail/[USER NAME]




# Create user
useradd -m [USER NAME]
sudo useradd -m -s /bin/bash [USERNAME]


# set password
passwd [USER NAME]

# add extra info
sudo usermod -c "Full Name" [USER NAME]






# Change user name
## 1 
hostnamectl set-hostname [NEW NAME]
# then modify `/etc/hostname`

## 2 - login as root and overwrite oldname
usermod -l [NEW NAME] -d /home/[OLD NAME] -m [OLD NAME]
groupmod -n [NEW NAME] [OLD NAME]

```




















































## Groups


### Windows

```
whoami /groups




# Enumerate all groups in the entire domain
net group /domain
net group [GROUP NAME] /domain
net group "Sales Department" /domain



net localgroup
net localgroup [GROUP NAME]
net localgroup Administrators

Get-LocalGroup
Get-LocalGroup | Format-Table Name, PrincipalSource
get-LocalGroup | ft Name, SID






# List group members
Get-LocalGroupMember -Group "Administrators"
(Get-LocalGroupMember “Administrators”).Name





# Create new group
New-LocalGroup -Name "Group Name"

# Add/Delete user to group
Add-LocalGroupMember -Group "GROUP" -Member "USER"
Remove-LocalGroupMember -Group "GROUP" -Member "USER"
net localgroup "GROUP" "USER" /add # cmd
net localgroup "GROUP" "USER" /delete # cmd


```












### Linux

- GECOS Field
1 - User's full name (or application name, if the account is for a program)
2 - Building and room number or contact person
3 - Office telephone number
4 - Home telephone number
5 - Any other contact information (pager number, fax, external e-mail address, etc.)



```

# list all the groups
getent group
cat /etc/group



# Check groups a user is in
groups [USERNAME]

# Add user to group. Example: If you want to add yourself to the docker group to use docker without sudo
sudo usermod -aG docker [USERNAME]

# Add a user to the wheel group, which grants them sudo privileges
usermod -aG wheel [USERNAME]

# Delete user from group
sudo gpasswd -d [USERNAME] [GROUP]





# find files belonging to a specified group
find / -group [GROUP NAME] 2>/dev/null


```



































## Permissions


### Windows

```

# run as administrator
Start-Process powershell -Verb runas
start powershell -Verb runas
Start-Process wt -Verb runAs


# allow all scripts to run without any restrictions or warnings
powershell -ep bypass

powershell.exe -ExecutionPolicy Bypass -File C:\Temp\your_script.ps1




accesschk “domain\user” -a * -nobanner # Sysinternals




# check whether you have elevated privileges (administrator rights) in PowerShell
# True if you're Admin / False if not
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)



```




































### Linux

User - Group - Others
Owner - Owner Group - Others Group

```
0 | 000 | ---
1 | 001 | --x
2 | 010 | -w-
3 | 011 | -wx
4 | 100 | r--
5 | 101 | r-x
6 | 110 | rw-
7 | 111 | rwx
```



- See: `man 5 sudoers`




SUID (Set owner User ID) / SGID (set group id)
Suid is a special permission.
If the file owner doesn't have execute permissions, then use an uppercase S here.
It will replace the `x` of the user permission for an `s`
Allow users to run an executable with the file system permissions of the executable's owner (or group respectively if `setgid`)


euid: efective user id

https://www.redhat.com/sysadmin/suid-sgid-sticky-bit









```
ls -l [FILE]
stat [FILE]

# search for every directory writable by the current user
find / -writable -type d 2>/dev/null

# View ACLs of a file (Get File Access Control List)
getfacl [FILE]

# Modify ACL
setfacl -m u:"$user":"$perm" "$target"
setfacl -R -m u:username:perm dir # Recursive

# Set default ACL
setfacl -d -m u:username:perm dir


# Remove ACL
setfacl -x u:username file
# Remove Default ACLs
setfacl -k dir
# Remove All ACLs
setfacl -b file




# list all commands that the invoking user is permitted to run with `sudo`
sudo -l
sudo -l [COMMAND] # specify a command to see if the user has permission to run it

# the -u flag to designate a particular user to run as
sudo -u [USERNAME] [COMMAND]

# search for files with the setuid bit set, which are owned by the root user
find / -user root -perm 4000 2>/dev/null
find / -perm -4000 2>/devl/null
find / -perm -4000 2>/devl/null | xargs ls -l

# search for regular files with the setuid bit set across the entire filesystem
find / -perm -u=s -type f 2>/dev/null

# search for setuid files owned by a specific user and list them with detailed information
find / -type f -perm -u=s -user [USERNAME] -ls 2>/dev/null

# list all files in the current directory (and subdirectories) with 644 permissions
find . -type f -perm 644





# chmod (change mode - change the security permissions)
# take all permissions away from everyone
chmod ugo-rwx [FILE]

# add r and w permission to user and group and revoke execute permission from others
chmod ug+rw,o-x [FILE]

chmod ugo+rwx [FILE] # is equivalent to chmod 777 [FILE]
chmod u=r,g=wx,o=rx [FILE] # is equivalent to chmod 435 [FILE]

# give SUID permission
chmod u+s [FILE]


# chown
chown [NEW OWNER]:[NEW GROUP] [FILE]










#capabilities

man capabilities


getcap [binary] # If no output, it means it does not have any capabilities assigned
setcap

# search binaries with capabilities
/usr/sbin/getcap -r / 2>/dev/null

```

