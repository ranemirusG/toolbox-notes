# Environment variables

## bash/zsh
```


# environment variables
printenv

# show a list including the shell variables and environment variables
( set -o posix ; set ) | less




# tell whether you are using XFCE, GNOME, or another desktop
echo $XDG_CURRENT_DESKTOP


env | grep DESKTOP_SESSION


ps -e | grep -E "xfce|gnome"

dpkg -l | grep -E "xfce4|gnome-shell"


```




## cmd

```
set

>echo %comspec%
C:\WINDOWS\system32\cmd.exe

PROMPT "new prompt >>>"
```





## PowerShell
Use the `Get-Alias` cmdlet to list the aliases available in the environment.

```
gci env:
```