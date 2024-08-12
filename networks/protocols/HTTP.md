# HTTP

Port 80

HTTP allows clients (browsers such as Chrome and Firefox) to connect to web servers and request content, which appears in the form of file downloads, web pages, and streaming services. So if you want to view the securityblue.team homepage, your browser will make an HTTP request to our web server, requesting to download the HTML web page. The server will respond with a 200 status code (which means “OK”, it has been successful) and then send the HTML page to the client, so you can view it on your screen. As HTTP is not encrypted, it is possible to conduct sniffing attacks, and see cleartext data as it is transmitted between the client and the server, such as passwords.



https://en.wikipedia.org/wiki/WebDAV


## Status codes

Informational responses (100 – 199)
Successful responses (200 – 299)
Redirection messages (300 – 399)
Client error responses (400 – 499)
Server error responses (500 – 599)


## HTTP File Serves (HFS)
Is a web server that is designed for file & document sharing. Typically run on TCP port 80 and utilize the HTTP protocol for underlying communication.

Rejetto HFS is a popular free and open source HTTP file server that can be setup on both Windows and Linux.

Rejetto HFS V2.3 is vulnerable to a remote command execution attack.



