
# Linux
whoami
id
ifconfig/ip addr
uname -a
ps -ef


#Windows
whoami		
ver
ipconfig
tasklist
netstat -an


How many non-root/non-service/non-daemon users are there?
`awk -F':' '{ if ($3 >= 1000 && $1 != "nobody" ) print $1 }' /etc/passwd | wc -l`

What is the [USER]'s shell set as?
`getent passwd [USER]| awk -F':' '{print $7}'`
	- eg: `getent passwd www-data | awk -F':' '{print $7}'`
