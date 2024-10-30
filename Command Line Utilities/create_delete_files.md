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

```











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





```