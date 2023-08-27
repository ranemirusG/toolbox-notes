# Windows and *nix Command-Line Cheat Sheet


[comment]: <> "change introduction name? add h3 to table of content? ask chatgpt for a script to do that"
[comment]: <> "style for code blocks and <h4>"
[comment]: <> "style franjas para powershell, cmd y unix"



## Table of Contents

1. [Preliminary Notes](#preliminary-notes)
2. [General](#general)
3. [System](#system)
4. [Search / Explore](#search-explore)
5. [Create / Modify / Delete](#create-modify-delete)
6. [Users / Groups / Permissions](#users-groups-permissions)
7. [Process Management](#process-management)
8. [Networking](#networking)



## Preliminary Notes

PowerShell, CMD, and shell commands for common tasks. Primarily for my personal use in administrative tasks, troubleshooting, 
networking, and enumeration. This is to have everything in one place and organized in a way that feels comfortable for me.

This guide will be a constantly ongoing project, so I expect to expand it (primarily to make tasks easier for myself).

Some commands might seem obvious, while others could be convoluted.

As I write this, I am mostly working on Windows (in fact, creating this cheat sheet is a way for me to learn, as I come from a \*nix background). So there might 
be a slight bias towards PowerShell.

The preferred order will be:

1. PowerShell
2. CMD
3. \*NIX



I hope this is useful to someone else.

Any feedback is welcome ☺



### Mixin'em up

PowerShell has several aliases that allow *nix and cmd users to use familiar commands in Windows.
Use the `Get-Alias` cmdlet to list the aliases available in your environment.

Run CMD commands in PowerShell:

```cmd.exe /c "[command]"```

If a CMD command works the same in PowerShell, I'll try to indicate it with a comment.

I might use bash or \*nix commands interchangeably. You might also find some macOS utilities mentioned.

Run bash commands in PowerShell:

```
bash -c "[command]"
wsl ls -lh
```
(See WSL)


To start a cmd or bash interpreter in PowerShell type `cmd` or `bash`.





## General

### Comments

#### PowerShell

```
# this is an inline pwsh comment
<# and this
is a multiline comment #>
```

#### CMD

```
REM I'll use this for inline comments in this guide
&REM I'll use this for inline comments in this guide (after a command)
```
See: <https://stackoverflow.com/questions/2997578/how-do-i-comment-on-the-windows-command-line>


#### \*NIX

```
# this is an inline bash command
```

See: <https://stackoverflow.com/questions/43158140/way-to-create-multiline-comments-in-bash>


### Help

#### PowerShell

```

# list all the commands available to PowerShell (native binaries in $env:PATH + cmdlets / functions from PowerShell modules)
Get-Command

# list of all the PowerShell commands exported from modules named Microsoft*
Get-Command -Module Microsoft*

# list of all commands (native binaries + PowerShell commands) ending in "foo"
Get-Command -Name *foo


# specific about_* topic (aka. man page)
Get-Help -Name about_Variables

# specific PowerShell function
Get-Help -Name Get-Command

# specific parameter on a specific command
Get-Help -Name Get-Command -Parameter Module


```

#### CMD

```
command /?
HELP
```

#### \*NIX

```
man command
info command
```


### Resources

#### Windows

https://lolbas-project.github.io/

https://4sysops.com/tag/powershell/


#### \*NIX
https://gtfobins.github.io/

http://mywiki.wooledge.org/Bashism

https://catonmat.net/books



### Misc

#### PowerShell

```
cls # cmd
Clear-Host
clear # unix



# On Windows Terminal - split windows in current directory:
wt -w 0 nt -d .



```

#### CMD

```

TITLE "foo bar" &REM Set the window title for a CMD.EXE session
PROMPT "new prompt >>>"
COLOR  &REM Sets the default console foreground and background colors
TIME
DATE

```

#### \*NIX

```

```

### Variables

#### PowerShell

```

# Home dir
~
$env:USERPROFILE
$env:userprofile

$env:APPDATA

reg query HKEY_CURRENT_USER\Environment
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"

# Expand variables
gci (or dir) env:

# List names of matching environment variables
Get-ChildItem env: | Where-Object { $_.Name -like "*PY*" -or $_.Value -like "*PY*" } | Select-Object -ExpandProperty Name
Get-ChildItem env: | Where-Object { $_.Name -like "*PY*" -or $_.Value -like "*PY*" } | Select-Object -ExpandProperty Value


# Get a list of commands related to variable management
`Get-Command -Name *varia*`
# Initialize a variable
$a = 0
# Initialize a variable, with the specified type (throws an exception)
[int] $a = 'Trevor'
# Initialize a variable, with the specified type (doesn't throw an exception)
[string] $a = 'Trevor'

Get-Variable                                              # Get an array of objects, representing the variables in the current and parent scopes 
Get-Variable | ? { $PSItem.Options -contains 'constant' } # Get variables with the "Constant" option set
Get-Variable | ? { $PSItem.Options -contains 'readonly' } # Get variables with the "ReadOnly" option set

New-Variable -Name FirstName -Value Trevor
New-Variable FirstName -Value Trevor -Option Constant     # Create a constant variable, that can only be removed by restarting PowerShell
New-Variable FirstName -Value Trevor -Option ReadOnly     # Create a variable that can only be removed by specifying the -Force parameter on Remove-Variable

Remove-Variable -Name firstname                           # Remove a variable, with the specified name
Remove-Variable -Name firstname -Force                    # Remove a variable, with the specified name, that has the "ReadOnly" option set





```

#### CMD

```
%USERPROFILE%
%APPDATA%

SET &REM expand variables
PATH
```

#### \*NIX

```
$HOME
~

echo $SHELL

env
printenv

```





## System



### System Information

systeminfo.exe


#### PowerShell

```

# Disk
wmic logicaldisk get size,freespace,caption # wmic is DEPRECATED


# Programs
get installed programs
Get-WmiObject -Class Win32_Product

Get-Counter

# Show all properties from a service
Get-Service -Name audiosrv | Select-Object -Property *

Get-WmiObject win32_baseboard
Get-WmiObject Win32_Bios
Get-WmiObject win32_physicalmemory

Get-ComputerInfo OSName, OsArchitecture

Get-Disk


Get-CimInstance Win32_OperatingSystem


Get-WmiObject -class win32_quickfixengineering



# You can pipe this commands altogether and send the output to a file with something like this:
	| Format-Table –AutoSize > systeminformation.txt


systeminfo | findstr /B /C:"OS Name" /C:"OS Version"


# Product key
wmic path softwarelicensingservice get OA3xOriginalProductKey




Get-CimInstance -ClassName Win32_BIOS                       # Retrieve BIOS information
Get-CimInstance -ClassName Win32_DiskDrive                  # Retrieve information about locally connected physical disk devices
Get-CimInstance -ClassName Win32_PhysicalMemory             # Retrieve information about install physical memory (RAM)
Get-CimInstance -ClassName Win32_NetworkAdapter             # Retrieve information about installed network adapters (physical + virtual)
Get-CimInstance -ClassName Win32_VideoController            # Retrieve information about installed graphics / video card (GPU)

Get-CimClass -Namespace root\cimv2                          # Explore the various WMI classes available in the root\cimv2 namespace
Get-CimInstance -Namespace root -ClassName __NAMESPACE      # Explore the child WMI namespaces underneath the root\cimv2 namespace



# Installed software
Get-WmiObject -class Win32_Product | select Name, Version


```

#### CMD

```
REM list installed Windows updates and patches
wmic qfe get Caption,Description,HotFixID,InstalledOn


sfc /scannow &REM run as administrator

SYSTEMINFO

REM Display Windows version
VER



```

#### \*NIX

```

uname -a
uname -mrs


df # display free disk space



# macOS
sudo sysdiagnose
system_profiler
scutil




```



### Defense

#### PowerShell
https://learn.microsoft.com/en-us/powershell/module/defender/get-mpcomputerstatus?view=windowsserver2022-ps


```

# Get status of antimalware software on the computer			 
Get-MpComputerStatus


```

#### CMD

```


```

#### \*NIX

```


# macOS
pfctl # Packet Filter (PF) firewall
sudo pfctl -sr # view active packet filter rules
sudo pfctl -s state


```



### Power Options

#### PowerShell

```
#lock
psshutdown.exe -l -t 0
#sleep
psshutdown -d -t 0

Shutdown:
%windir%\System32\shutdown.exe -s

Reboot:
%windir%\System32\shutdown.exe -r

Logoff:
%windir%\System32\shutdown.exe -l

Standby (disable hibernation, execute the standby command, then re-enable hibernation after 2 seconds):
powercfg -hibernate off  &&  start /min "" %windir%\System32\rundll32.exe powrprof.dll,SetSuspendState Standby  &&  ping -n 3 127.0.0.1  &&  powercfg -hibernate on

Sleep (same method as STANDBY, but this command):
%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState 0,1,0

Hibernate:
%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState Hibernate





```

#### CMD

```

```

#### \*NIX

```

```



### Drives

#### PowerShell

```
Get-PSDrive                                                 # List all the PSDrives on the system
New-PSDrive -Name videos -PSProvider Filesystem -Root x:\data\content\videos  # Create a new PSDrive that points to a filesystem location
New-PSDrive -Name h -PSProvider FileSystem -Root '\\storage\h$\data' -Persist # Create a persistent mount on a drive letter, visible in Windows Explorer
Set-Location -Path videos:                                  # Switch into PSDrive context
Remove-PSDrive -Name xyz                                    # Delete a PSDrive

```

#### CMD

```
DRIVERQUERY

```

#### \*NIX

```

```






## Search / Explore
Look around and find stuff.
Enumeration activities.
Passive reconnaissance.

### Move around

#### PowerShell

```
# change directory
Set-Location path/to/dir
sl
cd # cmd and unix

Push-Location
pushd # cmd and unix

Pop-Location
popd # cmd and unix

# goto Registry HKEY_CURRENT_USER
cd hkcu:
cd hklm:


```

#### CMD

```

```

#### \*NIX

```

```




### List and read

#### PowerShell

```
ii . # open current dir in File Explorer
dir # cmd
Get-ChildItem
gci
ls # unix alias
Get-Location
gl
pwd # unix alias
dir (Get-Location)

dir | Where-Object {$_.PsIsContainer}
gci | where {$_.PsIsContainer}
gci -dir
ls -directory
Get-ChildItem -Force # show hidden files
Get-ChildItem -File -Recurse
dir -recurse | fl
dir -Directory -Recurse | ForEach-Object { $_.fullname }

# list empty directories
dir -Directory -Recurse | where { $_.GetFileSystemInfos().Count -eq 0 }


# list, sort, show first 5 elements
dir | sort | select -first 5

# list file with creation time
dir -file | sort CreationTime | Format-Table Name, CreationTime

# list file with last write time greater than 24 hours ago
dir -file -recurse | where {$_.LastWriteTime -gt (Get-Date).AddDays(-1)}

# list files whose creation date is greater than a given date
dir -file -recurse | where { $_.CreationTime -gt [datetime]"2014/05/28" } | sort CreationTime | Format-Table Name, CreationTime

# return just the file name
Split-Path -Leaf path\to\file


# check if file/folder exist
test-path C:\path\file


# copy directory to clipboard
Resolve-Path 'path/to/dir' | Select-Object -ExpandProperty Path | Set-Clipboard



# file content
Get-Content file
gc file
more file
cat file


```

#### CMD
```
cd &REM get current location
dir /ad &REM only directories
dir/a-d &REM only files
dir /A-D /S /B  &REM recursive with list formatted output

REM open current dir in File Explorer
explorer .

TREE
TREE /F

REM file content
type file

```

#### \*NIX

```

# lists open files (lsof), including network connections
lsof


ls -R # recursive
ls -larth
dir # equivalent to `ls -C -b` (see `info dir`)

# get full path of filename
realpath file
# Copy filename
basename file | clip
# Copy dir
pwd | pbcopy # macOS


# file content
cat file
less file

```

### Metadata

#### PowerShell

```

# list all attributes of a file/dir
Get-ItemProperty -Path "path\to\dir\or\file" -Name Attributes


"{0:N2}" -f ((dir -Recurse | measure -Property Length -sum).sum / 1MB)
ls | Select-Object Name, @{Name="MegaBytes";Expression={$_.Length / 1MB}}
ls | Select-Object Name, @{Name="KiloBytes";Expression={$_.Length / 1KB}}

# Get the size of a file in bytes
(Get-Item myfile.txt).Length

# Get the number of lines in a file
(Get-Content myfile.txt | Measure-Object -Line).Lines

# Get the number of words in a file
(Get-Content myfile.txt | Measure-Object -Word).Words

```

#### CMD

```
ATTRIB file

```

#### \*NIX

```
# Size of current directory
du -sk . # in KB
du -ah
ls -A -R -g -o "$@" | awk '{n1 += $3} END {print n1}'
du -sch
du -hd 1 # the number is the depth of directory levels to be displayed


# shows how much disk space you have left on the current drive and then tells you how much every file/directory takes up
df -h .; du -sh -- * | sort -hr




ls -i # displays inode number which uniquely identifies each file in the file system
stat file
stat -f %Sm file
stat -f '%z' file

file exampleFile.txt # determine file type
od

# characters in file
wc -c < file
wc -c file | awk '{print $1*8}' #bits



```


### Compare files

#### PowerShell

```
# diff two files
# https://devblogs.microsoft.com/scripting/easily-compare-two-folders-by-using-powershell/
$fso = Get-ChildItem -Recurse -path C:\fso
$fsoBU = Get-ChildItem -Recurse -path C:\fso_BackUp
Compare-Object -ReferenceObject $fso -DifferenceObject $fsoBU





```

#### CMD

```
FC

```

#### \*NIX

```

```






### Find string
It may be a file name, or a string inside a file.

#### PowerShell

```
Get-ChildItem -Recurse | Select-String -Pattern "string"
Get-ChildItem -Path "C:\Path\To\Directory" -Filter *.txt -Recurse | Select-String -Pattern "string"
Get-ChildItem -Recurse | Where-Object { ! $_.PSIsContainer -and ($_.Extension -eq '' -or $_.Extension -eq '.txt') } | Select-String -Pattern "string"
Get-ChildItem -Recurse | Where-Object { ! $_.Extension -ne ".pdf",".gz" } | Select-String -Pattern "string"

# output the name of the files containing the match
Get-ChildItem -Recurse |
Where-Object { ! $_.PSIsContainer -and ($_.Extension -eq '' -or $_.Extension -eq '.txt') } |
Select-String -Pattern "string" |
Select-Object -ExpandProperty Path
```


#### CMD

```
REM search string in specific file
type file.txt | find /n "string"

REM search every file in the current directory and all subdirectories that contains "string"
findstr /s /i string *.*

REM match filename in the directory tree.
dir /s /b *foo*

```

#### \*NIX

```
grep -r string
grep -r "string with spaces"
grep -ri "STRING WITH SPACES" # case insensitive
grep -rl "string" # output the name of the files containing the match
grep "string" /path/to/file/example.db # search string in specific file

# match filename
find /path/to/dir -name "*.txt"
find /path/to/dir -name "*.txt" -size +1M # large files criteria

ls -l /path/to/file/*foo* 

```











## Create / Modify / Delete

### Create files and directories

#### PowerShell

```

# Create an empty file
New-Item -Path c:\dir\file.txt
New-Item file
ni file
ni file | Out-Null # without output message	
Set-Content -Path c:\test.txt -Value ''

# Create an empty file using .NET Base Class Library
[System.IO.File]::WriteAllText('testing.txt', '')

"Hello, this is the content." | Set-Content -Path "C:\path\to\file.txt"
Add-Content # to append	

# Create directory
New-Item -Path c:\test -ItemType Directory
New-Item -Type Directory -Name very/long/path/to/dir; cd "$$" # create and go there
[System.IO.Directory]::CreateDirectory('full path to directory')


# Delete
del file # cmd
Remove-Item
ri
rd directory # cmd
del -Recurse -Force path/to/dir

# Delete a file using .NET Base Class Library
[System.IO.File]::Delete('testing.txt')

# Empty Recycle Bin
Clear-RecycleBin


# Rename
Rename-Item
rni


# redirect output
command | out-file filename.txt -Append


```

#### CMD

```
REM Create new file
copy NUL EmptyFile.txt
copy /b NUL EmptyFile.txt
echo. 2>EmptyFile.txt
copy nul file.txt > nul

REM Delete
RMDIR directory
ERASE file

REM Empty Recycle Bin
rd /s %systemdrive%\$Recycle.bin

REM Rename files
ren old new
rename old new

```

#### \*NIX

```
# Create
touch file
echo "foo" > file
mkdir
mkdir -p ~/nested/path/to/dir/

# Delete
rm file
rm -rf /path/to/dir # delete directory recursively



```


### Copy and Move things

#### PowerShell

```
Copy-Item
copy # cmd
Copy-Item -Path "C:\Source" -Destination "D:\Destination" -Recurse

Move-Item
move
mv

# Move all files under the SOURCE directory to the DEST directory you can do this:
Get-ChildItem -Path SOURCE -Recurse -File | Move-Item -Destination DEST

If you want to clear out the empty directories afterwards, you can use a similar command:
Get-ChildItem -Path SOURCE -Recurse -Directory | Remove-Item




```

#### CMD

```
copy
move /Y "C:\Source" "D:\Destination"


```

#### \*NIX

```
cp
mv

```


### Other Actions

#### PowerShell

```
# Unzip files
Expand-Archive	

```

#### CMD

```

```

#### \*NIX

```

# Zip directory
zip -r myzipfile my_folder_name

```










## Users / Groups / Permissions

### Windows Run Box

User accounts: `netpzwiz`

Local Users and Groups: `lusrmgr.msc`

Local Security Settings: `secpol.msc`

Local Group Policy Editor: `gpedit.msc`

### Users

#### PowerShell

```
whoami /USER # cmd
net user # cmd
Get-LocalUser
Get-LocalUser | Format-Table Name, Enabled, LastLogon
Get-LocalUser | Sort-Object -Property Enabled | Format-Table Name, Enabled, LastLogon
sl $env:SystemDrive/users # go to Users directory

# enable/disable the built-in Administrator:
net user administrator /active:yes
net user administrator /active:no


# list all SIDs on a system
gcim Win32_Account | ft Name, SID

# list all User SID
gcim Win32_UserAccount | ft Name, SID
Get-WmiObject win32_useraccount | Select name,sid


```

Get SID from User
```
$objUser = New-Object System.Security.Principal.NTAccount("DOMAIN_NAME", "USER_NAME")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value
```

Get User from SID
```
$objSID = New-Object System.Security.Principal.SecurityIdentifier S-1-5-21-455291304-1752063992-2633877976-1002
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
$objUser.Value
```

Local user to SID
```
$objUser = New-Object System.Security.Principal.NTAccount(LOCAL_USER_NAME)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value
```

Open powershell as another user (1):
```
$username = 'username'
$password = 'password'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Start-Process powershell.exe -Credential $credential
```

Open powershell as another user (2):
```
$credentialParams = @{
    UserName = 'username'
    Password = 'password' | ConvertTo-SecureString -AsPlainText -Force
}

$credential = New-Object System.Management.Automation.PSCredential @credentialParams

$processParams = @{
    FilePath = 'powershell.exe'
    Credential = $credential
}

Start-Process @processParams
```



#### CMD

```
net &REM only used on local computer

net localgroup administrators
net user Administrator &REM (o cualquier user)

cd %SystemDrive%\Users &REM go to Users directory

wmic useraccount where name="USER_NAME" get sid
wmic useraccount where sid="SID_NUMBER" get name

```

#### \*NIX

```

```



### Groups

#### PowerShell

```
Get-LocalGroup
Get-LocalGroup | Format-Table Name, PrincipalSource
get-LocalGroup | ft Name, SID

net localgroup # cmd

# List group members
Get-LocalGroupMember -Group "Administrators"

# Create new group
New-LocalGroup -Name "Group Name"

# Add/Delete user to group
Add-LocalGroupMember -Group "GROUP" -Member "USER"
Remove-LocalGroupMember -Group "GROUP" -Member "USER"
net localgroup "GROUP" "USER" /add # cmd
net localgroup "GROUP" "USER" /delete # cmd



```

#### CMD

```

```

#### \*NIX

```

```



### Permissions

#### PowerShell

```
# Sysinternals
#list all the permissions of a given domain user
accesschk “domain\user” -a * -nobanner
# see the security on the HKLM\Software key:
accesschk -k hklm\software

```

#### CMD

```

```

#### \*NIX

```

```





## Process Management

Control Panel

Windows Tools (since Windows 11, previously Administrative Tools)

Task Manager

Event Viewer

procexp.exe (Sysinternals)




### Utilities

#### PowerShell

```

get event id
Get-EventLog -LogName system -EntryType Error
Get-EventLog -LogName system -EntryType Information



Get-Process
Get-Process | Group-Object -Property Name                   # Group objects by property name
Get-Process | Sort-Object -Property Id                      # Sort objects by a given property name
Get-Process | Where-Object -FilterScript { $PSItem.Name -match '^c' } # Filter objects based on a property matching a value
gps | where Name -match '^c'                                # Abbreviated form of the previous statement




# get all the services on the computer and sends the objects down the pipeline. The Where-Object cmdlet, selects only the 
services with a Status property that equals 'Running'
Get-Service | Where-Object {$_.Status -eq "Running"}


```

#### CMD

```

schtasks /query /fo LIST /v



```

#### \*NIX

```
# display sorted information about processes
top


# Process Status
ps
ps -ax # 'a' from other sessions and users, 'x' include those who not have a controlling terminal




# macOS  displays file system activity, including processes accessing files and directories It can help identify which processes are 
performing disk I/O operations.
sudo fs_usage


```


### Threads / Dependencies

With procexp.exe: Run up the application, with Process Explorer already running and set to filter for your applications 
.exe name.

#### PowerShell

```

# in Developer Command Prompt for VS
dumpbin /imports file.exe

```

#### CMD

```

```

#### \*NIX

```

```












