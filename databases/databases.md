# Databases

## sqlite
The most common (and simplest) format of flat-file database is an sqlite database.

we can see the tables in the database by using the .tables command

First let's use `PRAGMA table_info(customers)`; to see the table information, then we'll use `SELECT * FROM customers`; to dump the information from the table.

`SELECT password FROM users WHERE username = 'admin';`