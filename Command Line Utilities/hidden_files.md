# Hidden files


## bash/zsh






## cmd

```

# Hide File

REM Hide
attrib +h +s +r .
REM Unhide
attrib -h -s -r .

```




## PowerShell

```
Get-ChildItem -Force # show hidden files
```