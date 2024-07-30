# MAC Address (Medium Access Control Address)



## Windows
```powershell
getmac.exe # CMD

Get-NetAdapter | Select-Object -Property Name, Macaddress
Get-NetAdapter -Name * -IncludeHidden
Get-NetAdapter -Name "Ethernet 2"
```

## Linux

```
ip addr show
ip a s
ip link show


cat /sys/class/net/*/address

```