# Search


## bash/zsh

```


# Search file by name
ls -l /path/to/file/*foo* 

find /path/to/directory -name "example.txt"
find /path/to/directory -iname "*example*.txt"
find /path/to/directory -name "*example*.txt" ! -name "*.log"
find /path/to/dir -name "*.txt"
find /path/to/dir -name "*.txt" -size +1M # large files criteria
find /path/to/search -type f -name '*pattern*' | grep 'regex_pattern'




# Search for files in directory which have been modified in the last 24 hs
find /directory -mtime 0


# Search for files in directory which have been modified between two dates
find . -type f \( -newermt '2023-09-01' -a ! -newermt '2023-09-05' \)



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








grep -r string
grep -r "string with spaces"
grep -ri "foO bAr qUx" # case insensitive

# output the name of the files containing the match
grep -l "pattern" file1 file2 file3

# search string in specific file
grep "string" /path/to/file/example.db




```







## cmd
```

REM Search file by name
dir "*example*.txt" /s
dir "C:\Path\To\Directory\example.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s /a
for /r "C:\Path\To\Directory" %i in (*example*.txt *test*.txt) do @echo %i





dir /s pass == cre .config .txt
dir /b
dir \wordpad.exe /b /s /a:
wmic services list full



REM search string in specific file
type file.txt | find /n "string"




REM search every file in the current directory and all subdirectories that contains "string"

findstr /s /i string *.*
findstr /SI /M "OS{" *.xml *.ini *.txt
findstr /SI /M "HTB{" *.xml *.ini *.txt


findstr /si password *.txt
findstr /si password *.xml  
findstr /si password *.ini  
FINDSTR /si password *.config 
findstr /si pass/pwd *.ini  

dir /s *pass* == *cred* == *vnc* == *.config*  

in all files  
findstr /spin "password" *.*  
findstr /spin "password" *.*


REM match filename in the directory tree.
dir /s /b *foo*

```







## PowerShell

```



gci -force -recursive -Path 'C:\users\' -include *.txt

Get-ChildItem -Path C:\ -Include *.kdbx -File -Recurse -ErrorAction SilentlyContinue






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


```