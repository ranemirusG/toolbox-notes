# Windows and *nix Command-Line Cheat Sheet


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

The preferred order will be:

1. PowerShell
2. CMD
3. \*NIX



I hope this is useful to someone else.

Any feedback is welcome ☺



### Mixin'em up

PowerShell has several aliases that allow *nix and cmd users to use familiar commands in Windows.
Use the `Get-Alias` cmdlet to list the aliases available in the environment.

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




# History
Get-History
ghy
h

Get-History | Format-Table Id, StartExecutionTime, CommandLine # With timestamp
```






#### CMD

```
REM I'll use this for inline comments in this guide
@REM echo off the comment! best option
&REM I'll use this for inline comments in this guide (after a command)
```
`REM` stands for "Remark"
See: <https://stackoverflow.com/questions/2997578/how-do-i-comment-on-the-windows-command-line>


`F7` to see the command history
or `doskey /history`


Batch Files: <https://en.wikipedia.org/wiki/Batch_file>

<https://ss64.com/nt/>












#### \*NIX

```
# this is an inline bash command


# History
history # to see timestamp set: HISTTIMEFORMAT="%F %T " or HISTTIMEFORMAT="%y-%m-%d %T "

history 10 # last 10 commands



```

See: <https://stackoverflow.com/questions/43158140/way-to-create-multiline-comments-in-bash>












### Help

#### PowerShell

```

help [COMMAND] # simpler way


# specific about_* topic (aka. man page)
Get-Help -Name about_Variables

# specific PowerShell function
Get-Help -Name Get-Command

# specific parameter on a specific command
Get-Help -Name Get-Command -Parameter Module

# list all the commands available to PowerShell (native binaries in $env:PATH + cmdlets / functions from PowerShell modules)
Get-Command

# list of all the PowerShell commands exported from modules named Microsoft*
Get-Command -Module Microsoft*

# list of all commands (native binaries + PowerShell commands) ending in "foo"
Get-Command -Name *foo

```

#### CMD

```
command /?
help <command>
help &REM list all commands

```

#### \*NIX

```
info [COMMAND]

man [COMMAND]
# perform a keyword search
apropos [KEYWORD]
man -k [KEYWORD]
man -k '^passwd$'
# look at the exact  manual page
man 5 passwd
man [PAGE] [COMMAND]








```


### Resources
Besides the official documentation, here are some websites that may help.

- https://jvns.ca/blog/2023/08/08/what-helps-people-get-comfortable-on-the-command-line-/
- https://furbo.org/2014/09/03/the-terminal/

#### Windows

- https://lolbas-project.github.io/
- https://4sysops.com/tag/powershell/
- https://powershellmagazine.com/
- https://activedirectorypro.com/
- https://www.thewindowsclub.com/


#### \*NIX
- https://gtfobins.github.io/
- http://mywiki.wooledge.org/Bashism
- https://catonmat.net/books









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

# Set variable
$myVar = "Hello, world!"

# Delete/Remove variable
Remove-Variable -Name myVar

$PSVersionTable.PSVersion

# Home dir
~
$env:USERPROFILE
$env:userprofile

$env:APPDATA

reg query HKEY_CURRENT_USER\Environment
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"


# find executable path
(Get-Command -Name <executable>).Source


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
<https://ss64.com/nt/syntax-variables.html>

```
REM echo shell equivalent
echo %COMSPEC%

%USERPROFILE%
%APPDATA%

SET &REM expand variables
PATH
```





#### \*NIX

```
# Set variable
my_var="Hello, world!"

# Delete/Remove variable
unset my_var








$HOME
~

echo $SHELL

env
printenv

```


























## System



### System Information

- systeminfo.exe
- msinfo32.exe


#### PowerShell

```
# PowerShell version
$PSVersionTable.PSVersion

# Disk
wmic logicaldisk get size,freespace,caption # wmic is DEPRECATED


Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="Used(GB)";Expression={[math]::round(($_.Used/1GB),2)}}, @{Name="Free(GB)";Expression={[math]::round(($_.Free/1GB),2)}}, @{Name="Total(GB)";Expression={[math]::round(($_.Used/1GB)+($_.Free/1GB),2)}}





# Programs

#get installed programs
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


