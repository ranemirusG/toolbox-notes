# Create directories / Delete directories




## bash/zsh







## cmd

```

REM Create directory
mkdir DIR

REM Delete
RMDIR directory
RMDIR /S /Q directory
ERASE file

```






## PowerShell

```
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

```