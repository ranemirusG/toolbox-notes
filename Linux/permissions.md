# Permissions

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