systeminfo | find /i "Install Date" #cmd
([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)



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
winver


diskpart


```

#### \*NIX

```

uname -a
uname -mrs


lsb_release -a # Linux Standard Base

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



### Energy / Power

#### PowerShell

```

# Sysinternals' psshutdown.exe (see: psshutdown.exe -help)
#lock
psshutdown.exe -l -t 0
#sleep
psshutdown -d -t 0




# find System Uptime
(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime


```

#### CMD

```

REM Shutdown:
%windir%\System32\shutdown.exe -s

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
Look around and find stuff




### Move around

#### PowerShell

```
# change directory
Set-Location path/to/dir
sl
cd path/to/dir/ # cmd and unix

Push-Location
pushd # cmd and unix

Pop-Location
popd # cmd and unix

# goto Registry HKEY_CURRENT_USER
cd hkcu:
cd hklm:

ii . # open current dir in File Explorer
Invoke-Item .

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
Get-ChildItem
gci
ls # unix alias
Get-Location
gl
pwd # unix alias
dir # cmd
[System.Environment]::CurrentDirectory


# Open all files in current dir with it default program
gci|ii

# Open all pdf files in current dir
Get-ChildItem -Filter *.pdf | ForEach-Object { Invoke-Item $_.FullName }


dir | ?{!$_.PSIsContainer} | %{$_.Name}
dir -file | % Name
# Alias           % -> ForEach-Object
# Alias           ? -> Where-Object


dir | Where-Object {$_.PsIsContainer}
gci | where {$_.PsIsContainer}
gci -dir
ls -directory
Get-ChildItem -Force # show hidden files
Get-ChildItem -File -Recurse
dir -recurse | fl
dir -Directory -Recurse | ForEach-Object { $_.fullname }

# list directories
Get-ChildItem -Directory -Force

# list empty directories
dir -Directory -Recurse | where { $_.GetFileSystemInfos().Count -eq 0 }

# Count directories
(gci -Directory).count

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




# Search file by name
Get-ChildItem -Path "C:\Path\To\Directory" -Filter "example.txt"

Get-ChildItem -Path "C:\Path\To\Directory" -Recurse -Filter "example.txt"

Get-ChildItem -Path "C:\Path\To\Directory" -Recurse -File | Where-Object { $_.Name -like "*example*" }




# Search for files in directory which have been modified in the last 24 hs
Get-ChildItem -Recurse | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-1) }
# Search for files in directory which have been modified between two dates
Get-ChildItem -File | Where-Object { $_.CreationTime -ge '2023-09-01' -and $_.CreationTime -le '2023-09-04' -or $_.LastWriteTime -ge '2023-09-01' -and $_.LastWriteTime -le '2023-09-04' }


# read file content
Get-Content file
gc file
more file
cat file
Invoke-WebRequest file:///$env:USERPROFILE/path/to/file
curl file:///$env:USERPROFILE/file.txt
curl file:///%USERPROFILE%/file.txt # CMD
curl file:///Users/useraname/file.txt # CMD
curl file:///Users/useraname/file.txt # CMD curl on Windows also allows this incorrect format (with only 2 slashes)

# read file at specific line
Get-Content file.txt | Select-Object -Index 2


```

#### CMD
```
cd &REM get current location
dir /ad &REM only directories
dir/a-d &REM only files
dir /A-D /S /B  &REM recursive with list formatted output

REM open current dir in File Explorer
explorer .
start .

TREE
TREE /F

REM file content
type file



REM Search file by name
dir "*example*.txt" /s
dir "C:\Path\To\Directory\example.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s /a
for /r "C:\Path\To\Directory" %i in (*example*.txt *test*.txt) do @echo %i




```

#### \*NIX

```

# read file content
less file.txt
more file.txt
cat file.txt
head
tail
echo "$(less file.txt)"
echo "$(cat file.txt)"
tac file.txt # `tac` is `cat` in reverse line order
rev file.txt # reversed characters
nl file.txt # line numbers
tr -d '\0' < file.txt
paste -s file.txt
fold -w 80 file.txt
fmt file.txt
cut -f 1,3 file.txt
view file.txt
comm file.txt file.txt
strings file.txt
while read line; do echo $line; done < file.txt
while IFS= read -r line; echo "$line"; done < file.txt
grep '' file.txt
grep '.' file.txt
awk '{print}' file.txt
sed -n 'p' file.txt
hexdump -C file.txt
od -c file.txt
xxd file.txt
curl file:///home/username/file.txt
nano file
vim file
vi file




