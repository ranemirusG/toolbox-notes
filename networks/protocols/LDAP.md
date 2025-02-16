# LDAP (Lightweight Directory Access Protocol)

Default Port: tcp/389 and udp/389, 636 (LDAPS)

Is an open, vendor-neutral, industry standard application protocol for accessing and maintaining distributed directory information services over the Internet or a Network.

Used for reading and writing directories over an IP network.

X.500 speficication by International Telecommunications Union (ITU) - the know directories!

attribute=value
Most specific attribute is listed first

## Attributes
- CN (Common Name: identifies the person or object)
- OU (Organizational Unit: unit/department within the organization)
- O (Organization)
- L (Locality: city or area)
- ST (state)
- C (Country)
- DC (Domain Component: components of the object's domain)
...

## LDAPS (LDAP over SSL/TLS)
port tcp/636



## Resources
- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-ldap>




## Tools


### ldapsearch
```
ldapsearch -x -H ldap://support.htb -D 'support\ldap' -w '	' -b 'CN=Users,DC=support,DC=htb' | tee ldapsearch.log
```