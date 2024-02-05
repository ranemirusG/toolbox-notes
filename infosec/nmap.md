# NMAP


## First scan
```
# Create a nmap dir in the project and save the output in a file there
mkdir ./nmap
nmap -sC -sV -oN nmap/initial [IP]
```

### Commands and flags for first scan
nmap -sC -sV -oN nmap/initial [IP]
nmap -sS -sV -A -O -Pn [IP]
nmap -T4 -A -p- [IP]

















https://www.ninjaone.com/blog/how-to-use-nmap-complete-guide-with-examples/
https://www.welivesecurity.com/la-es/2023/06/14/auditando-nmap-scripts-escanear-vulnerabilidades/
https://www.freecodecamp.org/news/what-is-nmap-and-how-to-use-it-a-tutorial-for-the-greatest-scanning-tool-of-all-time/

https://nmap.org/nsedoc/scripts/http-wordpress-enum.html

###switches ----> flags

-h
Print a help summary page

-sS
Perform a TCP SYN scan

-sU
Perform a UDP scan

-sC


-sV
Probe open ports to determine service/version info

-O
Enable OS detection

-A
if we don't care about how loud we are, we can enable "aggressive" mode.


-Pn ----> tells Nmap to not bother pinging the host before scanning it
	The following switches are of particular note:
	-f:- Used to fragment the packets (i.e. split them into smaller pieces) making it less likely that the packets will be detected by a firewall or IDS.
	An alternative to -f, but providing more control over the size of the packets: --mtu <number>, accepts a maximum transmission unit size to use for the packets sent. This must be a multiple of 8.
	--scan-delay <time>ms:- used to add a delay between packets sent. This is very useful if the network is unstable, but also for evading any time-based firewall/IDS triggers which may be in place.
	--badsum:- this is used to generate in invalid checksum for packets. Any real TCP/IP stack would drop this packet, however, firewalls may potentially respond automatically, without bothering to check the checksum of the packet. As such, this switch can be used to determine the presence of a firewall/IDS.
	

-oA
save results in three major formats: “normal”, XML and grepable formats. However you can specify the format of your choice with :
	-oN: Redirect normal output to a given filename
	-oX: Produce output in a clean, XML format and store it in a given file
	-oG: Produce “grepable” output and store it to a file. Deprecated format as users are now moving towards XML outputs.

-A
Enables “aggressive” scanning. Presently this enables OS detection (-O), version scanning (-sV), script scanning (-sC) and traceroute (–traceroute)

-p
Specify the ports to scan. It can be a single port as well as a range of ports. For Example :
nmap -p 80 127.0.0.0.1: This scans port 80 on localhost
nmap -p 1-100 127.0.0.1: This scans ports from 1 to 100 on localhost
nmap -p- 127.0.0.1: This scans all the ports on the localhost



	
	
	
	
	
	


nmap -sS -Pn -T4 -p 0–999 <ip>
With -sS being a stealth scan (which avoid the 3 part handshake to avoid detection, which is great for a quick port scan).-Pn disables ping and only scans for open ports, again to avoid detection. -T4 slightly quickens the scan, although it is a bit more agressive.

nmap -A -Pn -T4 -p21,80,2222 <ip>
Now we know about port 21, 80 and 2222 we can get more info on them by using the -A flag
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
###Tipos de escaneo:

SYN scans are the default scans used by Nmap if run with sudo permissions.
If run without sudo permissions, Nmap defaults to the TCP Connect scan

UDP scans tend to be incredibly slow in comparison to the various TCP scans (in the region of 20 minutes to scan the first 1000 ports, with a good connection). For this reason it's usually good practice to run an Nmap scan with --top-ports <number> enabled. For example, scanning with  nmap -sU --top-ports 20 <target>. Will scan the top 20 most commonly used UDP ports, resulting in a much more acceptable scan time.

NULL, FIN and Xmas scans generally used for FIREWALL EVASION
	Microsoft Windows may respond to a NULL, FIN or Xmas scan with a RST for every port
 



ICMP Network scanning / ping sweep
On first connection to a target network in a black box assignment, our first objective is to obtain a "map" of the network structure -- or, in other words, we want to see which IP addresses contain active hosts, and which do not.
One way to do this is by using Nmap to perform a so called "ping sweep". This is exactly as the name suggests: Nmap sends an ICMP packet to each possible IP address for the specified network. When it receives a response, it marks the IP address that responded as being alive. For reasons we'll see in a later task, this is not always accurate; however, it can provide something of a baseline and thus is worth covering.
To perform a ping sweep, we use the -sn switch in conjunction with IP ranges which can be specified with either a hypen (-) or CIDR notation. i.e. we could scan the 192.168.0.x network using:
`nmap -sn 192.168.0.1-254`
or
`nmap -sn 192.168.0.0/24`


The -sn switch tells Nmap not to scan any ports -- forcing it to rely primarily on ICMP echo packets (or ARP requests on a local network, if run with sudo or directly as the root user) to identify targets. In addition to the ICMP echo requests, the -sn switch will also cause nmap to send a TCP SYN packet to port 443 of the target, as well as a TCP ACK (or TCP SYN if not run as root) packet to port 80 of the target.


How would you perform a ping sweep on the 172.16.x.x network (Netmask: 255.255.0.0) using Nmap? (CIDR notation)
	Hint: The CIDR notation for a Class B network with a default netmask is /16
	Answer: `nmap -sn 172.16.0.0/16`





firewall, block all ICMP packets


	
### Scripting
Nmap Scripting Engine (NSE) in Lua	

Nmap stores its scripts on Linux at /usr/share/nmap/scripts

2 maneras de buscar
`grep "ftp" /usr/share/nmap/scripts/script.db`
`ls -l /usr/share/nmap/scripts/*ftp*`











Puertos TCP y UDP
◦ Clasificación (IANA)
▫ Oficiales
▫ No oficiales
▫ Usos múltiples
■ Oficiales y no oficiales
◦ Rangos
▫ 0 – 1023: bien conocidos
▫ 1024 – 49151: registrados
▫ 49152 – 65535: efímeros
◦ Estados
▫ Abierto: El equipo acepta conexiones a ese puerto
▫ Filtrado: Un dispositivo enmascara el puerto, no se sabe 
con certeza si está abierto
▫ No filtrado: El puerto está cerrado y ningún dispositivo 
interfiere con el escaneo


Tipos de escaneo:

ACK ----> detectar firewalls y mapear sus reglas
IDLE ----> utilizar IP falsa
IP protocol ----> enviar cabeceras IP  (nivel capa 3)
SCTP INIT





proceso:

sistemas activos
puertos abiertos
fingerprinting y banner grabbing https://en.wikipedia.org/wiki/Banner_grabbing
	identificacion de atributos
	metodo pasivo: sigiloso y menos preciso
	metodo activo: facilmente detectable por un IDS ---->VER IDS ???
	
	OS Fingerprinting
		analiza las implementaciones de protocolos TCP-IP y DHCP
		analiza las respuestas de otros protocolos de capa 7
		
		
	

Tecnicas:
	IP Spoofing
	
	
paquetes smp ----> ping, protocolo de diagnostico para ver equipos activos
Técnicas utilizadas
▫ ARP Ping: solo para LAN ethernet
▫ IP Protocol: paquete IP con distinto número de protocolo
▫ ICMP Ping: envío de echo request, timestamp o netmask
▫ TCP Ping: SYN o ACK a puertos TCP determinados
▫ UDP Ping: conexión a puertos UDP determinados
▫ SCTP Ping: envío de paquete INIT con un chunk mínimo


