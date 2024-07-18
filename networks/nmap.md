# NMAP

## Resources
- < https://www.ninjaone.com/blog/how-to-use-nmap-complete-guide-with-examples>
- < https://www.welivesecurity.com/la-es/2023/06/14/auditando-nmap-scripts-escanear-vulnerabilidades/>
- https://www.freecodecamp.org/news/what-is-nmap-and-how-to-use-it-a-tutorial-for-the-greatest-scanning-tool-of-all-time/
- <https://nmap.org/nsedoc/scripts/http-wordpress-enum.html>

- <https://www.hackthebox.com/blog/nmap-commands?utm_campaign=Blog+-Oktopost&utm_content=https%3A%2F%2Fwww.linkedin.com%2Ffeed%2Fupdate%2Furn%3Ali%3Ashare%3A7173369684346429441&utm_medium=social&utm_source=LinkedIn&utm_term=Blog>





## Tips
```
# Create a nmap dir in the project and save the output in a file there
mkdir ./nmap
nmap -sC -sV -oN nmap/initial $IP
```

`-oA [output filename]-[date]`
Add the date to the output file maybe a good idea.
Or maybe the ip, like: `10.11.1.1-254`
Command example: `-oA scans/${ip}-$(date +%Y-%m-%d_%H-%M-%S)`

Save results in three major formats: “normal”, XML and grepable formats. However you can specify the format of your choice with :
	-oN: Redirect normal output to a given filename
	-oX: Produce output in a clean, XML format and store it in a given file
	-oG: Produce “grepable” output and store it to a file. Deprecated format as users are now moving towards XML outputs.

Note: A fourth format is script kiddie (don't use that, it's basically a joke)


`-v` has several levels of verbosity

`--reason` provide more details regarding Nmap's reasoning and conclusions

`-d` for debugging details or `-dd` for even more details





### @7h3h4ckv157
A small reminder: 
Don't forget to enumerate UDP services, while you're Pentesting a Network! 
`sudo nmap -sU -T4 <TARGET>`
























## Snippets




### Default Scan

Default scan: `[sudo] nmap $IP`
If no alternative flag is specified in the command syntax, nmap will scan the most common 1000 TCP ports for active services.

- Example:
	`nmap scanme.nmap.org/24`
	`nmap 64.13.134.52/24`
	`nmap 64.13.134.-`
	`nmap 64.13.134.0-255`
	These four commands all ask Nmap to scan the 256 IP addresses from 64.13.134.0 through 64.13.134.255. In other words, they ask to scan the class C sized address space surrounding scanme.nmap.org.








### First Scan
Enumerate targets, discover live hosts, and use reverse-DNS to find interesting names


Enumerate every IP address in the given target netblock(s) and does a reverse-DNS lookup (unless -n was specified) on each. One reason to do this first is stealth. The names of the hosts can hint at potential vulnerabilities and allow for a better understanding of the target network, all without raising alarm bells.

`--scan-delay <time>ms`: used to add a delay between packets sent. This is very useful if the network is unstable, but also for evading any time-based firewall/IDS triggers which may be in place.


```
nmap -sL $IP
nmap -sL 6.209.24.0/24 6.207.0.0/22
nmap -n -sL $IP

```



Host Discovery
Discover online hosts without port-scanning the live systems
Add `-sn` if you are only interested in host discovery without port-scanning. Omitting -sn will let Nmap default to port-scanning the live hosts.

Note: in previous releases of Nmap, `-sn` was known as `-sP`.


```
nmap -sn TARGETS

# Host Discovery using ICMP
echo request, timestamp or netmask
Many firewalls block ICMP

# Use ICMP echo request to discover live hosts
`nmap -PE -sn TARGETS`

# Use ICMP timestamp requests 
`nmap -PP -sn MACHINE_IP/24` 

# Use address mask queries
`nmap -PM -sn TARGETS`


# Host Discovery using TCP and UDP

# TCP SYN ping (doesn't require a privileged account)
`nmap -PS21 -sn TARGET`
`nmap -PS21-25 TARGET`
`nmap -PS80,443,8080 TARGET`

# TCP ACK ping (requires a privileged account)
`nmap -PA TARGET`

# UDP ping
Contrary to TCP SYN ping, sending a UDP packet to an open port is not expected to lead to any reply. However, if we send a UDP packet to a closed UDP port, we expect to get an ICMP port unreachable packet; this indicates that the target system is up and available. So it's a way to trigger a response indirectly indicating that the target is online.

`sudo nmap -PU53,161,162 -sn MACHINE_IP/30`

```



