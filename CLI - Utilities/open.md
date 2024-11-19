# Open files

## bash/zsh






## cmd
```


REM open current dir in File Explorer
explorer .
start .


```




## PowerShell
```

# Open all files in current dir with it default program
gci|ii

# Open all pdf files in current dir
Get-ChildItem -Filter *.pdf | ForEach-Object { Invoke-Item $_.FullName }

```