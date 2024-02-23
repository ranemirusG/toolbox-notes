# Escaneo y enumeracion


- barrido de recursos con formato conocido
- identifacion de elementos en un determinado recurso
- direcciones IP activas


## Reconnaisance
whois
nslookup / dig
https://dnsdumpster.com/
https://shodan.io/





HTTP sends and receives data as cleartext (not encrypted); therefore, you can use a simple tool, such as Telnet (or Netcat), to communicate with a web server and act as a “web browser”. The key difference is that you need to input the HTTP-related commands instead of the web browser doing that for you.

```
telnet $IP PORT
GET / HTTP/1.1
host: telnet
```

```
nc $IP PORT
GET / HTTP/1.1
host: netcat
```

## banner grabbing
dmitry -p -b $IP
dmitry -p -b HOST


## Scanning
Which systems are up?
What services are running on these systems?

nmap
arp-scan
masscan





## Content Discovery

- find out about files and directories on the server

/robots.txt (see <http://www.robotstxt.org/robotstxt.html>)
/.well-known/
/README.txt


dirsearch
dirbuster
gobuster
	`gobuster dir -u http://$IP -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,sh,txt,cgi,html,js,css,py`
nikto
	`nikto -h http://$IP | tee nikto.log`
    `nikto -host $IP -output out.txt -port 80`
ffuf
    `ffuf -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt -H "Host: FUZZ.example.com" -u http://[IP] -fc 302`

dirb

https://github.com/aboul3la/Sublist3r # OSINT

















## Subdomain enumeration

## SSL/TLS Certificates
When an SSL/TLS (Secure Sockets Layer/Transport Layer Security) certificate is created for a domain by a CA (Certificate Authority), CA's take part in what's called "Certificate Transparency (CT) logs". These are publicly accessible logs of every SSL/TLS certificate created for a domain name. The purpose of Certificate Transparency logs is to stop malicious and accidentally made certificates from being used. We can use this service to our advantage to discover subdomains belonging to a domain, sites like https://crt.sh and https://ui.ctsearch.entrust.com/ui/ctsearchui offer a searchable database of certificates that shows current and historical results.

## DNS Brute force
dnsrecon


## Virtual Hosts
Some subdomains aren't always hosted in publically accessible DNS results, such as development versions of a web application or administration portals. Instead, the DNS record could be kept on a private DNS server or recorded on the developer's machines in their /etc/hosts file (or c:\windows\system32\drivers\etc\hosts file for Windows users) which maps domain names to IP addresses. 
Because web servers can host multiple websites from one server when a website is requested from a client, the server knows which website the client wants from the Host header. We can utilise this host header by making changes to it and monitoring the response to see if we've discovered a new website.

`user@machine$ ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.93.140`
The above command uses the -w switch to specify the wordlist we are going to use. The -H switch adds/edits a header (in this instance, the Host header), we have the FUZZ keyword in the space where a subdomain would normally go, and this is where we will try all the options from the wordlist.

Because the above command will always produce a valid result, we need to filter the output. We can do this by using the page size result with the -fs switch. Edit the below command replacing {size} with the most occurring size value from the previous result and try it on the AttackBox.
ffuf
`user@machine$ ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://10.10.93.140 -fs {size}`
This command has a similar syntax to the first apart from the -fs switch, which tells ffuf to ignore any results that are of the specified size.

The above command should have revealed two positive results that we haven't come across before.




# Webinar Carlos Alonso
http server  documentation (apache)
host virtual:  mas de un sitio web en una maquina
	basado en nombre
	basado en IP

`host -v -t NS [website]`

#transferencia de zona
host -l -a 
host -v [website]
#reverse dns
dig -x [ip obtenido de host] @[name server]



google hacking
site:www.dw.com -www.dw.com
save result page as html

`w3m [file.html] > file.txt`

#ejemplo con dw.com
`grep -i \.dw.com dw.txt | grep https | cut -d " " -f 1 | sort | unique``

- buscar certificados digital <https://crt.sh>



#ejemplo con dw.com
- `sudo nmap -n -Pn --script hhtp-vhosts -p443 www.dw.com``












