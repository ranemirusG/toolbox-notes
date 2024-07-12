# Download stuff

See: cURL / wget


Valid PowerShell cmdlets/methods that can be used by malware to download additional files:
- Invoke-WebRequest
- Start-BitsTransfer
- system.Net.WebClient
- Invoke-RestMethod



### Invoke-WebRequest (In Powershell `curl` is an alias for this command)

```

# get a website content, save it as xx.html (iwr is alias of Invoke-WebRequest)
iwr "google.com" -outfile xx.html

# Download using PowerShell’s WebClient object
(new-object System.Net.WebClient).DownloadFile('http://[IP]/file.txt','dest/path/file.txt')

```