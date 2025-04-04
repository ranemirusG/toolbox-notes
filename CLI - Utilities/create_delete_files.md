# Create files / Delete files






## bash/zsh

```
# Create
touch file
echo "foo" > file
mkdir
mkdir -p ~/nested/path/to/dir/

# Create file of specific size
dd if=/dev/zero of=1MBFile.txt bs=1M count=1
base64 /dev/urandom | head -c 1048576 > 1MBFile.txt



# Create file with content from clipboard
cat > file << EOF #paste + Enter + EOF

pbpaste > file # macOS




# Delete
rm file
rm -rf /path/to/dir # delete directory recursively

```


## Windows
Permantently delete: `Shift + Del`


## cmd
```
REM Create new file
copy NUL EmptyFile.txt
copy /b NUL EmptyFile.txt
echo. 2>EmptyFile.txt
echo jaja>test.txt
copy nul file.txt > nul


REM Create file of specific size
fsutil file createnew example.txt 1048576

REM Merge two files
type file1.txt file2.txt > merged.txt






REM Go to Recycle Bin
CD \$Recycle.Bin
REM then list the contents with:
DIR /A /S

dir /s/a C:\$Recycle.Bin


REM Empty Recycle Bin
rd /s %systemdrive%\$Recycle.bin


REM Open Recycle Bin
start ::{645FF040-5081-101B-9F08-00AA002F954E}
explorer ::{645FF040-5081-101B-9F08-00AA002F954E}

```


### Copy clipboard to file

1. create VBS script
```
Set objHTML = CreateObject("htmlfile")
text = objHTML.ParentWindow.ClipboardData.GetData("Text")
WScript.StdOut.Write text
```


2. run
```
cscript //nologo clipboard.vbs > output.txt
```

- `cscript` runs the VBScript in the command line.
- `//nologo` suppresses the banner that typically appears when running scripts.






## PowerShell

```
# Create an empty file
New-Item -Path c:\dir\file.txt
New-Item file
ni file
ni file | Out-Null # without output message	
Set-Content -Path c:\test.txt -Value ''


# Create an empty file using .NET Base Class Library
[System.IO.File]::WriteAllText('testing.txt', '')


# Create file with content from clipboard
Get-Clipboard | Set-Content filename

"Hello, this is the content." | Set-Content -Path "C:\path\to\file.txt"
Add-Content # to append	
Get-Content -Path "file1" | Add-Content -Path "file2"

# Multiline string
"Hello,`n(This is line number 2) because...`nthis is the way to have multine in Powershell.`nThe end (line 4)" | Set-Content foo.txt


# Create file of specific size
$filename = "1MBFile.txt"
$sizeInBytes = 1MB
$content = 'A' * $sizeInBytes
Set-Content -Path $filename -Value $content

sc filename.txt -Value ('A' * 1MB) # oneliner



# Delete a file using .NET Base Class Library
[System.IO.File]::Delete('testing.txt')



# delete file by name
Get-ChildItem -Path "DirectoryPath" -File | Where-Object { $_.Name.StartsWith('.trashed') } | Remove-Item



# Delete temporary files
del /q /f /s %temp%\*
del /q /f /s C:\Windows\temp\*





# Empty Recycle Bin
Clear-RecycleBin

# Open Recycle Bin
start shell:RecycleBinFolder


# List items in Recycle Bin
$Shell = New-Object -ComObject Shell.Application
$RecycleBin = $Shell.Namespace(0xA) # Recycle Bin folder
$RecycleBin.Items() | ForEach-Object {
    [PSCustomObject]@{
        Name         = $_.Name
        OriginalPath = $_.Path
        DateDeleted  = $_.ExtendedProperty("System.DateDeleted")
    }
}


# Restore from Recycle Bin
https://stackoverflow.com/questions/69110357/how-to-restore-specific-or-last-deleted-files-from-recycle-bin-using-powershell

$objShell = New-Object -ComObject Shell.Application
$objRecycleBin = $objShell.Namespace(0xA)
$RecycledItems = $objRecycleBin.Items()
Function Get-RecycledItems
{
foreach ($RecycledItem in $RecycledItems)
    {
    $Name = $RecycledItem.Name
    $DateDeleted = $RecycledItem.ExtendedProperty("System.Recycle.DateDeleted")
    $OriginalLocation = $RecycledItem.ExtendedProperty("System.Recycle.DeletedFrom")
    $RecycledTable = [ordered]@{'Name'=$Name;'DateDeleted'=$DateDeleted;'OriginalLocation'=$OriginalLocation}
    $RecycledObject = New-Object -TypeName PSObject -Property $RecycledTable
    Write-Output -InputObject $RecycledObject
    }
}
$LatestItem = Get-RecycledItems | Sort-Object DateDeleted | Select-Object -Last 1
$Undelete = $objRecycleBin.Items() | Where-Object {$_.Name -like $LatestItem.Name}
$Undelete.InvokeVerb("undelete")



```