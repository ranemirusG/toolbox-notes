# Copy / Move

## bash/zsh

```

# Copy filename
basename file | clip



# Copy dir
pwd | pbcopy # macOS


```




## cmd
```

copy
move /Y "C:\Source" "D:\Destination"

# copy directory path to clipboard
cd | clip

```




## PowerShell

```


Copy-Item
copy # cmd
Copy-Item -Path "C:\Source" -Destination "D:\Destination" -Recurse

Move-Item
move
mv


# idea to move long path items (1)
$sourcePath = "C:\long\path\origin"
$destinationPath = "D:\another\path\destination"
$filesToMove = @("file1", "file2")
foreach ($file in $filesToMove) {
    Move-Item -Path "$sourcePath\$file" -Destination $destinationPath
}


# idea to move long path items (2)
$sourcePath = "C:\long\path\origin"
$destinationPath = "D:\another\path\destination"
Move-Item -LiteralPath "$sourcePath\file1", "$sourcePath\file2" -Destination $destinationPath
<# Note:
	after you write $sourcePath\ you can press tab and the variable automatically show its content (C:\long\path\origin)
	it's a nice feature
#>






# Move all files under the SOURCE directory to the DEST directory you can do this:
Get-ChildItem -Path SOURCE -Recurse -File | Move-Item -Destination DEST

If you want to clear out the empty directories afterwards, you can use a similar command:
Get-ChildItem -Path SOURCE -Recurse -Directory | Remove-Item








# copy directory path to clipboard
Resolve-Path 'path/to/dir' | Select-Object -ExpandProperty Path | Set-Clipboard



```