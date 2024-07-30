# Mysql / MariaDB



MariaDB is a community-developed MySQL version.
Default Port: 3306




## Credentials
Default `root` without password

```
MySQL [(none)]> select load_file("/etc/shadow");


```



## Basic commands
- <https://www.mysqltutorial.org/mysql-cheat-sheet/> 

```
# -h for remote host
mysql -h [IP] -u root
mysql -h [IP] -u root -p

mysql [IP] -u root -p

```


```

SHOW databases;                	: Prints out the databases we can access.
USE {database_name};     		: Set to use the database named {database_name}.
SHOW tables;	                : Prints out the available tables inside the current database.
SELECT * FROM {table_name};   	: Prints out all the data from the table {table_name}

```


