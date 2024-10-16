# CMD commands



# CMD

- <https://ss64.com/nt/>
- <https://ss64.com/nt/syntax-variables.html>


Tell wheter is CMD or PowerShell:

(dir 2>&1 *`|echo CMD);&<# rem #>echo PowerShell




>echo %comspec%
C:\WINDOWS\system32\cmd.exe


## Comments
`REM` stands for "Remark"
See: <https://stackoverflow.com/questions/2997578/how-do-i-comment-on-the-windows-command-line>


REM [COMMENT]
&REM inline comments in this guide (after a command)
@REM echo off the comment! best option


## History
`F7` to see the command history
or `doskey /history`




## Help

command /?
help <command>
help &REM list all commands



## Misc

TITLE "foo bar" &REM Set the window title for a CMD.EXE session
PROMPT "new prompt >>>"
COLOR  &REM Sets the default console foreground and background colors
TIME
DATE






dir /s pass == cre .config .txt
dir /b
dir \wordpad.exe /b /s /a:
wmic services list full

cd &REM get current location
dir /ad &REM only directories
dir/a-d &REM only files
dir /A-D /S /B  &REM recursive with list formatted output

REM open current dir in File Explorer
explorer .
start .

TREE
TREE /F
tree /F C:\Users


REM file content
type file





REM Search file by name
dir "*example*.txt" /s
dir "C:\Path\To\Directory\example.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s
dir "C:\Path\To\Directory\*example*.txt" /s /a
for /r "C:\Path\To\Directory" %i in (*example*.txt *test*.txt) do @echo %i







### Metadata

REM get size of file
dir file


ATTRIB file

























REM search string in specific file
type file.txt | find /n "string"




REM search every file in the current directory and all subdirectories that contains "string"

findstr /s /i string *.*
findstr /SI /M "OS{" *.xml *.ini *.txt
findstr /SI /M "HTB{" *.xml *.ini *.txt




findstr /si password *.txt
findstr /si password *.xml  
findstr /si password *.ini  
Findstr /si password *.config 
findstr /si pass/pwd *.ini  

dir /s *pass* == *cred* == *vnc* == *.config*  

in all files  
findstr /spin "password" *.*  
findstr /spin "password" *.*


REM match filename in the directory tree.
dir /s /b *foo*




















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


REM Create directory
mkdir DIR

REM Delete
RMDIR directory
RMDIR /S /Q directory
ERASE file

REM Empty Recycle Bin
rd /s %systemdrive%\$Recycle.bin

REM Rename files
ren old new
rename old new













copy
move /Y "C:\Source" "D:\Destination"













### Hide File

REM Hide
attrib +h +s +r .
REM Unhide
attrib -h -s -r .

