# Wireshark


## "Getting our bearings"

Go to `Statistics > Endpoints` to check the Endpoints table to get a feel for what IP addresses may be involved. 

## Statistics
helpful in certain scenarios, such as finding potential exfiltration vectors and identifying the exfiltrating host based on network usage.

If a host has been transmitting many packets and bytes to an unidentified IP address without receiving many packets in return, an exfiltration could have been occurring.


- Protocol Hierarchy
	 identify data exfiltration through unusual or unused protocols
- Conversations
	 identifying the different MAC or IP addresses that a host has communicated with, and the volume of traffic between them

- Endpoints
	useful in sorting hosts by their network activity, by either transmission or receiving volume, or by both.
	You can switch to other protocols, such as TCP to have traffic sorted by ports and Ethernet to have traffic sorted by MAC addresses. Same with all other statistics windows, you can right-click on a host to apply it as a filter.


## Follow streams

To follow a stream, right click on a packet within the stream, and click `Follow > TCP/UDP/SSL/HTTP Stream`





## Filters







How many DNS query response packets were captured?
dns.flags.response == true
dns.flags.response == 1














frame.number == 2808











### get logins
```
urlencoded-form.key == "username"
```



```
ip.addr == [IP]
tcp and ip.addr == [IP]

tcp.port == [PORT] && ip.dst == [DESTINATION IP]

# Example: display TCP packets addressed to 192.168.1.7
ip.dst_host == 192.168.1.7 && tcp

tcp contains [string]
(example `tcp contains stackoverflow`)
```


### Exclude
```
not ftp



```


display either NTP traffic or UDP traffic from/to port 20000
ntp or udp.port == 20000





https://stackoverflow.com/questions/18375458/how-to-see-webpage-content-as-a-whole-sent-to-user-with-wireshark
`http && (media || data-text-lines)`




`tcp.window_size_value >= 8000` displays TCP packets with a window size of 8000 bytes or over. 

























## Tshark (CLI)