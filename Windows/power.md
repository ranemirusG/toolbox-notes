

### Energy / Power

#### PowerShell

```
Stop-Computer -Force


# Sysinternals' psshutdown.exe (see: psshutdown.exe -help)
#lock
psshutdown.exe -l -t 0
#sleep
psshutdown -d -t 0


# Reboot
Restart-Computer




# find System Uptime
(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime
systeminfo | find "System Boot Time" # cmd







## Lock workstation
rundll32.exe user32.dll,LockWorkStation

```

#### CMD

```

REM Shutdown:
%windir%\System32\shutdown.exe -s

shutdown /s /f /t 0


REM Reboot:
%windir%\System32\shutdown.exe -r

REM Logoff:
%windir%\System32\shutdown.exe -l

REM Standby (disable hibernation, execute the standby command, then re-enable hibernation after 2 seconds):
powercfg -hibernate off  &&  start /min "" %windir%\System32\rundll32.exe powrprof.dll,SetSuspendState Standby  &&  ping -n 3 127.0.0.1  &&  powercfg -hibernate on

REM Sleep (same method as STANDBY, but this command):
%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState 0,1,0

REM Hibernate:
%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState Hibernate


powercfg.exe /sleepstudy


net stats workstation
REM  The timestamp in "Statics Since..." is the time when the computer started from a complete shutdown.















## temperature
https://www.howtogeek.com/1035/ever-wonder-what-temperature-your-cpu-is-running-at/
https://www.cpuid.com/softwares/hwmonitor.html