# IP

Show settings, troubleshooting, etc.




## Get my public IP

Historically, DNS services (Akamai, Google Public DNS, OpenDNS, ..) tend to survive much longer and are more stable, more scalable, and generally more looked-after than whatever new hip whatismyip dot-com HTTP service is hot today.

```
nslookup myip.opendns.com. resolver1.opendns.com
dig +short myip.opendns.com @resolver1.opendns.com
```



Using cURL:
```
curl [any of the following sites]:

- checkip.amazonaws.com
- ifconfig.me
- myexternalip.com/raw
- ipecho.net/plain
- ifcfg.me
- icanhazip.com
- https://ipinfo.io/ip
- https://whatismyipaddress.com
- https://ip4.me/
- https://cualesmiip.com
- https://ifconfig.me
- https://www.arin.net/ (nice detail in the top bar)

```


More options:
```powershell
Invoke-WebRequest ifconfig.me/ip
(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
(Invoke-WebRequest -UseBasicParsing -URI ifconfig.me).Content
```







## Windows

https://answers.microsoft.com/en-us/windows/forum/all/i-believe-ive-been-ip-banned-how-can-i-fix-this/9f6dd98c-ad9c-4f0f-9a68-eff4f360551a


```powershell
ipconfig
ipconfig /all
Get-NetIPConfiguration


Get-NetTCPSetting
Get-NetTCPConnection


```



## Linux

```
ip addr show | grep 'inet ' | awk '{print $2}' | cut -d/ -f1

ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1

hostname -I





# information about the network interfaces and their IP addresses configured on a device 
ip
ip addr
ip addr show tun0


ifconfig
ifconfig -a

ifconfig -s
netstat -i

iwconfig # Wireless





# administration tool for IPv4/IPv6 packet filtering and NAT
iptables	

# list all rules
sudo iptables -L -v -n


```
