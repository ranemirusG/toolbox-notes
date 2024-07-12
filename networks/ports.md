# Ports

Defined by IANA and divided into categories
IANA (Internet Assigned Numbers Authority)
https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml
AsN (autonomous system number)
32-bit numbers as a single decimal number
http://bgp.he.net

https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml


### Well-known ports (0 - 1023)
RFC 1060
related to the common protocols that are at the core of the Transport Control Protocol/Internet Protocol (TCP/IP) model, Domain Name Service (DNS), Simple Mail Transfer Protocol (SMTP), etc.

### Registered ports (1024 – 49151)

	often associated with proprietary applications from vendors and developers. While they are officially approved by the Internet Assigned Numbers Authority (IANA), in practice many vendors simply implement a port of their choosing. Examples include Remote Authentication Dial-In User Service (RADIUS) authentication (1812), Microsoft SQL Server (1433/1434) and the Docker REST API (2375/2376).

### Dynamic / Ephimeral / private ports (49152 – 65535)
	Whenever a service is requested that is associated with well-known or registered ports, those services will respond with a dynamic port that is used for that session and then released.














## Windows

Get-Process -Id (Get-NetTCPConnection -LocalPort YourPortNumberHere).OwningProcess
Get-Process -Id (Get-NetUDPEndpoint -LocalPort YourPortNumberHere).OwningProcess



### List open ports / Check if port is open

```powershell
tnc HOST_NAME -port PORT_NUMBER
Test-NetConnection -Port 9090
# Example test if port 9000 is opened in current computer 
Test-NetConnection -ComputerName ([System.Environment]::MachineName) -Port 9000
tnc ([System.Environment]::MachineName) -Port 9000

New-Object System.Net.Sockets.TcpClient([URL], 443)
New-Object System.Net.Sockets.TcpClient("www.shellhacks.com", 443)



# Check open ports on multiple hosts
S C:\> @"
        # List of hosts and ports to check
        www.shellhacks.com:443
        8.8.8.8:53
        8.8.4.4:53
        "@.split("`n") | ForEach-Object {
            $server,$port = $_.split(':')
            echo "Host: $_"
            New-Object System.Net.Sockets.TcpClient("$server", $port) | 
            Out-String -Stream | Select-String "Connected"
        }

```





### PowerShell: .NET Framework's System.Net.Sockets class
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
















## Linux

### lsof

```
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

```






### macOS

```

# live view of network activity
nettop


# monitor network connections and displays the associated processes
sudo dtrace -n 'syscall::connect*:entry { printf("%s[%d] connects to %s\n", execname, pid, copyinstr(arg0)); }'
sudo networksetup -listallhardwareports


```























