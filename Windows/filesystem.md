# WINDOWS Filesystem

- <https://en.wikipedia.org/wiki/Drive_letter_assignment>

FAT
FAT 32
HPFS
NTFS








## OS

%SYSTEMROOT% / $env:SystemRoot
%windir%

C:\Windows

C:\Windows\System32
C:\Windows\SysWOW64
C:\Windows\WinSxS
















## Programs



C:\Program Files (x86)
%ProgramFiles(x86)%
${env:ProgramFiles(x86)}

C:\Program Files
%ProgramFiles%
$env:ProgramFiles




## %PROGRAMDATA% / $env:ProgramData
C:\ProgramData

This folder has most in common with the Application Data folders, but---instead of having an individual folder for each user---the ProgramData folder is shared among all the user accounts on your PC.

Most programs use this as a caching location for data that should be available to all users, or to configure some basic settings.


On Windows XP, there was no C:\ProgramData folder. Instead, there was a "C:\Documents and Settings\All Users\Application Data" folder. Starting with Windows Vista, the All Users application data folder was moved to C:\ProgramData.








## User

### %APPDATA% / $env:AppData
C:\Users\[USERNAME]\AppData\Roaming

Contain per-user application data.

On a domain network, the files and subfolders under the "Roaming" directory are synced to other devices if you log in to your account on a different computer on the same domain.

The "Local" folder under "Appdata" doesn't roam to other devices. They're stored on the local machine.

The LocalLow folder is indeed where low-integrity apps store their data, and it’s more restrictive compared to Local and Roaming. It’s mainly used for apps that run with tighter security controls, which is why you’ll see browsers and certain Office apps writing here. Low-integrity apps can't write to the "Local" or "Roaming" folders.











## Junction Point
Junctions can be used only for the creation of links to folders, either on the same drive or different drives, but only if those drives are on the local system.


C:\Documents and Settings

```
dir /AL
dir /AL "C:\Path\To\Directory"


fsutil reparsepoint query "C:\Path\To\Directory"

junction.exe
```



https://en.wikipedia.org/wiki/NTFS_reparse_point