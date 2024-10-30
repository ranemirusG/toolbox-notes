# Help






## bash/zsh
```

info [COMMAND]
whatis [COMMAND]

man [COMMAND]
# perform a keyword search
apropos [KEYWORD]
man -k [KEYWORD]
man -k '^passwd$'
# look at the exact  manual page
man 5 passwd
man [PAGE] [COMMAND]

```





## cmd
```
command /?
help <command>
help &REM list all commands

```





## Powershell

```
help [COMMAND] # simpler way


# specific about_* topic (aka. man page)
Get-Help -Name about_Variables

# specific PowerShell function
Get-Help -Name Get-Command

# specific parameter on a specific command
Get-Help -Name Get-Command -Parameter Module

# list all the commands available to PowerShell (native binaries in $env:PATH + cmdlets / functions from PowerShell modules)
Get-Command

# list of all the PowerShell commands exported from modules named Microsoft*
Get-Command -Module Microsoft*

# list of all commands (native binaries + PowerShell commands) ending in "foo"
Get-Command -Name *foo
```