# Networking Utilities








## Useful snippets

### Windows
```

ipconfig /all;route print;arp -a;


for /L %i in (<start_port>,1,<end_port>) do echo "" | nc -vz <host> %i


```




### Linux
```



```

















## ping (Packet Internet Groper)

Verifies IP-level connectivity to another TCP/IP device

Sends an ICMP Echo packet to a remote system. If the remote system is online, and the ping packet was correctly routed and not blocked by any firewall, the remote system should send back an ICMP Echo Reply. Similarly, the ping reply should reach the first system if appropriately routed and not blocked by any firewall.

ping -c 10 MACHINE_IP # UNIX
ping -n 10 MACHINE_IP # WINDOWS
	
We can ping every IP address on a target network and see who would respond to our ping (ICMP Type 8/Echo) requests with a ping reply (ICMP Type 0)



	
### Test-Connection
```powershell
# Test-Connection from a file listing computers
# must create a property 'ComputerName' which Test-Connection can understand

Get-Content -Path [PATH HERE] |
ForEach-Object { [pscustomobject]@{ComputerName = $PSItem} } |
Test-Connection

```


















## Trace Route / traceroute / tracert / route
Indicates the number of hops (routers) between your system and the target host (Information about the path a packet takes)
Sends ICMP with increasing TTL to "trick" the routers into revealing their IP addresses
Some routers don’t return a reply


`traceroute` # UNIX
`traceroute -i`  specify an interface
`traceroute -T` ---->  use TCP SYN requests when tracing the route


`tracert` # Windows CMD
`Test-NetConnection -ComputerName <host> -Port <port> # Windows PowerShell`
`Test-NetConnection -ComputerName example.com -Port 80 # Windows PowerShell`
`pathping` # WINDOWS / Combines features of the tools `ping` and `tracert`. Can show the degree of packet loss at any specifies router




# Display and modifies the entries in the local IP routing table
# Manipulates network routing tables
# Add and delete static routes
route

















## netstat

Network Statistics

Display active TCP connections, open ports, incoming and outgoing network connections

https://www.ionos.com/digitalguide/server/tools/netstat-commands/






Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships




```powershell

netstat -aon | find /i "listening" # cmd
netstat -aon | findstr :8000 # cmd
Get-NetTCPConnection -LocalPort [PORT NUMBER]



# IPv4
netstat -p tcp

# IPv6
netstat -an | findstr "::"

netsh int ip reset # reset stack

# active ports and name of processes
netstat -ab

netstat -o # PID (then you can search for it in Task Manager or with `tasklist /fi "pid eq [PID]"`)

netstat -0 | findstr 28604 # show only the connections that are using a specific PID
netstat -aon # open ports
netstat -ne
netstat -s -p tcp -f # Protocol-Specific Stats (-f for FQDN)
netstat -sp tcp
netstat -sp udp
netstat -e -t 5 # Updated Network Stats
netstat -an | grep LISTEN # list open network ports


netstat -lntu
	# -l = only services which are listening on some port
	# -n = show port number, don't try to resolve the service name
	# -t = tcp ports
	# -u = udp ports
	# -p = name of the program
	
```



### ss
It allows showing information similar to netstat. 
It can display more TCP and state information than other tools.
`ss` is used to dump socket statistics.





















##  netsh
`netsh` is a command-line scripting utility that allows you to, either locally or remotely, display or modify the network configuration of a currently running computer.

Used without parameters, netsh opens the Netsh.exe command prompt (that is, netsh>).
https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts

```
netsh

netsh wlan show profile
netsh wlan show profile "[NETWORK NAME]"
netsh wlan show profile "[NETWORK NAME]" key=clear &REM Shows the password and info

netsh wlan show interfaces
netsh interface ipv4 show interfaces
netsh int ipv4 show excludedportrange protocol=tcp

	
netsh firewall show state
netsh firewall show config
netsh advfirewall firewall
netsh advfirewall firewall show rule name=all

```







## NbtStat

Displays NetBIOS over TCP/IP (NetBT) protocol statistics for local and remote computers
NetBIOS name tables
NetBIOS name cache











## lsof
The lsof (List Open Files) command is a powerful utility in Unix-based systems that provides a list of all open files and the processes that opened them. It is commonly used for network diagnostics to identify which processes are using network connections.

```
# TODO: add commands!



```




















## Software

- <https://en.wikipedia.org/wiki/Berkeley_Packet_Filter>
- <https://biot.com/capstats/bpf.html>

- Network Monitoring - Zeek
- Intrusion Detection and Prevention - <https://www.snort.org/>
- Network Forensics - NetworkMiner
- Threat Hunting (Brim)
- LanScan

### Windows
- Nirsoft `cports.exe`
- Sysinternals `tcpview.exe`
- Resource Monitor `C:\Windows\System32\resmon.exe` (Network tab)