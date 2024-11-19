# Filename


## bash/zsh

```

# get full path of filename
realpath file

# Copy filename
basename file | clip
```





## cmd
```
# get full path of filename
for %i in ("[FILENAME]") do @echo %~fi
for %i in ("*foo*") do @echo %~fi




```





## PowerShell
```
# get full path of filename
Resolve-Path [FILE]

# return just the file name
Split-Path -Leaf path\to\file
```