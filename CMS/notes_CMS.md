# Notes CMS

- <https://en.wikipedia.org/wiki/Content_management_system>


## List of CMS
- WordPress
- Drupal
- WonderCMS
- Meteor
- Pluck
- CMS Made Simple







## WordPress

- <https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress>
- <https://hackertarget.com/wordpress-security-scan/>
- `wpscan`



```powershell
# basic usage
wpscan --url "target" --verbose

# enumerate vulnerable plugins, users, vulrenable themes, timthumbs
wpscan --url "target" --enumerate vp,u,vt,tt --follow-redirection --verbose --log target.log

# Add Wpscan API to get the details of vulnerabilties.
wpscan --url http://alvida-eatery.org/ --api-token NjnoSGZkuWDve0fDjmmnUNb1ZnkRw6J2J1FvBsVLPkA 

#Accessing Wordpress shell
http://10.10.67.245/retro/wp-admin/theme-editor.php?file=404.php&theme=90s-retro

http://10.10.67.245/retro/wp-content/themes/90s-retro/404.php
```








### wpscan

- <https://wpscan.com/>

```
wpscan --url http://[IP] --enumerate p --plugins-detection aggressive -o [OUTPUT FILENAME]



# Depends on the time and resources you have, may choose vp first if limited resources
wpscan --url URL --plugins-detection aggressive -e vp
wpscan --url URL --plugins-detection aggressive -e ap
# Brute Force login, will take very long time. Not recommended unless you have short listed wordlist and usernames
wpscan --url http://IP/wordpress/ -U users.txt -P /usr/share/wordlists/rockyou.txt
```











### XSS
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





