

## bash/zsh

```

stat [FILE]
stat -c %Sm file # Displays formatted modification time


# inode number for each file
ls -i


od

```



## cmd
```
REM Modification time
forfiles /M exampleFile.txt /C "cmd /c echo @fdate @ftime"




certutil -dump "exampleFile.txt"

certutil -encodehex "exampleFile.txt" stdout
```




## PowerShell