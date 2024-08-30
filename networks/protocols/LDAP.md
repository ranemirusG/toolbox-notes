# LDAP (Lightweight Directory Access Protocol)

is an open, vendor-neutral, industry standard application protocol for accessing and maintaining distributed directory information services over the Internet or a Network.

Default Port: 389, 636 (LDAPS)



## Resources
- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-ldap>




## Tools


### ldapsearch
```
ldapsearch -x -H ldap://support.htb -D 'support\ldap' -w '	' -b 'CN=Users,DC=support,DC=htb' | tee ldapsearch.log
```