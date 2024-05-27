# Networking


## Table of Contents

1. [Preliminary Notes](#preliminary-notes)
2. [Software](#software)
3. [Config Files](#config-files)
4. [Websites](#websites)
5. [Inspect](#inspect)
6. [Reconnaissance](#reconnaissance)
7. [Cross-Platform Utilities](#cross-platform-utilities)



## Preliminary Notes

List of commands and tools to deal with networking.









###########################################




https://en.wikipedia.org/wiki/Berkeley_Packet_Filter
https://biot.com/capstats/bpf.html
https://www.tcpdump.org/manpages/tcpdump.1.html




###########################################


















## Software

Network Sniffing and Packet Analysis
	- Tcpdump is a free open source command-line interface (CLI) program that has been ported to work on many operating systems.
	- Wireshark is a free open source graphical user interface (GUI) program available for several operating systems, including Linux, macOS and MS Windows.
	- Tshark is a CLI alternative to Wireshark.
	
Network Monitoring
	- Zeek

Intrusion Detection and Prevention
	- <https://www.snort.org/>

Network Forensics
	- NetworkMiner

Threat Hunting (Brim)











### Windows
Nirsoft `cports.exe`

Sysinternals `tcpview.exe`

Resource Monitor `C:\Windows\System32\resmon.exe` (Network tab)


#### Troubleshooting

https://answers.microsoft.com/en-us/windows/forum/all/i-believe-ive-been-ip-banned-how-can-i-fix-this/9f6dd98c-ad9c-4f0f-9a68-eff4f360551a


### macOS
LanScan




## Config Files

### Windows
- C:\Windows\System32\drivers\etc or %WINDIR%\System32\drivers\etc
- C:\inetpub

- Cert:\ (`cd cert:`)

Control Panel > Network and Internet > Network and Sharing Center



### \*NIX
- /etc/hosts
- /etc/hosts.allow
- /etc/hosts.deny

- /etc/resolve.conf








## Websites
<shodan.io>
<https://dnsdumpster.com/>
<zoomeye.org>

### Internet Speed
- Google's built-in speed test (search "internet speed test" in Google)
- http://fast.com
- https://www.dslreports.com/
- https://www.speedtest.net/
- https://www.dnsperf.com/


### Website Performace
- https://gtmetrix.com/
- https://postdigitalist.notion.site/Landing-Page-Optimization-Checklist-c236979d925d4a589f57234354a61499


## Inspect

### Snippets
`ipconfig /all;route print;arp -a;`



### netstat

```powershell
netstat -aon | find /i "listening" # cmd
netstat -aon | findstr :8000 # cmd


#### \*NIX

```
ss

lsof

netstat -lntu
	# -l = only services which are listening on some port
	# -n = show port number, don't try to resolve the service name
	# -t = tcp ports
	# -u = udp ports
	# -p = name of the program
	
```









### IP Configuration

#### PowerShell

```
ipconfig
ipconfig /all
Get-NetIPConfiguration


Get-NetTCPSetting
Get-NetTCPConnection





# Get my public IP
Invoke-WebRequest ifconfig.me/ip
(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
(Invoke-WebRequest -UseBasicParsing -URI ifconfig.me).Content
curl.exe www.ifconfig.me
curl ifconfig.me
curl myexternalip.com/raw
curl ipecho.net/plain
curl ifcfg.me
curl icanhazip.com
nslookup myip.opendns.com. resolver1.opendns.com


https://whatismyipaddress.com
https://ip4.me/
https://cualesmiip.com
https://ifconfig.me
https://www.arin.net/ (nice detail in the top bar)




























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
https://learn.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts

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







Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
Get-Process -Id (Get-NetUDPEndpoint -LocalPort YourPortNumberHere).OwningProcess


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

curl checkip.amazonaws.com

for /L %i in (<start_port>,1,<end_port>) do echo "" | nc -vz <host> %i


```

#### \*NIX

```

# information about the network interfaces and their IP addresses configured on a device 
ip
ip addr
ip addr show tun0

iwconfig
ifconfig

# administration tool for IPv4/IPv6 packet filtering and NAT
iptables	



tcpdump # packet analyzer that captures and displays network packets.

# To capture all network traffic on a specific interface
`sudo tcpdump -i <interface_name>`
`sudo tcpdump ip proto \\icmp -i tun0`

Used for checking if what we're typing is being executed as a system command from a telnet session, for example.





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





# macOS
nettop # live view of network activity
# monitor network connections and displays the associated processes
sudo dtrace -n 'syscall::connect*:entry { printf("%s[%d] connects to %s\n", execname, pid, copyinstr(arg0)); }'
sudo networksetup -listallhardwareports


```
### DNS

#### PowerShell
```
ipconfig /displaydns # cmd

Get-DnsClientCache

Get-DnsClientCache | Format-Table -AutoSize


ipconfig /flushdns


```



#### macOS
```

# Flush DNS
sudo killall -HUP mDNSResponder


```













### MAC Addresses

#### Windows
```powershell
getmac.exe # CMD

Get-NetAdapter | Select-Object -Property Name, Macaddress
Get-NetAdapter -Name * -IncludeHidden
Get-NetAdapter -Name "Ethernet 2"
```

#### \*NIX
```
cat /sys/class/net/*/address

```


























## Invoke-WebRequest (In Powershell `curl` is an alias for this command)

```

# get a website content, save it as xx.html (iwr is alias of Invoke-WebRequest)
iwr "google.com" -outfile xx.html

# Download using PowerShell’s WebClient object
(new-object System.Net.WebClient).DownloadFile('http://xx.xx.xx.xx/file.txt','destination/path/file.txt')




```








































## Reconnaissance

### Passive


#### `whois`  RFC 3912 
Looks up the registration record associated with a domain name
Domains are leased out by companies called Domain Registrars
Many registrants subscribe to privacy services to avoid their email addresses being harvested 

Look for:
	- Registrar (ex: namecheap.com)
	- Name Server (ex: cloudflare.com)

Online tool: <https://who.is/>

See: REVERSE WHOIS (for horizontal recon)






	
#### `nslookup` (Name Server Lookup)
RFC 1034

IP addresses associated with a domain name (and viceversa)

use: `nslookup OPTIONS DOMAIN_NAME SERVER` or as an interactive prompt, just `nslookup`

Options:
A		IPv4 Addresses
AAAA	IPv6 Addresses
CNAME	Canonical Name
MX		Mail Servers
SOA		Start of Authority
TXT		TXT Records


example:
`nslookup -type=A tryhackme.com 1.1.1.1`
`nslookup -type=MX tryhackme.com`

find the authoritative name servers for a domain (NS query)
```
> nslookup
> set query=ns
> stackoverflow.com
```


#### `dig` (Domain Information Groper)

Returns more info than `nslookup`
Allows us to manually query recursive DNS servers of our choice for information about domains
Very useful tool for network troubleshooting

use: `dig DOMAIN_NAME TYPE`
```
dig tryhackme.com MX
dig tryhackme.com A
dig @1.1.1.1 tryhackme.com MX
dig www.ekoparty.org +short
```

#### https://dnsdumpster.com/
Discover subdomains




### Active

#### `ping` (Packet Internet Groper)
Verifies IP-level connectivity to another TCP/IP device

Sends an ICMP Echo packet to a remote system. If the remote system is online, and the ping packet was correctly routed and not blocked by any firewall, the remote system should send back an ICMP Echo Reply. Similarly, the ping reply should reach the first system if appropriately routed and not blocked by any firewall.

ping -c 10 MACHINE_IP # UNIX
ping -n 10 MACHINE_IP # WINDOWS
	
We can ping every IP address on a target network and see who would respond to our ping (ICMP Type 8/Echo) requests with a ping reply (ICMP Type 0)



#### Trace Route
Indicates the number of hops (routers) between your system and the target host (Information about the path a packet takes)
Sends ICMP with increasing TTL to “trick” the routers into revealing their IP addresses
Some routers don’t return a reply

`traceroute` # UNIX
`traceroute -i`  specify an interface
`traceroute -T` ---->  use TCP SYN requests when tracing the route


`tracert` # Windows CMD
`Test-NetConnection -ComputerName <host> -Port <port> # Windows PowerShell`
`Test-NetConnection -ComputerName example.com -Port 80 # Windows PowerShell`
`pathping` # WINDOWS / Combines features of the tools `ping` and `tracert`. Can show the degree of packet loss at any specifies router




#### `telnet`
application protocol
used to connect to a virtual terminal of another computer


From a security perspective, telnet sends all the data, including usernames and passwords, in cleartext. Sending in cleartext makes it easy for anyone, who has access to the communication channel, to steal the login credentials. The secure alternative is SSH (Secure SHell) protocol.
Knowing that telnet client relies on the TCP protocol, you can use Telnet to connect to any service and grab its banner.


It can be user for troubleshooting by adding a port number
`telnet server01 25`

*Note that both telnet and Test-NetConnection are primarily used to check connectivity to a specific port on a remote host. They are not 
exhaustive port scanners like dedicated tools such as Nmap, but they can be useful for basic port testing.*



#### ftp
RFC 959

A typical FTP session operates using two channels: a command (sometimes called the control) channel a data channel. This separation of command information and data into separate channels is a way of being able to send commands to the server without having to wait for the current data transfer to finish.

there are two modes for FTP:
	- Active: In the active mode, the data is sent over a separate channel originating from the FTP server’s port 20.
	- Passive: In the passive mode, the data is sent over a separate channel originating from an FTP client’s port above port number 1023.

Commands:

The command `TYPE A` `ascii` switches the file transfer mode to ASCII, while `TYPE I` switches the file transfer mode to binary.

Read file stdout `get file.txt -`





#### SMB (Server Message Block Protocol) / Samba
Is a client-server communication protocol used for sharing access to files, printers, serial ports and other resources on a network.

Response-Request protocol (meaning that it transmits multiple messages between the client and server to establish a connection)

Clients connect to servers using TCP/IP (actually NetBIOS over TCP/IP as specified in RFC1001 and RFC1002), NetBEUI or IPX/SPX.

`SMBClient` it's part of the default samba suite

`Enum4linux` is a tool used to enumerate SMB shares on both Windows and Linux systems. It is basically a wrapper around the tools in the Samba package and makes it easy to quickly extract information from the target pertaining to SMB.







#### NFS (Network File System)
https://en.wikipedia.org/wiki/Network_File_System

Example:
`/usr/sbin/showmount -e TARGET` to list the NFS shares

Mount the share to our local machine:
`sudo mount -t nfs IP:share_dir /tmp/mount/ -nolock`











######################################################

ORDENAR

## Cross-Platform Utilities

	
`Test-Connection`
```
# Test-Connection from a file listing computers
# must create a property 'ComputerName' which Test-Connection can understand

Get-Content -Path [PATH HERE] |
ForEach-Object { [pscustomobject]@{ComputerName = $PSItem} } |
Test-Connection

```






## netstat (Network Statistics)

Display active TCP connections, open ports, incoming and outgoing network connections

https://www.ionos.com/digitalguide/server/tools/netstat-commands/

```


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
```