# Shell





## bash/zsh





## cmd

### Tell wheter is CMD or PowerShell
```
(dir 2>&1 *`|echo CMD);&<# rem #>echo PowerShell
```





## PowerShell

Version
```
$PSVersionTable.PSVersion
```


### Run CMD commands in PowerShell:
```
cmd.exe /c "[command]"
```


### Run bash commands in PowerShell:

- <https://learn.microsoft.com/en-us/windows/wsl/about>

```
bash -c "[command]"
wsl ls -lh
```


To start a cmd or bash interpreter in PowerShell just type `cmd` or `bash`.
