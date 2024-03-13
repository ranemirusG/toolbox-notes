# Search Engines

- <https://en.wikipedia.org/wiki/Baidu>
- <https://www.shodan.io/>
- <https://yandex.com/>

		
## Dorking / Google Hacking
- <https://developers.google.com/search/docs/fundamentals/how-search-works>
- <https://www.google.com/advanced_search>
		
Exclude words from your search:
Enter `-` in front of a word that you want to leave out. Ex: `[jaguar speed -car]`

`inurl:+CSCOE+/logon.html`

results only from the specified website address
`site:tryhackme.com`

results that have the specified word in the URL
`inurl:admin`

results which are a particular file extension
`filetype:pdf`

results that contain the specified word in the title
`intitle:admin`

For subdomain enumeration
`-site:www.tryhackme.com` `site:*.tryhackme.com`
		
		
		

## Bing
https://support.microsoft.com/en-us/topic/advanced-search-options-b92e25f1-0085-4271-bdf9-14aaea720930		
		
payloads:
“-----BEGIN CERTIFICATE-----” filetype:txt		
inanchor:”adminpanel”		
site:gob.pe contains:mp4		
inanchor:”8080/login.php”		
site:mil.pe ext:pdf		
