# Mysql / MariaDB


Default Port: 3306

MariaDB is a an open-source fork of MySQL.











## Credentials
Default `root` without password

```
MySQL [(none)]> select load_file("/etc/shadow");


```









## Basic commands
- <https://www.mysqltutorial.org/mysql-cheat-sheet/> 


### Connect
```
# -h for remote host
mysql -h [IP] -u root
mysql -h [IP] -u root -p
mysql [IP] -u root -p
mysql -u root -p'root' -h 192.168.50.16 -P 3306

```


```
# MySQL accepts both version() and @@version statements.
select version();
@@version


select system_user();
	The root user is the database-specific root user, not the the system-wide administrative root user.


# Print out the databases we can access in this session
SHOW databases;


USE {database_name};     		: Set to use the database named {database_name}.
SHOW tables;	                : Prints out the available tables inside the current database.
SELECT * FROM {table_name};   	: Prints out all the data from the table {table_name}


# Retrieve the password of a user present in the mysql database
SELECT user, authentication_string FROM mysql.user WHERE user = '[USERNAME]';




```



The user's password is stored in the authentication_string field as a Caching-SHA-256 algorithm.

`caching_sha2_password` is a plugin value because it is the name of an authentication plugin used by the MySQL server to handle user authentication. MySQL supports various authentication plugins, and each plugin determines how user credentials are stored and verified during login attempts.


MySQL still supports other authentication plugins (like `mysql_native_password`) for backward compatibility. However, `caching_sha2_password` is recommended due to its stronger security features.(?)









## PHP

```
<?php
$uname = $_POST['uname'];
$passwd =$_POST['password'];
$sql_query = "SELECT * FROM users WHERE user_name= '$uname' AND password='$passwd'";
$result = mysqli_query($con, $sql_query);
?>
```

The `i` inside the `mysqli_query` PHP function stands for *improved* and should not be confused with the vulnerability!











