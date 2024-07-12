# tcpdump


Packet analyzer that captures and displays network packets.



https://www.tcpdump.org/manpages/tcpdump.1.html

https://github.com/the-tcpdump-group/tcpdump



`-A` parameter that displays the packet contents in ASCII


## Commands

```
# list of available interfaces
tcpdump -D


# To start capturing on a specific interface
tcpdump -i [interface]
tcpdump -i en0
sudo tcpdump -i tun0 port 389

# To capture all network traffic on a specific interface
sudo tcpdump -i <interface_name>
sudo tcpdump ip proto \\icmp -i tun0

# quit after capturing x  number of packets
-c [number]
## Example:
sudo tcpdump -c 5 src port 443 and dst [IP] 


# Sometimes, having addresses and ports resolved to names can be annoying if you are processing the capture file through a script or a series of commands – to turn this off, use the -n option








# filter by source or destination host
tcpdump src [ip-address]
tcpdump dst [ip-address]

# filter by port
tcpdump dst port 25

# filter by protocol
tcpdump ftp








# Save capture
tcpdump -w out.pcap

```
















### Read and analize files

```
tcpdump -r capture.pcap
tcpdump -vvv -r capture.pcap

# Filter only tcp packets
tcpdump -r capture.pcap tcp




# Count packets
# How many udp packets have been captured?
tcpdump -r [FILE] udp | wc -l
tcpdump -r [FILE] udp --count

# How many packets have a TTL value of 38?
tcpdump -v -r SBT-PCAP4.pcap | grep “ttl 38” | wc -l
## or using packet header bytes
tcpdump ip[8] == 38 -r SBT-PCAP4.pcap --count






# Flags

+-+-+-+-+-+-+-+-+
|C|E|U|A|P|R|S|F|
|W|C|R|C|S|S|Y|I|
|R|E|G|K|H|T|N|N|
+-+-+-+-+-+-+-+-+


## Example: packets with the PSH and ACK flags set, the decimal value becomes 00011000 = 24
tcpdump -r [file.pcap] "tcp[tcpflags] == 24"
tcpdump -r SBT-PCAP4.pcap 'tcp[tcpflags] & (tcp-syn|tcp-ack) == (tcp-syn|tcp-ack)' | wc -l






```






### Specifying packet header bytes

You can specify any byte in the packet header by using its index. For example, let’s suppose that we want to display only ICMP Echo Request packets. We know that echo requests have an ICMP type of 8. Since the type field in an ICMP header is the first byte, byte 0 (index is counted from 0) of the ICMP header should have a value of 8 (or 00001000 in binary). From this, we can construct our expression as icmp[0] == 8. The same applies for other protocol headers and values, such as ip[8] for the TTL.

Note that you can sometimes replace the byte index with the name of the field that you are specifying. For example, icmp[0] could be replaced with icmp[icmptype]. 

There are many other useful features in TCPDump, such as:

-A to display packet contents in ASCII
-x to print the hex dump of the packet
-X to print both of the above, and
t, -tt, -ttt, -tttt, -ttttt to manage timestamps