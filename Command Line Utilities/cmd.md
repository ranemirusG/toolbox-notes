# CMD commands



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
FINDSTR /si password *.config 
findstr /si pass/pwd *.ini  

dir /s *pass* == *cred* == *vnc* == *.config*  

in all files  
findstr /spin "password" *.*  
findstr /spin "password" *.*


REM match filename in the directory tree.
dir /s /b *foo*







REM Empty Recycle Bin
rd /s %systemdrive%\$Recycle.bin

REM Rename files
ren old new
rename old new






### Hide File

REM Hide
attrib +h +s +r .
REM Unhide
attrib -h -s -r .

