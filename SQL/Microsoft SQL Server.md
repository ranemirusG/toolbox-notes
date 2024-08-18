# Microsoft SQL Server (MSSQL)

Default port: 1433


Is a database management system that natively integrates into the Windows ecosystem.

A built-in command-line tool named `SQLCMD` allows SQL queries to be run through the Windows command prompt or even remotely from another machine.


## Resources
- <https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-tds/893fcc7e-8a39-4b3c-815a-
773b7b982c50/>
- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-mssql-microsoft-sql-server>
- <https://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet>










## Impacket
- <https://github.com/SecureAuthCorp/impacket>

Kali Linux includes `Impacket`, a Python framework that enables network protocol interactions. Among many other protocols, it supports Tabular Data Stream (TDS), the protocol adopted by MSSQL that is implemented in the `impacket-mssqlclient` tool.

We can run `impacket-mssqlclient` to connect to the remote Windows machine running MSSQL by providing a username, a password, and the remote IP, together with the `-windows-auth` keyword. This forces NTLM authentication (as opposed to Kerberos).
```
impacket-mssqlclient [USER]:[PASSWORD]@[IP] -windows-auth
```


MSSQL has a system stored procedure to execute operating system commands: `xp_cmdshell`, which takes a string and passes it to a command shell for execution. The function returns any output as rows of text.
This stored procedure is disable by default, but can be enabled remotely if the user has sufficient permissions.
Once enabled, it must be called with the EXECUTE keyword instead of SELECT.


- <https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/xp-cmdshell-transact-
sql?view=sql-server-ver15>





## Commands

When using a SQL Server command line tool like `sqlcmd`, we must submit our SQL statement ending with a `;` followed by `GO` on a separate line. However, when running the command remotely, we can omit the `GO` statement since it's not part of the MSSQL TDS protocol.




```
# inspect the current version of the underlying operating system8
SELECT @@version;


# To list all the available databases, we can select all names from the system catalog.
# master, tempdb, model  and msdb are default databases
SELECT name FROM sys.databases;


# review database by querying the tables table in the corresponding information_schema
SELECT * FROM [DATABASE NAME].information_schema.tables;


select * from offsec.dbo.users;
select * from master.dbo.sysusers;


```




`dbo` stands for DataBase Owner.
Microsoft introduced schema in version 2005. For those who didn’t know about schema, and those who didn’t care, objects were put into a default schema `dbo`.

See:

- <https://stackoverflow.com/questions/1062075/why-do-table-names-in-sql-server-start-with-dbo>










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