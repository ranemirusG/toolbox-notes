# Notes CMS

- <https://en.wikipedia.org/wiki/Content_management_system>


## List of CMS
- WordPress
- Drupal
- WonderCMS
- Meteor








## WordPress

- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress>
- <https://hackertarget.com/wordpress-security-scan/>
- `wpscan`
- <https://wpscan.com/>


XSS
https://shift8web.ca/2018/01/craft-xss-payload-create-admin-user-in-wordpress-user/
https://developer.wordpress.org/reference/functions/wp_nonce_field/



`xmlrpc.php`
XML-RPC server accepts POST requests only.

https://github.com/kh4sh3i/xmlrpc-exploit
https://www.youtube.com/watch?v=PnH4uwY0X9U El pinguino de mario
```
curl -X POST 'http://[IP]/xmlrpc.php'
curl -X POST 'http://[IP]/xmlrpc.php' -d@payload.xml
```











### Version
curl https://victim.com/ | grep 'content="WordPress'


### Login directory
http://yourdomain.com/wp-login.php
http://yourdomain.com/wp-admin/



### Users
http://yourdomain.com/wp-admin/users.php
http://yourdomain.com/wp-admin/user-new.php
http://yourdomain.com/wp-admin/profile.php

### Plugins
http://yourdomain.com/wp-admin/plugins.php
http://yourdomain.com/wp-admin/plugin-install.php





