# Scanning
Which systems are up?
What services are running on these systems?

- nmap
	 search up the service version on popular vulnerability databases online to see if any vulnerability exists for the specified version
- arp-scan
- masscan
- Nessus / OpenVAS




### Security Headers

- <https://securityheaders.com/> It will analyze HTTP response headers and provide basic analysis of the target site’s security posture. We can use this to get an idea of an organization’s coding and security practices based on the results. 


### SSL Server Test
- <https://www.ssllabs.com/ssltest/> This tool analyzes a server’s SSL/TLS configuration and compares it against current best practices.




### Manually test server

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

### Banner Grabbing
dmitry -p -b $IP
dmitry -p -b HOST