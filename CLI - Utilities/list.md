# List



## bash/zsh

```
# list as comma separated
ls | paste -sd ", "



# list open files (lsof), including network connections
lsof


# force ls command to display file size in MB
ls -l --block-size=M

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



# list directories only
ls -l | grep '^d'
ls -d .* # only hidden directories
find . -maxdepth 1 -type d | wc -l

```




## cmd

```

# list as comma separated
(for %i in (*.*) do @echo|set /p="%i, ") & echo.


TREE
TREE /F
tree /F C:\Users

dir /ad &REM only directories
dir/a-d &REM only files

dir /A-D /S /B  &REM recursive with list formatted output

ATTRIB file

# list directories only
dir /d
dir /ad





```



## PowerShell

```


# list as comma separated
(Get-ChildItem | ForEach-Object { $_.Name }) -join ", "




Get-ChildItem
gci
(gci | % { $_.Name }) -join ' '
ls # unix alias




dir | ?{!$_.PSIsContainer} | %{$_.Name}
dir -file | % Name
# Alias           % -> ForEach-Object
# Alias           ? -> Where-Object




# list directories
Get-ChildItem -Directory -Force
gci -dir
ls -directory
gci | where {$_.PsIsContainer}
dir | Where-Object {$_.PsIsContainer}

# list first n files from dir
Get-ChildItem -Path "C:\MyDirectory" | Select-Object -First 10
gci | select -First 10
## sorted by date
Get-ChildItem -Path "DirectoryPath" -File | Sort-Object -Property LastWriteTime | Select-Object -First 10
## sorted by name
Get-ChildItem -Path "DirectoryPath" -File | Sort-Object -Property Name | Select-Object -First 10




# list empty directories
dir -Directory -Recurse | where { $_.GetFileSystemInfos().Count -eq 0 }


# list, sort, show first 5 elements
dir | sort | select -first 5

# list file with creation time
dir -file | sort CreationTime | Format-Table Name, CreationTime
gci | sort CreationTime
gci | sort CreationTime -desc

# sort by modification time
gci "C:\Your\Directory\Path" | sort LastWriteTime


# list file with last write time greater than 24 hours ago
dir -file -recurse | where {$_.LastWriteTime -gt (Get-Date).AddDays(-1)}

# list files whose creation date is greater than a given date
dir -file -recurse | where { $_.CreationTime -gt [datetime]"2014/05/28" } | sort CreationTime | Format-Table Name, CreationTime



Get-ChildItem -File -Recurse
dir -recurse | fl
dir -Directory -Recurse | ForEach-Object { $_.fullname }





# retrieve detailed information about a single file 
Get-Item FILE | Format-List *


# Get last write time from file
[datetime](Get-ItemProperty -Path '.\example.txt' -Name LastWriteTime).lastwritetime


# list all attributes of a file/dir
Get-ItemProperty -Path "path\to\dir\or\file" -Name Attributes


# check if file/folder exist
test-path C:\path\file

```