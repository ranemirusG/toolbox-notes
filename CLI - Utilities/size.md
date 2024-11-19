# Size

- <https://superuser.com/questions/66825/what-is-the-difference-between-size-and-size-on-disk>

- <https://discussions.apple.com/thread/5501534>


## Tools
- ExifTool
- Windows File Explorer: View > see details



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
- <https://www.youtube.com/watch?v=Stfubfj24q0>



```



$shell = New-Object -ComObject Shell.Application
$file = $shell.Namespace((Get-Item "C:\path\to\image.jpg").DirectoryName).ParseName((Get-Item "C:\path\to\image.jpg").Name)
$file.ExtendedProperty("System.Image.Dimensions")






```