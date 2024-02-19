# Privilege Escalation

`sudo -l`
list the privileges for the invoking user (or the user specified by the -U option)

`find / -type f -perm -u=s 2>/dev/null`
The SUID bit is a special permission in Unix/Linux systems that allows a file to be executed with the permissions of the file's owner rather than the user who executed the file.