# read file at specific line
sed -n '8p' file.txt
awk 'RN==8' file.txt
more +8 file.txt
less +8 file.txt
head -n 8 filename.txt | tail -n 1




# list open files (lsof), including network connections
lsof


# list directory contents
ls -1a
ls -larth
find . -maxdepth 1
find -maxdepth 1 # current dir by default
tree -L 1 .
tree -L 1 # current dir by default

ll # may be a default alias of `ls -l`
dir # equivalent to `ls -C -b` (see `info dir`)

# recursive
ls -R
find .
tree



# list directories
ls -l | grep '^d'
ls -d .* # only hidden directories
ls -l | grep -c '^d' # count directories
find . -maxdepth 1 -type d | wc -l



# get full path of filename
realpath file

# Copy filename
basename file | clip

# Copy dir
pwd | pbcopy # macOS






# Search file by name
find /path/to/directory -name "example.txt"
find /path/to/directory -iname "*example*.txt"
find /path/to/directory -name "*example*.txt" ! -name "*.log"






# Search for files in directory which have been modified in the last 24 hs
find /directory -mtime 0

# Search for files in directory which have been modified between two dates
find . -type f \( -newermt '2023-09-01' -a ! -newermt '2023-09-05' \)





# find command

# Search for file with specified properties
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
find /path/to/search -type f ! -executable -size 1033c -readable


find /path/to/search -name "filename" # Find Files by Name

find /path/to/search -type d -name "dirname" # Find Directories by Name

find /path/to/search -mtime -N # Find Files Modified in Last N Days

find /path/to/search -type f -empty # Find Empty Files

find /path/to/search -type f -name "*.ext" # Find Files by Extension

find /path/to/search -type f -exec ls -s {} + | sort -n | tail # Find Largest Files

find /path/to/search -type f -size +10M # Find Files by Size

find /path/to/search -mtime -1 # Find Files Modified in Last 24 Hours

find /path/to/search -mmin -N # Find Files Modified in Last N Minutes

find /path/to/search -user username # Find Files Owned by User

find /path/to/search -group groupname # Find Files by Group

find /path/to/search -perm /6000 # Find SUID/SGID Files

find /path/to/search -perm 644 # Find Files with Specific Permissions

find /path/to/search -type f -perm /4000 # Find Setuid Executables

find /path/to/search -type f -perm /2000 # Find Setgid Executables

find /path/to/search -type f -name "filename" -delete # Find and Delete Files

find /path/to/search -type d -exec ls -l {} \; # Find Directories and List Contents

find /path/to/search -type f -name "pattern" -exec mv -t /path/to/destination {} + # Find Files and Move to Another Directory

find /path/to/search -type f -exec sed -i 's/oldstring/newstring/g' {} + # Find and Replace in Files

find /path/to/search -type f -mtime -7 -exec tar -czvf archive.tar.gz {} + # Find Recently Modified Files and Archive

## Example: identify any file (not directory) modified in the last day, NOT owned by the root 
user and execute ls -l on them:
find /path/to/search -type f -mtime -1 ! -user root -exec ls -l {} \;




```











### Variables

#### PowerShell

```

```

#### CMD

```

```

#### \*NIX

```
# environment variables
printenv

# show a list including the shell variables and environment variables
( set -o posix ; set ) | less

```










### Metadata

#### PowerShell

```
# retrieve detailed information about a single file 
Get-Item FILE | Format-List *


# Get last write time from file
[datetime](Get-ItemProperty -Path '.\example.txt' -Name LastWriteTime).lastwritetime


# list all attributes of a file/dir
Get-ItemProperty -Path "path\to\dir\or\file" -Name Attributes


"{0:N2}" -f ((dir -Recurse | measure -Property Length -sum).sum / 1MB)
ls | Select-Object Name, @{Name="MegaBytes";Expression={$_.Length / 1MB}}
ls | Select-Object Name, @{Name="KiloBytes";Expression={$_.Length / 1KB}}

