# Search


## bash/zsh

```


# Search file by name
find /path/to/directory -name "example.txt"
find /path/to/directory -iname "*example*.txt"
find /path/to/directory -name "*example*.txt" ! -name "*.log"

```







## cmd
```

REM Search file by name
dir "*example*.txt" /s
dir "C:\Path\To\Directory\example.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s /a
for /r "C:\Path\To\Directory" %i in (*example*.txt *test*.txt) do @echo %i
```







## PowerShell