# Data compression


- <https://www.xitalogy.com/linux-unix/2020/02/06/using-tar-to-archive-extract-compress-uncompress-files.html>


`tar` IS NOT a compression algorithm. Is short for Tape Archive, and is used to create archive files. In short, a single file that consists of one or more files. It is used to bundle files together so that they can be compressed by a compressor that is only able to compress a single file.
- <https://unix.stackexchange.com/questions/322746/7zip-xz-gzip-tar-etc-what-are-the-differences>



## Powershell

```
Expand-Archive -Path ".\archive.zip" -DestinationPath "path/to/dir"
Expand-Archive -Path ".\archive.zip" -DestinationPath "path/to/dir" -Force

# Using .NET Classes
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\full\path.zip", "C:\full\path\to\dest")






```


## zip

```
zip --encrypt protected.zip file.txt


unzip filename.zip -d /path/to/destination_directory


```

## gzip


## bzip2




## 7zip

### Extract

`7z.exe x .\file.7z`

`7z x backup.zip -o./backup`


### show technical information

For example if it's encrypted
```
$ 7z l -slt backup.zip
...
Attributes = _ -rw-r--r--
Encrypted = +
Comment = 
CRC = 
Method = AES-256 Deflate
Host OS = Unix
Version = 51
Volume Index = 0
...
```




