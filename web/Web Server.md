# Web Server





## cgi-bin
The Common Gateway Interface (CGI) is a standard protocol that defines how web servers communicate with external programs or scripts to generate dynamic content. The CGI-BIN directory serves as the designated location where these CGI scripts and programs are stored and executed by the web server.






## Windows
Traditionally on Windows, the IIS web server runs as a Network Service account, a passwordless built-in Windows identity with low privileges. Starting with IIS version 7.5, Microsoft introduced the IIS Application Pool Identities. These are virtual accounts running web applications grouped by application pools. Each application pool has its own pool identity, making it possible to set more precise permissions for accounts running web applications.

- <https://docs.microsoft.com/en-us/iis/manage/configuring-security/application-pool-identities>

- <https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/applicationpools>



## Linux

Web applications using Apache, Nginx or other dedicated web servers often run with specific users, such as www-data on Linux.

In most cases, the web server is run in the context of a dedicated user such as `www-data`.
These users usually have limited access permissions on the system.
However, users and administrators often intentionally set file access permissions to be very permissive or even world-readable.
Sometimes this occurs due to time constraints in deployment or less-mature security programs.