# Get the size of a file
(Get-Item myfile.txt).Length
# bytes
(Get-ChildItem -Path "path/to/dir" -Recurse | Measure-Object -Property Length -Sum).Sum
# megabytes
(Get-ChildItem -Path "path/to/dir" -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
# gigabytes
(Get-ChildItem -Path "path/to/dir" -Recurse | Measure-Object -Property Length -Sum).Sum / 1GB


# Get the number of linelines in a file
(Get-Content myfile.txt | Measure-Object -Line).Lines

# Get the number of words in a file
(Get-Content myfile.txt | Measure-Object -Word).Words

```

#### CMD

```
REM get size of file
dir file


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
du -bch

# shows how much disk space you have left on the current drive and then tells you how much every file/directory takes up
df -h .; du -sh -- * | sort -hr



# force ls command to display file size in MB
ls -l --block-size=M




ls -i # displays inode number which uniquely identifies each file in the file system
stat file
stat -f %Sm file
stat -f '%z' file

file exampleFile.txt # determine file type
od

# characters in file
wc -c < file
wc -c file | awk '{print $1*8}' #bits

# Get the number of linelines in a file
wc -l file


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

# search for "TTP" and "TTPS" but exclude instances like "HTTP" or "HTTPS" - `\b` is boundary and ensures that "TTP" and "TTPS" are matched as whole words and not as part of other words
Get-ChildItem -Recurse | Select-String -Pattern "\bTTPS?\b"


# output the name of the files containing the match
Get-ChildItem -Recurse | Select-String -Pattern "string" | Select-Object -ExpandProperty Path -Unique



Get-ChildItem -Recurse | Where-Object { ! $_.PSIsContainer -and ($_.Extension -eq '' -or $_.Extension -eq '.txt') } | Select-String -Pattern "string" | Select-Object -ExpandProperty Path

# file name
Get-ChildItem -Path '.' | Where-Object { $_.Name -match 'word*' }
Get-ChildItem -Path 'C:\path\to\search' -Recurse | Where-Object { $_.Name -match 'regex_pattern' }
Get-ChildItem -Path '.' -Recurse | Where-Object { $_.Name -match '^file.*\.txt$' }
Get-ChildItem -Path '.' -Recurse | Where-Object { $_.Name -match 'word*' }




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
grep -ri "foO bAr qUx" # case insensitive

# output the name of the files containing the match
grep -l "pattern" file1 file2 file3

# search string in specific file
grep "string" /path/to/file/example.db

# match filename
find /path/to/dir -name "*.txt"
find /path/to/dir -name "*.txt" -size +1M # large files criteria
find /path/to/search -type f -name '*pattern*' | grep 'regex_pattern'

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


# Create file with content from clipboard
Get-Clipboard | Set-Content filename

"Hello, this is the content." | Set-Content -Path "C:\path\to\file.txt"
Add-Content # to append	
Get-Content -Path "file1" | Add-Content -Path "file2"

# Multiline string
"Hello,`n(This is line number 2) because...`nthis is the way to have multine in Powershell.`nThe end (line 4)" | Set-Content foo.txt


# Create file of specific size
$filename = "1MBFile.txt"
$sizeInBytes = 1MB
$content = 'A' * $sizeInBytes
Set-Content -Path $filename -Value $content

sc filename.txt -Value ('A' * 1MB) # oneliner



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

# Delete temporary files
del /q /f /s %temp%\*
del /q /f /s C:\Windows\temp\*




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
echo jaja>test.txt
copy nul file.txt > nul


REM Create file of specific size
fsutil file createnew example.txt 1048576

REM Merge two files
type file1.txt file2.txt > merged.txt


REM Create directory
mkdir DIR

REM Delete
RMDIR directory
RMDIR /S /Q directory
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

# Create file of specific size
dd if=/dev/zero of=1MBFile.txt bs=1M count=1
base64 /dev/urandom | head -c 1048576 > 1MBFile.txt



# Create file with content from clipboard
cat > file << EOF #paste + Enter + EOF

pbpaste > file # macOS


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


# idea to move long path items (1)
$sourcePath = "C:\long\path\origin"
$destinationPath = "D:\another\path\destination"
$filesToMove = @("file1", "file2")
foreach ($file in $filesToMove) {
    Move-Item -Path "$sourcePath\$file" -Destination $destinationPath
}


# idea to move long path items (2)
$sourcePath = "C:\long\path\origin"
$destinationPath = "D:\another\path\destination"
Move-Item -LiteralPath "$sourcePath\file1", "$sourcePath\file2" -Destination $destinationPath
<# Note:
	after you write $sourcePath\ you can press tab and the variable automatically show its content (C:\long\path\origin)
	it's a nice feature
#>






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






### Compression / ZIP / Encryption

TAR files retains permission and ZIP may not

`binwalk`: tool for searching binary images for embedded files and executable code





#### 7-Zip commands <https://7-zip.org/>
```
7z l -slt file.zip

7z x *.zip -o* # extracts all *.zip archives to subfolders with names of these archives.
```





#### PowerShell

```
# Unzip files
Expand-Archive	

```

#### CMD

```


REM Compress and "disguise" as an image. Example:
	>dir
	test1.txt
	test2.txt
	first.zip &REM test1.txt and test2.txt zipped
	img.png
	>copy /b img.png+first.zip second.png &REM now second.png is a zipped dir that seems like a png ;)



compact
REM Displays or alters the compression of files or directories on NTFS partitions. If used without parameters, compact displays the compression state of the current directory and any files it contains.


cipher
REM cipher is not supported on Home editions of Windows as it uses the Encrypting File System (EFS)



```

#### \*NIX

```

# Zip directory
zip -r myzipfile my_folder_name


# tar
tar cvzf backup.gz exampleDir/
tar -xvf backup.gz


```






### Hide File

#### PowerShell

```


```

#### CMD

```
REM Hide
attrib +h +s +r .
REM Unhide
attrib -h -s -r .

```

#### \*NIX

```


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


# run as administrator
Start-Process powershell -Verb runas
start powershell -Verb runas

# tell whether it's an elevated permision terminal session
# 1 - Returns "True" if elevated
(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# 2 - workaround (if NOT elevated returns: "Access is denied.")
net session # cmd







whoami /USER # cmd
whoami /priv # cmd / see privileges
net user # cmd
Get-LocalUser
Get-LocalUser | Format-Table Name, Enabled, LastLogon
net user john | findstr /B /C:"Last logon"

Get-LocalUser | Sort-Object -Property Enabled | Format-Table Name, Enabled, LastLogon
sl $env:SystemDrive/users # go to Users directory

# enable/disable the built-in Administrator:
net user administrator /active:yes
net user administrator /active:no

# add/delete user
net user "username" "p@ssw0rd" /add
net user "username" /delete


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
net user john

cd %SystemDrive%\Users &REM go to Users directory

wmic useraccount where name="USER_NAME" get sid
wmic useraccount where sid="SID_NUMBER" get name

```

#### \*NIX

```

cat /etc/sudoers


# list the permissions (or privileges) granted to the current user
sudo -l


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
(Get-LocalGroupMember “Administrators”).Name

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


# list allowed commands for current user
`sudo -l`

```


























## Process Management

Microsoft Management Console `mmc.exe`. Here you can add "snap-in" (`.msc` files) 

# Lista all MSC files in Windows
`Get-ChildItem -Path C:\Windows\system32\* -Include *.msc | Sort-Object -Property Extension | Select-Object -Property Name | Format-Wide -Column 1`



`services.msc`


Task Manager
Event ViewerI
procexp.exe (Sysinternals)

Control Panel

Windows Tools (since Windows 11, previously Administrative Tools)






### Utilities

#### PowerShell

```

# get executable location
(Get-Command [PROGRAM NAME.exe]).Path

where.exe example.exe


ps # alias
Get-Process
Get-Process -Id [PID]

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







```

#### \*NIX

```

ps fax



jobs # list jobs
kill %1 # kill job by number





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






















## Networking

### Settings

#### Windows
Control Panel\Network and Internet\Network and Sharing Center

`control.exe /name Microsoft.NetworkAndSharingCenter`

`explorer.exe ms-settings:network-status`



#### Linux
`/etc/resolv.conf`
`/etc/hosts`













### []

#### PowerShell

```

```

#### CMD

```

```

#### \*NIX

```

```








