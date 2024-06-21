# SQLite

The most common (and simplest) format of flat-file database is an sqlite database.


## Tools
- <https://sqlitebrowser.org/>

## Basic commands

`.quit`
`.help`
`.system [COMMAND]` or `.sh [COMMAND]` execute system command (`.system ls -l`, `.sh cls`)


`.timer ON` Show execution time of a query, `.timer OFF` to dissable.



## Tables

`.tables` see the tables in the database
`.schema [TABLE]` Show schema of a table
`PRAGMA table_info(customers);` to see the table information


### select contents of a table
```
select * from [TABLE];
select * from [TABLE] LIMIT 3;
select * from [TABLE] ORDER BY Name DESC LIMIT 3;
`SELECT password FROM users WHERE username = 'admin';`
```


### update column from table
```
UPDATE [TABLE]
SET [COLUMN 1] = 'New value'
WHERE [COLUMN 2] = 1; -- Replace 1 with the actual node_id of the node you want to update
```



### Insert row in a table
INSERT INTO VARS (name,value) VALUES('color', 'blue');


### delete table
```
drop table [TABLE];
```

















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

















## Execute a SQL command in command line
```
$ sqlite3 foo.db "INSERT INTO CASHIER VALUES (\"foo\",\"bar\");"
```


## Execute a SQL script in command line

### 1
Example script, `example.sql`:
```
CREATE TABLE CASHIER (name    VARCHAR(10) PRIMARY KEY ,pass    VARCHAR(10) NOT NULL);
INSERT INTO CASHIER VALUES ("foo","bar");
SELECT * FROM CASHIER;
```

And then execute with: `$ sqlite3 foo.db < example.sql`


### 2
Or using a here document in a shell script:

Example shell script, `example.sh`:
```
#!/bin/bash

sqlite3 foo.db <<EOF
CREATE TABLE CASHIER (name    VARCHAR(10) PRIMARY KEY ,pass    VARCHAR(10) NOT NULL);
INSERT INTO CASHIER VALUES ("foo","bar");
SELECT * FROM CASHIER;
EOF
```

And then execute with: `$ bash example.sh`