Users can skip the ping step entirely with a list scan (-sL) or by disabling ping (-Pn)
`-Pn`: tells Nmap to not bother pinging the host before scanning it



### More useful snippets

#### First and second
```
# 1
sudo nmap -sS -p- --open --min-rate 5000 -n -Pn $ip -oN all_ports.txt
# example output: 22 and 80 are open

# 2
nmap -p22,80 -sCV -n $ip -oN info_ports.txt

```



```
nmap -p- --open --min-rate 5000 -n -Pn -sS -vvv [IP]


nmap -p- -sS -sC -sV --min-rate 5000 -n -vvv -Pn [IP]

nmap -p- --min-rate 1000 -sV $ip
nmap -sC -sV -oN output.txt $IP
sudo nmap -Pn -p- --min-rate 2000 -sC -sV -oN nmap-scan.txt $ip
sudo nmap -sN -T4 $IP
nmap -sS -Pn -T4 -F $IP
sudo nmap -T4 $IP
sudo nmap -Pn -p- --min-rate 2000 -sC -sV -oN nmap-scan.txt [IP]

# Quick scan all ports:
sudo nmap -sU --min-rate 5000 -p- [IP]
nmap -p- --min-rate 1000 -sV [IP]
nmap -sS -p- -oN all-ports.txt $IP
```


More aggresive:

`-A`: if we don't care about how loud we are, we can enable "aggressive" mode. This is equivalent to `-sV -O -sC --traceroute`.

```
nmap -sS -sV -A -O -Pn $IP
nmap -T4 -A -p- $IP
nmap -A -p- -vv $IP
nmap -Pn -sC -sV -oA tcp -p- -T4 -vvvvv --reason $IP
```























### Second Scan

Run a version scan with default scripts to enumerate these ports further

```
nmap -sC -sV -p80,6379 $IP`
nmap -A -Pn -T4 -p21,80,2222 $IP
nmap -p80,22 $IP -sC

