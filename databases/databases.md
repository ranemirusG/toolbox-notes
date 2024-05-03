# Databases



## Resources:

- <https://github.com/gcc-cdimatteo/Base-de-Datos-75.15/tree/main/BIBLIOGRAFIA>


Database Systems: A Practical Approach to Design, Implementation, and Management, 6th edition, ISBN 978-
0-13-294326-0, Thomas Connolly and Carolyn Begg. Pearson Education © 2015.

Database Systems. The Complete Book. Second Edition. 978-0-13-606701-6. Hector Garcia-Molina, Jeffrey D.
Ullman, Jennifer Widom. Pearson Education © 2009.

Fundamentals of Database Systems. 6th edition, ISBN 978-0-136-08620-8, Ramez Elmasri and Shamkant B.











## SQLite / sqlite3
The most common (and simplest) format of flat-file database is an sqlite database.

`.tables` see the tables in the database

`PRAGMA table_info(customers)` to see the table information
`SELECT * FROM customers` dump the information from the table.

`SELECT password FROM users WHERE username = 'admin';`

### Export
`sqlite3 -header -csv my_db.db "select * from my_table;" > out.csv`

Also, you can run a sql script file:

`sqlite3 -header -csv my_db.db < my_script.sql > out.csv`


```
.mode csv
.headers on
.output out.csv
SELECT * FROM table_name;
```