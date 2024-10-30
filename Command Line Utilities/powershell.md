# PowerShell

# change directory
Set-Location path/to/dir
sl
cd path/to/dir/ # cmd and unix

cd hkcu:
cd hklm:


pwd # unix alias
Get-Location
gl
dir # cmd
[System.Environment]::CurrentDirectory




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




# check if file/folder exist
test-path C:\path\file




# Search file by name
Get-ChildItem -Path "C:\Path\To\Directory" -Filter "example.txt"

Get-ChildItem -Path "C:\Path\To\Directory" -Recurse -Filter "example.txt"

Get-ChildItem -Path "C:\Path\To\Directory" -Recurse -File | Where-Object { $_.Name -like "*example*" }




# Search for files in directory which have been modified in the last 24 hs
Get-ChildItem -Recurse | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-1) }
# Search for files in directory which have been modified between two dates
Get-ChildItem -File | Where-Object { $_.CreationTime -ge '2023-09-01' -and $_.CreationTime -le '2023-09-04' -or $_.LastWriteTime -ge '2023-09-01' -and $_.LastWriteTime -le '2023-09-04' }









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




# Empty Recycle Bin
Clear-RecycleBin

# Delete temporary files
del /q /f /s %temp%\*
del /q /f /s C:\Windows\temp\*