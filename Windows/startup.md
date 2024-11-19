# Registry Run Keys / Startup Folder


## log
Event ID 4657 - A registry value is changed.



## autoruns.exe (Sysinternals)
In the “Logon” and “Explorer” tabs, we can view the registry values.

If there are a high number of registry values in front of us, in order to save time, we can start by examining the registry values that do not have any values in the “Description” and “Publisher” sections.



## Registry Run Keys

The following run keys are created by default on Windows systems:

- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce
- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run
- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce

<https://learn.microsoft.com/en-us/windows/win32/setupapi/run-and-runonce-registry-keys>



The following Registry keys can be used to set startup folder items for persistence:

- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserShellFolders
- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ShellFolders
- HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellFolders
- HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserShellFolders



The following Registry keys can control automatic startup of services during boot:

- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices Once
- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices Once
- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices
- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices



Using policy settings to specify startup programs creates corresponding values in either of two Registry keys:

- HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
- HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run







## Startup

Windows All User Startup
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup

Windows User Startup
C:\Users\[USERNAME]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

Windows XP All User Startup
C:\Documents and Settings\All Users\Start Menu\Programs\Startup\