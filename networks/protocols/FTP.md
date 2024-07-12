# FPT

Default Port: 21
RFC 959

A typical FTP session operates using two channels: a command (sometimes called the control) channel a data channel. This separation of command information and data into separate channels is a way of being able to send commands to the server without having to wait for the current data transfer to finish.

there are two modes for FTP:
	- Active: In the active mode, the data is sent over a separate channel originating from the FTP server’s port 20.
	- Passive: In the passive mode, the data is sent over a separate channel originating from an FTP client’s port above port number 1023.






## Commands

The command `TYPE A` `ascii` switches the file transfer mode to ASCII, while `TYPE I` switches the file transfer mode to binary.

Connect to the server: `ftp [IP]`

```
# Read file stdout
get file.txt -


# Download file(s)
get [FILE]
mget *



```







### Use commands from script

`ftp -v -n -s:sct.txt`
 
`-n`: This option prevents the FTP client from attempting to automatically log in upon connection. This is useful when you want to handle the login process manually or through a script. 
 

 
script example `scr.txt`:
```
open ftp.example.com
USER anonymous
PASS anonymous
binary
GET file.txt
bye
```














