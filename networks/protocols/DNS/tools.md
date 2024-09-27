# DNS

## PowerShell

```powershell
ipconfig /displaydns # cmd

Get-DnsClientCache

Get-DnsClientCache | Format-Table -AutoSize


ipconfig /flushdns

```







## macOS

```

# Flush DNS
sudo killall -HUP mDNSResponder

```