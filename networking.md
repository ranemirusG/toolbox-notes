# Networking


## Table of Contents

1. [Preliminary Notes](#preliminary-notes)
2. [Software](#software)
3. [Websites](#websites)
4. [Inspect](#inspect)




5. [Cross-Platform Utilities](#cross-platform-utilities)



## Software

### Windows
Nirsoft `cports.exe`

Sysinternals `tcpview.exe`

Resource Monitor `C:\Windows\System32\resmon.exe`

### macOS
LanScan


## Websites
<shodan.io>

<zoomeye.org>





## Inspect

### IP Configuration

#### PowerShell

```


ipconfig
ipconfig /all

Get-NetTCPSetting
Get-NetIPConfiguration





# Public IP
curl.exe www.ifconfig.me
Invoke-WebRequest ifconfig.me/ip
(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
(Invoke-WebRequest -UseBasicParsing -URI ifconfig.me).Content

https://whatismyipaddress.com
https://ip4.me/
https://cualesmiip.com
https://ifconfig.me
https://www.arin.net/ (nice detail in the top bar)




# display routing table for a Windows machine
route print
netstat -r

# Display the arp table
arp -a


ipconfig /all; route print  ; arp -anetsh






















# Display and modifies the entries in the local IP routing table
# Manipulates network routing tables
# Add and delete static routes
route








# Displays NetBIOS over TCP/IP (NetBT) protocol statistics for local and remote computers
# NetBIOS name tables
# NetBIOS name cache
NbtStat


# Netsh # cmd
Netsh is a command-line scripting utility that allows you to, either locally or remotely, display or modify the network configuration of a currently running computer. 
Used without parameters, netsh opens the Netsh.exe command prompt (that is, netsh>).

netsh
netsh wlan show interfaces
netsh interface ipv4 show interfaces
netsh int ipv4 show excludedportrange protocol=tcp
netsh firewall show state
netsh firewall show config







Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
Get-Process -Id (Get-NetUDPEndpoint -LocalPort YourPortNumberHere).OwningProcess



Test-Connection
Test-NetConnection -ComputerName <host> -Port <port>
Test-NetConnection -ComputerName example.com -Port 80




```

PowerShell: .NET Framework's System.Net.Sockets class
PowerShell has access to the .NET Framework, allowing you to leverage the System.Net.Sockets class for more advanced port scanning.
Here's an example script that scans a range of ports on a remote host:
```
$hostname = "<host>"
$startPort = <start_port>
$endPort = <end_port>

for ($port = $startPort; $port -le $endPort; $port++) {
	$tcpClient = New-Object System.Net.Sockets.TcpClient
	$result = $tcpClient.BeginConnect($hostname, $port, $null, $null)
	$wait = $result.AsyncWaitHandle.WaitOne(1000, $false)

	if ($wait -and $tcpClient.Connected) {
		Write-Host "Port $port is open"
		$tcpClient.Close()
	}
}


```



#### CMD

```

for /L %i in (<start_port>,1,<end_port>) do echo "" | nc -vz <host> %i


```

#### \*NIX

```

# information about the network interfaces and their IP addresses configured on a device 
ip
ip addr


iwconfig
ifconfig

# administration tool for IPv4/IPv6 packet filtering and NAT
iptables	



tcpdump # packet analyzer that captures and displays network packets.
# To capture all network traffic on a specific interface, use:
sudo tcpdump -i <interface_name>





# lists open files (lsof), including network connections
lsof
# list all open Internet, x.25 (HP-UX), and UNIX domain files
lsof -i -U
# list all open IPv4 network files in use by the process whose PID is 1234
lsof -i 4 -a -p 1234
# Presuming the UNIX dialect supports IPv6, to list only open IPv6 network files
lsof -i 6
# lists all open UDP ports, provides information about the processes associated with the open UDP ports
sudo lsof -iUDP
# lists all open TCP ports that are in a listening state, provides a detailed view of the processes associated with the open ports
sudo lsof -iTCP -sTCP:LISTEN
lsof -i :<port_number>
lsof -i | grep LISTEN
sudo lsof -i | grep ESTABLISHED
sudo lsof -nP -i | grep LISTEN


nc # Netcat https://www.sans.org/security-resources/sec560/netcat_cheat_sheet_v1.pdf
netcat as client 	nc MACHINE_IP PORT_NUMBER
netcat as server 	nc -lvnp PORT_NUMBER


# macOS
nettop # live view of network activity
# monitor network connections and displays the associated processes
sudo dtrace -n 'syscall::connect*:entry { printf("%s[%d] connects to %s\n", execname, pid, copyinstr(arg0)); }'
sudo networksetup -listallhardwareports


```


### Open Ports

#### PowerShell

```
netstat -aon | find /i "listening" # cmd


```

#### CMD

```

```

#### \*NIX

```

```








































## Invoke-WebRequest (In Powershell `curl` is an alias for this command)

```

# get a website content, save it as xx.html (iwr is alias of Invoke-WebRequest)
iwr "google.com" -outfile xx.html

# Download using PowerShell’s WebClient object
(new-object System.Net.WebClient).DownloadFile('http://xx.xx.xx.xx/file.txt','destination/path/file.txt')




```



## Cross-Platform Utilities


`whois`
Looks up the registration record associated with a domain name

Information about who registered and owns a domain name

Domains are leased out by companies called Domain Registrars

If you want a domain, you go and register with a registrar, then lease the domain for a certain length of time.

See: REVERSE WHOIS (for horizontal recon)

	
`nslookup` (Name Server Lookup)

IP addresses associated with a domain name (and viceversa)

use: `nslookup OPTIONS DOMAIN_NAME SERVER`

Also as an interactive prompt, just `nslookup`

Options:
	A 	IPv4 Addresses
	AAAA 	IPv6 Addresses
	CNAME 	Canonical Name
	MX 	Mail Servers
	SOA 	Start of Authority
	TXT 	TXT Records

example: mail configur
`nslookup -type=MX tryhackme.com`


`dig` ----> similar to nslookup
Allows us to manually query recursive DNS servers of our choice for information about domains
Very useful tool for network troubleshooting

```
dig tryhackme.com MX
dig tryhackme.com A
dig @1.1.1.1 tryhackme.com MX
dig www.ekoparty.org +short
```

https://dnsdumpster.com/





`ping` (Packet Internet Groper)

:	Verifies IP-level connectivity to another TCP/IP device

	Sends an ICMP Echo packet to a remote system. If the remote system is online, and the ping packet was correctly routed and not blocked by 
any firewall, the remote system should send back an ICMP Echo Reply. Similarly, the ping reply should reach the first system if 
appropriately routed and not blocked by any firewall.

	ICMP echo/type 8
	
	ICMP echo reply/type 0
	
	ping -c 10 MACHINE_IP ----> count (UNIX)
	
	ping -n 10 MACHINE_IP ----> count (WINDOWS)
	


`pathping` (WINDOWS)

:	Combines features of the tools `ping` and `tracert`
	Can show the degree of packet loss at any specifies router



`traceroute` (UNIX) / tracepath ?? / `tracert` (WINDOWS)
:	Information about the path a packet takes

	Indicates the number of hops (routers) between your system and the target host

	Some routers don’t return a reply

`traceroute -i`  specify an interface

`traceroute -T` ---->  use TCP SYN requests when tracing the route





	
`Test-Connection`
```
# Test-Connection from a file listing computers
# must create a property 'ComputerName' which Test-Connection can understand

Get-Content -Path [PATH HERE] |
ForEach-Object { [pscustomobject]@{ComputerName = $PSItem} } |
Test-Connection

```


`telnet`
:	The TELNET (Teletype Network) protocol was developed in 1969 to communicate with a remote system via a command-line interface (CLI). Hence, 
the command telnet uses the TELNET protocol for remote administration. The default port used by telnet is 23. From a security perspective, 
telnet sends all the data, including usernames and passwords, in cleartext. Sending in cleartext makes it easy for anyone, who has access to 
the communication channel, to steal the login credentials. The secure alternative is SSH (Secure SHell) protocol.

	It can be user for troubleshooting by adding a port number
	`telnet server01 25`

*Note that both telnet and Test-NetConnection are primarily used to check connectivity to a specific port on a remote host. They are not 
exhaustive port scanners like dedicated tools such as Nmap, but they can be useful for basic port testing.*




## netstat (Network Statistics)

Display active TCP connections, open ports, incoming and outgoing network connections



```
# active ports and name of processes
netstat -ab

netstat -o # PID (then you can search for it in Task Manager)
netstat -0 | findstr 28604 # show only the connections that are using a specific PID
netstat -aon # open ports
netstat -ne
netstat -s -p tcp -f # Protocol-Specific Stats (-f for FQDN)
netstat -sp tcp
netstat -sp udp
netstat -e -t 5 # Updated Network Stats
netstat -an | grep LISTEN # list open network ports
```