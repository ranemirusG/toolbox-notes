# List



## bash/zsh

```

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



# list directories only
ls -l | grep '^d'
ls -d .* # only hidden directories
find . -maxdepth 1 -type d | wc -l

```




## cmd





## PowerShell

```
Get-ChildItem
gci
(gci | % { $_.Name }) -join ' '
ls # unix alias








# list directories
Get-ChildItem -Directory -Force

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







# retrieve detailed information about a single file 
Get-Item FILE | Format-List *


# Get last write time from file
[datetime](Get-ItemProperty -Path '.\example.txt' -Name LastWriteTime).lastwritetime


# list all attributes of a file/dir
Get-ItemProperty -Path "path\to\dir\or\file" -Name Attributes

```