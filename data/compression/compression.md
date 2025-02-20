# Data compression

- <https://www.xitalogy.com/linux-unix/2020/02/06/using-tar-to-archive-extract-compress-uncompress-files.html>






## Powershell

```
Expand-Archive -Path ".\archive.zip" -DestinationPath "path/to/dir"
Expand-Archive -Path ".\archive.zip" -DestinationPath "path/to/dir" -Force

# Using .NET Classes
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\full\path.zip", "C:\full\path\to\dest")


```


## CMD

```

REM Compress and "disguise" as an image. Example:
	>dir
	test1.txt
	test2.txt
	first.zip &REM test1.txt and test2.txt zipped
	img.png
	>copy /b img.png+first.zip second.png &REM now second.png is a zipped dir that seems like a png ;)



compact
REM Displays or alters the compression of files or directories on NTFS partitions. If used without parameters, compact displays the compression state of the current directory and any files it contains.


cipher
REM cipher is not supported on Home editions of Windows as it uses the Encrypting File System (EFS)


```









## zip

```
zip zippedFile.zip fileToZip.php

zip --encrypt protected.zip file.txt


unzip filename.zip -d /path/to/destination_directory


7z x *.zip -o* # extracts all *.zip archives to subfolders with names of these archives.

7z l -slt file.zip


```






## gzip

Compress:
```
gzip file1 file2 file3

```



Uncompress:
```
gzip -d [FILE]

gunzip filename.gz

```


View contents without uncompressing:
```
zcat filename.gz
```





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











## tar
`tar` IS NOT a compression algorithm. Is short for Tape Archive, and is used to create archive files. In short, a single file that consists of one or more files. It is used to bundle files together so that they can be compressed by a compressor that is only able to compress a single file.
- <https://unix.stackexchange.com/questions/322746/7zip-xz-gzip-tar-etc-what-are-the-differences>


```
# Uncompress / Extract
tar -xf file.tar

tar xvf [file] -C [DEST]

# List content without extracting
tar -tf file.tar










```