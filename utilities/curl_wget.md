# cURL and Wget


https://daniel.haxx.se/docs/curl-vs-wget.html


# cURL

## check short urls link
curl --head --location [SHORTURL] | findstr Location
curl --head --location [SHORTURL] | grep -i location




## Retrieve public IP address
curl ifconfig.me
curl myexternalip.com/raw
curl ipecho.net/plain
curl ifcfg.me
curl icanhazip.com
nslookup myip.opendns.com. resolver1.opendns.com




http request:
- method + path
- headers
- body

response:
- response code
- headers
- body 


Minimal behavior by default with fine grain control lik toggle features on/off one-by-one

cURL pretends all headers look and work like HTTP/1



examples:
curl https://example.com/ | jq ----> didn't worked for me

curl https://example.com/[1-9].html -o save_#1.html ---->nombra cada pagina con el numero
curl https://example.com/{ham, cheese, pineapple}.jpg -o hawaii_#1.jpg

curl -v https://example.com/ -o /dev/null ----> verobse to see errors

borrar user agent
curl https://example.com/ -H "User-agent:" ---->colon INTERNAL HEADER
curl https://example.com/ -H "User-agent;" ---->semicolon CUSTOM HEADER


-d Sends  the  specified  data  in  a POST request
curl -d "nombre=test" -d "clave=asdf"  http://subarukou.dip.jp/saky/login_action.php


avoid -X



Cookies
 curl -c store-here.txt -b read-these https://example.com
 
 
Certificates
-k, --insecure


verbose
-v
more verbose
--trace-ascii -



curl https://example.com/ -o saved -w '%{json}'
curl https://example.com/ -o saved -w '%{json}' | jq ----> prettified with jq




"copy as cURL" ----> mimic browser










# Wget
is better to download recursive resources



