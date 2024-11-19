# History


## bash/zsh

```
history # to see timestamp set: HISTTIMEFORMAT="%F %T " or HISTTIMEFORMAT="%y-%m-%d %T "

history 10 # last 10 commands

![INDEX number]

```












## Windows
shell:History
shell:Recent



## cmd

```
doskey /history
doskey /history | clip
```

`F7` Key for Command History Menu

`F8` Key for cycling throufh commands

`F9` Key to Run a Command by Number







## PowerShell
```
Get-History
ghy
h

Get-History | Format-Table Id, StartExecutionTime, CommandLine # With timestamp


Invoke-History
ihy [INDEX]



type %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
gc C:\users\*\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
type C:\Users\sathvik\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt 

(Get-PSReadlineOption).HistorySavePath # displays the path of consoleHost_history.txt
```