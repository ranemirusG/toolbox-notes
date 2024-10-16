# Windows Processes


https://www.reddit.com/r/Malware/comments/q3rknx/process_hacker_vs_process_explorer_vs_autoruns/


https://github.com/kristibektashi/ProcessHacker

https://4sysops.com/archives/free-process-hacker-a-mighty-task-manager-and-process-explorer-alternative/










ps # alias
Get-Process
Get-Process -Id [PID]

handle.exe "[NAME]" # Sysinternals
# Example: look for process using a file or directory
handle.exe "[FILE NAME]"
handle.exe "[DIR NAME]"


# get path of all running processes
ps | % {$_.Path}
Get-Process | ForEach-Object {$_.Path}

(Get-Process | Select-Object Path).path
(Get-Process -Name firefox).path
(Get-Process -Id 1234).path


Get-Process | Group-Object -Property Name                   # Group objects by property name
Get-Process | Sort-Object -Property Id                      # Sort objects by a given property name
Get-Process | Where-Object -FilterScript { $PSItem.Name -match '^c' } # Filter objects based on a property matching a value
gps | where Name -match '^c'                                # Abbreviated form of the previous statement


# list all apps with active GUI windows
Get-Process | Where-Object { $_.MainWindowHandle -ne 0 }


# Kill process
Get-Process | Where-Object { $_.Name -like '*edge*' } | Stop-Process -Force


get event id
Get-EventLog -LogName system -EntryType Error
Get-EventLog -LogName system -EntryType Information



# get all the services on the computer and sends the objects down the pipeline. The Where-Object cmdlet, selects only the 
services with a Status property that equals 'Running'
Get-Service | Where-Object {$_.Status -eq "Running"}


```

#### CMD

```
schtasks /query /fo LIST /v


REM List currently running processes on either a local or remote machine
tasklist
tasklist /FI "PID eq [PID]"


REM Terminate tasks by process id (PID) or image name
taskkill /F /IM CalculatorApp.exe
taskkill /F /PID 1185



