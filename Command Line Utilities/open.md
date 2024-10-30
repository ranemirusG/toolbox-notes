# Open files

## bash/zsh






## cmd





## PowerShell
```

# Open all files in current dir with it default program
gci|ii

# Open all pdf files in current dir
Get-ChildItem -Filter *.pdf | ForEach-Object { Invoke-Item $_.FullName }

```