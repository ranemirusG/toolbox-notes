# DNS Protocol

Default Port: 53

DNS operates on TCP and UDP ports 53 and uses relational databases to convert human-readable hostnames and domain names (such as Google.com) into their respective IP addresses so that communications can be sent to and from these hosts. The reason we use domain names is that they’re easy to remember. You remember securityblue.team, but you probably won’t remember 3.9.68.12!



- <https://howdns.works/>
- <https://howdnssec.works/>
















## DNS Zone Transfer

Is a mechanism used in DNS (Domain Name System) to replicate DNS zone data between DNS servers.


Zone files

In certain cases, internal network addresses may be found on an organization's DNS servers.

- <https://digi.ninja/projects/zonetransferme.php>




## Commands

```powershell
Get-DnsClientServerAddress


# Change DNS Server ADdress
Set-DnsClientServerAddress -InterfaceAlias "[ADAPTER NAME]" -ServerAddresses ("8.8.8.8", "8.8.4.4")

```