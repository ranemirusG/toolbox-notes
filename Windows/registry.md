# Windows Registry

C:\Windows\regedit.exe

Is a collection of databases of configuration settings for Microsoft Windows operating systems.


The registry contains:
1) REGISTRY VALUES -which are instructions- located within 2)REGISTRY KEYS -folders that contain more data-, all within one of several 3) REGISTRY HIVES -folders that categorize all the data in the registry using subfolders.

Making changes to these values and keys change the configuration that a particular value controls.



## Registry Values
The Windows Registry is full of objects called values that contain specific instructions that Windows and applications refer to.

Many kinds of registry values exist, all of which are explained below. They include string values, binary values, DWORD (32-bit) values, QWORD (64-bit) values, multi-string values, and expandable string values.


## Registry Keys
A registry key can be thought of as being a bit like a file folder, but it exists only in the Windows Registry. Registry keys contain registry values, just like folders contain files. Registry keys can also contain other registry keys, which are sometimes referred to as subkeys.


## Registry Hives
A hive in the Windows Registry is the name given to a major section of the registry that contains registry keys, registry subkeys, and registry values.

All keys that are considered hives begin with "HKEY" and are at the root, or the top of the hierarchy in the registry, which is why they're also sometimes called root keys or core system hives.

To use a more common term, a hive is like a starting folder in the registry. Everything in the registry is ultimately contained in various hives.




## Registry value types
- <https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry-value-types>











Windows registry hives are stored in `C:\Windows\System32\config`

Inside this directory we can find the primary hives, such as SECURITY, SOFTWARE, and SYSTEM:

```
cd $env:SystemRoot\system32\config
cd %SystemRoot%\System32\Config
```

- Usernames and Password
C:\Windows\System32\config\SAM

- Security Log
C:\Windows\System32\config\SECURITY

- Software Log 
C:\Windows\System32\config\SOFTWARE

- System Log
C:\Windows\System32\config\SYSTEM







Commands:

```

# View properties of a specific key
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion"


reg query HKCU
reg query "HKCU\Software"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt" /s


reg query HKLM
reg query HKCR
reg query HKU
reg query HKCC



Get-PSDrive -PSProvider Registry


Get-ChildItem -Path HKLM:\
Get-ChildItem -Path HKCU:\
Get-ChildItem -Path HKCR:\
Get-ChildItem -Path HKU:\
Get-ChildItem -Path HKCC:\
```
