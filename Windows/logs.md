# Windows Logs




%SystemRoot%\System32\Winevt\Logs

C:\Windows\System32\winevt\Logs


`.evtx`: Event Log File extension
















## Commands
- <https://4sysops.com/archives/search-the-event-log-with-the-get-winevent-powershell-cmdlet/>
- <https://devblogs.microsoft.com/scripting/use-powershell-to-parse-saved-event-logs-for-errors/>
- <https://mikefrobbins.com/2015/10/01/powershell-filter-by-user-when-querying-the-security-event-log-with-get-winevent-and-the-filterhashtable-parameter/>




```

# Get events from event logs and event tracing log files on local and remote computers
Get-WinEvent

# Retrieve Event by ID number
wevtutil qe Security "/q:*[System[(EventID=4732)]]" /f:text
Get-WinEvent -FilterHashTable @{LogName='Security';ID='4732'}
Get-WinEvent -FilterHashTable @{LogName='System';ID='1','42'}



# Retrieve Event by ID number from event log file
Get-WinEvent -FilterHashtable @{Path=".\[FILE.evtx]";Id=22}



# Filter Windows Event Logs for a specific Event ID and export the results to a CSV file

$events = Get-WinEvent -Path [FILE]
$eventId = 11
$filteredEvents = $events | Where-Object { $_.Id -eq $eventId }
$filteredEvents.Length
$filteredEvents | Export-Csv -Path $outputPath -NoTypeInformation









Get-EventLog -LogName system -EntryType Error
Get-EventLog -LogName system -EntryType Information


```

























## Event ID
- <https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon#events>





1 - whenever a process is created in memory, an event with Event ID 1 is recorded with details such as command line, hashes, process path, parent process path, etc.


22 - can be used to look for any DNS Queries made by the system.


4698 - A scheduled task was created.

4702 - A scheduled task was updated.

4720 - A user account was created.

4732 – A member was added to a security-enabled local group.

4740 - A user account was locked out.
