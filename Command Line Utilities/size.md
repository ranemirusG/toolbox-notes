# Size


## bash/zsh

```

# force ls command to display file size in MB
ls -l --block-size=M

# Size of current directory
du -sk . # in KB
du -ah
ls -A -R -g -o "$@" | awk '{n1 += $3} END {print n1}'
du -sch
du -hd 1 # the number is the depth of directory levels to be displayed
du -bch

# shows how much disk space you have left on the current drive and then tells you how much every file/directory takes up
df -h .; du -sh -- * | sort -hr
```




## cmd
```

REM get size of file
dir file
```




## PowerShell