```


Service detection and OS detection

`-O` (Uppercase): OS Detection

Some ports are used by default by certain services. Others might be non-standard, which is why we will be using the service detection flag -sV to determine the name and description of the identified services.

`-sV` collect and determine service and version information for the open ports. You can control the intensity with `--version-intensity LEVEL` where the level ranges between 0, the lightest, and 9, the most complete. `-sV --version-light` has an intensity of 2, while `-sV --version-all` has an intensity of 9.

Unlike the service column, the version column is not a guess.



Note: `-sV` will force Nmap to proceed with the TCP 3-way handshake and establish the connection, because Nmap cannot discover the version without establishing a connection fully and communicating with the listening service. So Stealth SYN scan `-sS` is not possible when -sV option is chosen.



`--traceroute`























## Fine-Tuning Scope and Performance


### Select Ports to scan
`-p 80` or `-p80` (without space is the same)
`-p1-100` a range
`-p-` all 65535 ports

`-F` (fast) most common 100 ports

`--top-ports 10`
`--exclude $IP`


### Select source port
`--source-port PORT_NUM`


### Timing
`-T0` is the slowest (paranoid), while `-T5` (insanme) is the fastest.

If you don’t specify any timing, Nmap uses normal -T3

To avoid IDS alerts, you might consider -T0 or -T1

Use --min-rate and --max-rate together to keep the rate inside a certain range.


### Control packet rate and parallelization

`--min-rate`
`--max-rate 10` or `--max-rate=10`

--max-parallelism <numprobes>

























## Scripting
Nmap Scripting Engine (NSE) in Lua	

Ways of searching in Kali Linux:
- `grep "ftp" /usr/share/nmap/scripts/script.db`
- `ls -l /usr/share/nmap/scripts/*ftp*`

`-sC` use defaults scripts (same as `--script=default`). See: <https://nmap.org/nsedoc/categories/default.html>

Categories examples:
`--script=safe`
`--script=discovery`
and so on...

#### Specify script by name
`--script "SCRIPT-NAME"`

#### Specify script by pattern
`--script "ftp*"`

























## Firewalls 

Evasion Approach								Nmap Argument
======= ========								==== ========
Hide a scan with decoys							-D DECOY1_IP1,DECOY_IP2,ME
Hide a scan with random decoys					-D RND,RND,ME
Use an HTTP/SOCKS4 proxy to relay connections	--proxies PROXY_URL
Spoof source MAC address						--spoof-mac MAC_ADDRESS
Spoof source IP address							-S IP_ADDRESS
Use a specific source port number				-g PORT_NUM or --source-port PORT_NUM

Fragment IP data into 8 bytes					-f
Fragment IP data into 16 bytes					-ff
Fragment packets with given MTU					--mtu VALUE
Specify packet length							--data-length NUM

Set IP time-to-live field						--ttl VALUE
Send packets with specified IP options			--ip-options OPTIONS
Send packets with a wrong TCP/UDP checksum		--badsum




--scan-delay <time>ms:- used to add a delay between packets sent. This is very useful if the network is unstable, but also for evading any time-based firewall/IDS triggers which may be in place.

--badsum:- this is used to generate in invalid checksum for packets. Any real TCP/IP stack would drop this packet, however, firewalls may potentially respond automatically, without bothering to check the checksum of the packet. As such, this switch can be used to determine the presence of a firewall/IDS.

















## Scan types

### TCP Connect Scan

Note: if you are not a privileged user (root or sudoer), a TCP connect scan is the only possible option to discover open TCP ports.

Completes the three-way-handshake

`nmap -sT TARGET`

Also the `-r` option can also be added to scan the ports in consecutive order instead of random order. This option is useful when testing whether ports open in a consistent manner, for instance, when a target boots up.


En Wireshark:
`tcp.flags.syn==1 and tcp.flags.ack==0`


### TCP SYN Scan

TCP SYN scan is the default scan mode when running Nmap as a privileged user

No need to complete the TCP 3-way handshake; instead, it tears down the connection once it receives a response from the server.

`nmap -sS TARGET` Because a TCP connection is not stablished, this decreases the chances of the scan being logged.



### UDP Scan
UDP port scan takes longer than TCP port scans. 

`nmap -sU TARGET`

We expect to get an ICMP packet of type 3, destination unreachable, and code 3, port unreachable. In other words, the UDP ports that don’t generate any response are the ones that Nmap will state as open.


En Wireshark:

"icmp.type == 3": This filter matches ICMP packets based on the ICMP type field. ICMP type 3 represents the Destination Unreachable message.

"icmp.code == 3": This filter matches ICMP packets based on the ICMP code field. ICMP code 3 is a specific code value within the Destination Unreachable message type.



## Advanced Scans

Null, FIN and Xmas:
- These three scan types can be efficient is when scanning a target behind a stateless (non-stateful) firewall. A stateless firewall will check if the incoming packet has the SYN flag set to detect a connection attempt. Using a flag combination that does not match the SYN packet makes it possible to deceive the firewall and reach the system behind it. However, a stateful firewall will practically block all such crafted packets and render this kind of scan useless.

### Null Scan
Does not set any flag; all six flag bits are set to zero.

A TCP packet with no flags set will not trigger any response when it reaches 

an open port, so a lack of reply in a null scan indicates that either the port is open or a firewall is blocking the packet.

`sudo nmap -sN TARGET`


### FIN Scan
Sends a TCP packet with the FIN flag set.

The target system should respond with an RST if the port is closed.

Some firewalls will 'silently' drop the traffic without sending an RST.

`sudo nmap -sF TARGET`


### Xmas Scan
Sets the FIN, PSH, and URG.

Like the Null scan and FIN scan, if an RST packet is received, it means that the port is closed. Otherwise, it will be reported as open|filtered.

`sudo nmap -sX TARGET`


### TCP ACK Scan
The target would respond to the ACK with RST regardless of the state of the port

`sudo nmap -sA TARGET`

This kind of scan would be helpful if there is a firewall in front of the target. Consequently, based on which ACK packets resulted in responses, you will learn WHICH PORTS WERE NOT BLOCKED by the firewall. In other words, this type of scan is more suitable to discover firewall rule sets and configuration.

There is a possibility that the firewall rules need to be updated to reflect recent service changes. Hence, ACK and window scans are exposing the firewall rules, not the services.


### Window Scan
Is almost the same as the ACK scan; however, it examines the TCP Window field of the RST packets returned.

Also helpful if there is a firewall.

`sudo nmap -sW TARGET`


### Custom Scan
Ex: `--scanflags RSTSYNFIN`


### Spoofing

WORKS ONLY IF YOUR SYSTEM IS ON THE SAME NETWORK SEGMENT AS THE TARGET HOST.
OTHERWISE, YOU WON’T BE ABLE TO READ THE REPLIES SENT BACK.


`sudo nmap -S SPOOFED_IP MACHINE_IP`

In general, you expect to specify the network interface using -e and to explicitly disable ping scan -Pn

`nmap -e NET_INTERFACE -Pn -S SPOOFED_IP MACHINE_IP`


1. Attacker sends a packet with a spoofed source IP address to the target machine.
2. Target machine replies to the spoofed IP address as the destination.
3. Attacker captures the replies to figure out open ports.


When you are on the same subnet as the target machine, you would be able to spoof your MAC address as well. You can specify the source MAC address using `--spoof-mac SPOOFED_MAC`.


Spoofing only works in a minimal number of cases where certain conditions are met. Therefore, the attacker might resort to using decoys to make it more challenging to be pinpointed.

### Decoy
The concept is simple, make the scan appear to be coming from many IP addresses so that the attacker’s IP address would be lost among them.

`nmap -D 10.10.0.1,10.10.0.2,ATTACKER_IP TARGET`
`nmap -D 10.10.0.1,10.10.0.2,ATTACKER_IP,RND,RND TARGET` (`RND` are assigned randomly)

You can also set Nmap to use random source IP addresses instead of explicitly specifying them. By running `nmap -sS -Pn -D RND,RND,ME -F MACHINE_IP`, Nmap will choose two random source IP addresses to use as decoys. Nmap will use new random IP addresses each time you run this command.


### Proxy
Use an HTTP/SOCKS4 proxy. Relaying the port scan via a proxy helps keep your IP address unknown to the target host. This technique allows you to keep your IP address hidden while the target logs the IP address of the proxy server. You can go this route using the Nmap option `--proxies PROXY_URL`. For example, `nmap -sS -Pn --proxies PROXY_URL -F MACHINE_IP` will send all its packets via the proxy server you specify. Note that you can chain proxies using a comma-separated list.

What do you expect the target to see as the source of the scan when you run the command `nmap -sS -Pn --proxies 10.10.13.37 MACHINE_IP`



### Idle/Zombie Scan
`nmap -sI ZOMBIE_IP TARGET`

The idle (zombie) scan requires the following three steps to discover whether a port is open:

1. Trigger the idle host to respond so that you can record the current IP ID on the idle host.
2. Send a SYN packet to a TCP port on the target. The packet should be spoofed to appear as if it was coming from the idle host (zombie) IP address.
3. Trigger the idle machine again to respond so that you can compare the new IP ID with the one received earlier.

















































# ORDENAR ESTO
############################################################


The following switches are of particular note:
	
-f:- Used to fragment the packets (i.e. split them into smaller pieces) making it less likely that the packets will be detected by a firewall or IDS.
An alternative to -f, but providing more control over the size of the packets: --mtu <number>, accepts a maximum transmission unit size to use for the packets sent. This must be a multiple of 8.


You can control the packet size as it allows you to:
	- Fragment packets, optionally with given MTU. If the firewall, or the IDS/IPS, does not reassemble the packet, it will most likely let it pass. Consequently, the target system will reassemble and process it.
	- Send packets with specific data lengths.
	
Another handy option is the -ff, limiting the IP data to 16 bytes. (One easy way to remember this is that one f is 8 bytes, but two fs are 16 bytes.) By running nmap -sS -Pn -ff -F MACHINE_IP, we expect the 24 bytes of the TCP header to be divided between two IP packets, 16 + 8, because -ff has put an upper limit of 16 bytes. 

Another neat way to fragment your packets is by setting the MTU. In Nmap, --mtu VALUE specifies the number of bytes per IP packet. In other words, the IP header size is not included. The value set for MTU must always be a multiple of 8.

Note that the Maximum Transmission Unit (MTU) indicates the maximum packet size that can pass on a certain link-layer connection. For instance, Ethernet has an MTU of 1500, meaning that the largest IP packet that can be sent over an Ethernet (link layer) connection is 1500 bytes. Please don’t confuse this MTU with the --mtu in Nmap options.

Running Nmap with --mtu 8 will be identical to -f as the IP data will be limited to 8 bytes


Generate Packets with Specific Length
In some instances, you might find out that the size of the packets is triggering the firewall or the IDS/IPS to detect and block you. If you ever find yourself in such a situation, you can make your port scanning more evasive by setting a specific length. You can set the length of data carried within the IP packet using --data-length VALUE. Again, remember that the length should be a multiple of 8.

If you run the following Nmap scan nmap -sS -Pn --data-length 64 -F MACHINE_IP, each TCP segment will be padded with random data till its length is 64 bytes. In the screenshot below, we can see that each TCP segment has a length of 64 bytes.























	


















IP Options
R to record-route.
T to record-timestamp.
U to record-route and record-timestamp.
L for loose source routing and needs to be followed by a list of IP addresses separated by space.
S for strict source routing and needs to be followed by a list of IP addresses separated by space.










