# cURL and Wget

- <https://daniel.haxx.se/docs/curl-vs-wget.html>




# 1 - cURL
Both the tool and the library do Internet transfers for resources specified as URLs using Internet protocols. Everything and anything that is related to Internet protocol transfers can be considered curl’s business

Browsers typically support and use a different URL standard than what curl uses. Where
curl uses RFC 3986 for guidance, the browsers use the [WHATWG URL Specification](https://url.spec.whatwg.org/)
The WHATWG spec is also changing over time.
Browser address bar: https://en.wikipedia.org/wiki/Internationalized_Resource_Identifier

## Connection reuse
curl has a connection pool internally which keeps previously used connections alive and around for a while after they were used so that subsequent requests to the same hosts can reuse an already established connection. Of course, they can only be kept alive for as long as the curl tool is running. It is a good reason for trying to get several transfers done within the same command line instead of running several independent curl command line invocations.

cURL pretends all headers look and work like HTTP/1


IPv6 addresses the numerical version needs to be within square brackets:
`curl http://[2a04:4e42::561]/`
`curl http://[fdea::1]:8080/`



curl --list-only [IP]
curl -s [IP]

## Download everything in directory
```
	

for /f %%f in ('curl -s -l -u user:pass ftp://ftp.myftpsite.com/') do curl -O -u user:pass ftp://ftp.myftpsite.com/%%f



```



## Verbose/Debug
curl --dump-header headers.txt curl.se
curl -v ftp://ftp.example.com/
curl --trace trace.txt curl.se

## check short urls link
curl --head --location [SHORTURL] | findstr Location
curl --head --location [SHORTURL] | grep -i location





curl --header "Host: ramirogarcia.xyz" http://185.199.111.153/

### Get a file from an SSH server using SCP using a private key (not password-protected) to authenticate:
curl -u username: --key ~/.ssh/id_rsa scp://example.com/~/file.txt

### Get a file from an SSH server using SCP using a private key (password-protected) to authenticate:
curl -u username: --key ~/.ssh/id_rsa --pass private_key_password scp://example.com/~/file.txt

### Get a file from an SMB server:
curl -u "domain\username:passwd" smb://server.example.com/share/file.txt

## USING PASSWORDS

### http
HTTP offers many different methods of authentication and curl supports several: Basic, Digest, NTLM and Negotiate (SPNEGO). Without telling which method to use, curl defaults to Basic. You can also ask curl to pick the most secure ones out of the ones that the server accepts for the given URL, by using --anyauth.


curl http://name:passwd@http.server.example/full/path/to/file
curl -u name:passwd http://http.server.example/full/path/to/file

When using a proxy, you must use the -u style for user and password.

### ftp
curl ftp://name:passwd@ftp.server.example:port/full/path/to/file
curl -u name:passwd ftp://ftp.server.example:port/full/path/to/file


## UPLOAD Files
curl -F "file=@/home/user/example.png" -F "submit=Upload File" http://example.com/upload.php

curl -T uploadfile -u user:passwd ftp://ftp.example.com/myfile





curl https://example.com/[1-9].html -o save_#1.html ---->nombra cada pagina con el numero
curl https://example.com/{ham, cheese, pineapple}.jpg -o hawaii_#1.jpg

curl -v https://example.com/ -o /dev/null ----> verobse to see errors

borrar user agent
curl https://example.com/ -H "User-agent:" ---->colon INTERNAL HEADER
curl https://example.com/ -H "User-agent;" ---->semicolon CUSTOM HEADER


-d Sends  the  specified data  in  a POST request
curl -d "nombre=test" -d "clave=asdf"  http://subarukou.dip.jp/saky/login_action.php


avoid -X



Cookies
 curl -c store-here.txt -b read-these https://example.com
 
 
Certificates
-k, --insecure







## Misc

### shows the wheater in the command line!
curl wttr.in/BuenosAires

### word definition
curl dict://dict.org/m:curl




















































# 2 - GNU Wget
is better to download recursive resources




## Download everything in directory
```
wget -r -np -nH --cut-dirs=1 [URL]
wget -r -np -nH --cut-dirs=1 -A "*" [URL]

wget \
	--no-verbose \
	--no-parent \
	--recursive \
	--level=1 \
	--no-directories \
	--user=login \
	--password=pass \
	ftp://ftp.myftpsite.com/


```


## donwload full website with wget
If you ever need to download an entire Web site, perhaps for off-line viewing,
wget can do the job—for example:
```
$ wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --domains website.org \
     --no-parent \
         www.website.org/tutorials/html/
```

This command downloads the Web site www.website.org/tutorials/html/.

The options are:

--recursive: download the entire Web site.
--domains website.org: don't follow links outside website.org.
--no-parent: don't follow links outside the directory tutorials/html/.
--page-requisites: get all the elements that compose the page (images, CSS and
so on).
--html-extension: save files with the .html extension.
--convert-links: convert links so that they work locally, off-line.
--restrict-file-names=windows: modify filenames so that they will work in
Windows as well.
--no-clobber: don't overwrite any existing files (used in case the download is
interrupted and resumed).










