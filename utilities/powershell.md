# PowerShell

## Resources
- <https://4sysops.com/tag/powershell/>
- <https://powershellmagazine.com/>
- <https://activedirectorypro.com/>
- <https://www.thewindowsclub.com/>




Powershell version

$PSVersionTable.PSVersion




Use the `Get-Alias` cmdlet to list the aliases available in the environment.

Run CMD commands in PowerShell:

cmd.exe /c "[command]"


Run bash commands in PowerShell:

- <https://learn.microsoft.com/en-us/windows/wsl/about>


bash -c "[command]"
wsl ls -lh



To start a cmd or bash interpreter in PowerShell just type `cmd` or `bash`.



Tell wheter is CMD or PowerShell:

(dir 2>&1 *`|echo CMD);&<# rem #>echo PowerShell




## History
Get-History
ghy
h

Get-History | Format-Table Id, StartExecutionTime, CommandLine # With timestamp


type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
gc C:\users\*\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
type C:\Users\sathvik\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt 

(Get-PSReadlineOption).HistorySavePath # displays the path of consoleHost_history.txt



## Help


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














### List and read
Get-ChildItem
gci
(gci | % { $_.Name }) -join ' '
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









gci env:












### Metadata


# retrieve detailed information about a single file 
Get-Item FILE | Format-List *


# Get last write time from file
[datetime](Get-ItemProperty -Path '.\example.txt' -Name LastWriteTime).lastwritetime


# list all attributes of a file/dir
Get-ItemProperty -Path "path\to\dir\or\file" -Name Attributes


"{0:N2}" -f ((dir -Recurse | measure -Property Length -sum).sum / 1MB)
ls | Select-Object Name, @{Name="MegaBytes";Expression={$_.Length / 1MB}}
ls | Select-Object Name, @{Name="KiloBytes";Expression={$_.Length / 1KB}}

# Get the size of a file / Get file size
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






# get executable location
(Get-Command [PROGRAM NAME.exe]).Path



























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












