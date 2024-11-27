# Windows Logs

Event logs are records of events that occur on a Windows computer.

- system events: Events related to hardware states, drivers, etc. User logins, service starts or stops
- application events: Events related to the installed applications, such as system errors
- security events: Events related to sessions logon/logoff, RDP successful/failed connections, services installed, tasks created, etc. Such as user login attempts to login with an incorrect password or when suspicious activity is detected
- Setup: The setup log contains events that occur during the installation of the Windows operating system. On domain controllers, this log will also record events related to Active Directory.
- Forwarded Events: Contains event logs forwarded from other computers in the same network.



Stored at:
```
%SystemRoot%\System32\Winevt\Logs

C:\Windows\System32\winevt\Logs
```


- `.evtx`: Event Log File extension
















## Commands
- <https://4sysops.com/archives/search-the-event-log-with-the-get-winevent-powershell-cmdlet/>
- <https://devblogs.microsoft.com/scripting/use-powershell-to-parse-saved-event-logs-for-errors/>
- <https://mikefrobbins.com/2015/10/01/powershell-filter-by-user-when-querying-the-security-event-log-with-get-winevent-and-the-filterhashtable-parameter/>




```

# view available event logs
wevtutil.exe el
Get-WinEvent -Listlog *
Get-EventLog -List



# Query the last 3 events from the System log, sorted in reverse order, and display in plain text format.
wevtutil.exe qe System /c:3 /rd:true /f:text


# Get events from the System log where the ProviderName matches 'Service Control Manager'
Get-WinEvent -LogName System | Where-Object {$_.ProviderName -Match 'Service Control Manager'}




# Count events
(Get-WinEvent -LogName Security -Oldest).Count
(Get-WinEvent -LogName Security | Measure-Object).Count



# Count events in the System log within a specific timeframe

wevtutil qe System "/q:*[System[TimeCreated[timediff(@SystemTime) <= 86400000]]]" /f:xml | findstr "<TimeCreated " | findstr "2021-09-17T1[78]:"

Get-WinEvent -LogName System | Where-Object { $_.TimeCreated -ge (Get-Date "2021-09-17 17:00") -and $_.TimeCreated -lt (Get-Date "2021-09-17 20:00") } | Measure-Object

Get-WinEvent -LogName Security | where {$_.TimeCreated -ge '2024-11-18 21:00' -and $_.TimeCreated -lt '2024-11-18 21:05'} | measure





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















## Event types / Levels
There are 5 types of event logs.

- Information: This event type means that an operation was successfully completed and a general description of it is recorded.

- Warning: This event type means that there is some kind of minor problem that may cause bigger issues in future events.

- Error: This type of event means that a problem occurred causing a loss of functionality.

- Critical: Indicates a significant issue in an application or a system needing urgent attention.

- Verbose: Indicates progress or success messages for a particular event.





## Event ID
- <https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon#events>



1 - whenever a process is created in memory, an event with Event ID 1 is recorded with details such as command line, hashes, process path, parent process path, etc.


22 - can be used to look for any DNS Queries made by the system.

1102 - Audit Log has been cleared.



4624 - An account was successfully logged on.
	1149 can be used to find successful RDP connections.

4625 - Failed authentication attempt.

4657 - A registry value was modified.

4697 - A service was installed in the system.

4698 - A scheduled task was created.

4702 - A scheduled task was updated.

4720 - A user account was created.

4732 – A member was added to a security-enabled local group.

4740 - A user account was locked out.

7040 - Service Control Manager (SCM) event indicating that the startup type of a service has changed.





















## Logon Types
Tip: filter Services (Logon type 5) it causes a lot of unnecessary noise and makes it difficult for us to analyze the events.


### Logon Type 2: Interactive  
   - a user logs on to the computer physically
   - Example: Signing in directly to a desktop or laptop.





### Logon Type 3: Network  
   - Occurs when a user or service accesses a system over the network.  
   - Example: Accessing shared folders or printers.
If we see failed logon attempts for logon type 3 (Network) in multiple computers in a network, this would be a suspicious activity and would indicate a possible intrusion where the attacker is trying to perform lateral movement.





### Logon Type 4: Batch  
   - This type of logon is used by batch servers. Scheduled tasks are executed on behalf of a user without human intervention.  
   - Example: Running a task using Task Scheduler.




### Logon Type 5: Service  
   - Used when a service logs on using a service account.  
   - Example: Services like SQL Server or IIS starting with a service account.





### Logon Type 7: Unlock  
   - Occurs when a workstation is unlocked after being previously locked.  
   - Example: Entering credentials to unlock your screen.




### Logon Type 8: Network Cleartext  
   - Occurs when credentials are sent in cleartext over the network.  
   - Example: Logging in via Telnet.




### Logon Type 9: New Credentials  
   - Occurs when a user runs a program using the "Run as" command or similar mechanisms without logging off.  
   - Example: Using "Run as different user."





### Logon Type 10: Remote Interactive  
   - Used for logons via Remote Desktop Protocol (RDP). Applications such as Remote Desktop, Remote Assistance or Terminal Services. 
   - Example: Connecting to a computer using Remote Desktop.
One important thing to note is that when investigating event logs for RDP related events, the source computer connecting to the remote computer via RDP also stores event logs related to that session and the computer on which user RDP into also stores event logs related to that session. The source computer event logs would be very helpful when investigating lateral movements in an internal network as the attacker would have moved from an internal workstation to another one. In case of external RDP attacks where the RDP computer is internet facing and someone unauthorized logons to the computer via RDP then we would only have even logs on the RDP computer as we would not have access to the attackers machine.

Successful RDP logon is also stored in Security logs with event ID “4624” but with logon type 10. But Windows also stores RDP logs under “Applications and Services Logs” in an Application Log named “TerminalServices-RemoteConnectionManager”. This makes it easy to analyze RDP logs because there's a lot of unnecessary noise in Security Logs.






### Logon Type 11: Cached Interactive  
   - Occurs when a user logs on with cached credentials (e.g., without network access to a domain controller).  
   - Example: Logging in with a domain account when the computer is offline.















