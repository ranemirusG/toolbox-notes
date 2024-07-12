# TELNET

Default port: 23
Other ports: 2323

application protocol

used to connect to a virtual terminal of another computer


From a security perspective, telnet sends all the data, including usernames and passwords, in cleartext. Sending in cleartext makes it easy for anyone, who has access to the communication channel, to steal the login credentials. The secure alternative is SSH (Secure SHell) protocol.
Knowing that telnet client relies on the TCP protocol, you can use Telnet to connect to any service and grab its banner.


It can be user for troubleshooting by adding a port number
`telnet server01 25`

*Note that both telnet and Test-NetConnection are primarily used to check connectivity to a specific port on a remote host. They are not 
exhaustive port scanners like dedicated tools such as Nmap, but they can be useful for basic port testing.*