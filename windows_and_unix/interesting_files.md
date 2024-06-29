# Interesting files


## Filesystem 'equivalences'

What's the equivalent of spark plugs in an electric car?

Windows and Linux are completely different. There are some similarities, but their approach to directory trees differs greatly.

On **Windows**, you have a few root directories called _drives_ and designated with letters. These are typically filesystem roots too. Windows has inherited this scheme from DOS.

Windows itself is usually installed on `C:`, but it's not a must. The reason why it's usually `C:` is that `A:` and `B:` are reserved for floppy drives (also due to its DOS legacy) and the installer picks first available drive letter, that is `C:`. Other than that, `C:` doesn't have any significance. It could be any other letter as well. Only `A:` and `B:` were special, but they're not anymore. You can use them if you wish. Windows will just avoid them by default.

So basically you have drives which correspond to partitions on a physical device, each having a filesystem and storing some files.

**Linux** takes a completely different approach inherited from UNIX. There's just a single root directory called `/`. It can correspond to a filesystem on a physical device, but it could as well be stored entirely in RAM. (Actually, every time Linux boots it initially loads a small filesystem into RAM, uses it to load some drivers - storage drivers in particular - and then replaces it with an on-disk filesystem, discarding the in-memory one.)

This `/` directory can contain other files and directories. Every directory can be used to _mount_ another filesystem in it. The contents of the mounted filesystem will appear as if they were contents of the directory it's mounted in, effectively creating a single directory tree that consists of multiple filesystems.

Such mounted filesystem doesn't have to be stored on a physical device too. Linux makes use of this extensively, because in the UNIX philosophy everything is a file. Devices, network sockets etc. all appear as files somewhere in the directory tree. They don't correspond to actual files on disk because that wouldn't make sense. They are provided by virtual filesystem drivers instead, which translate file reads/writes to communication with underlying devices, network target etc. So for example to print text on a printer, you could simply write to a file that represents that printer. (Reading from this file doesn't make much sense though.)

**Windows** has changed the location of its user files over time. DOS-based versions of Windows weren't designed with multiuser environments in mind, so originally there was only a single place to store user's documents. If my memory serves, it was `C:\My Documents`. Some other user-specific stuff, like list of Start menu programs, were stored in `C:\Windows` subdirectories.

NT-based versions of Windows were multiuser at their core, making use of the `C:\Users` directory. Everything that was user-specific was (expected to be) stored in its subdirectories, one for every user. In Windows XP (I think?) more special purpose directories were added inside _My Documents_: _My Pictures_, _My Music_, _My Videos_. Later, in Vista, these were moved to be stored besides _My Documents_ rather than inside it. There was also some translation-related mess that I won't go into here.

**Linux** (and Unix) took the multiuser approach from the very beginning. Each user is given a subdirectory typically under `/home` (so for example I'd get `/home/gronostaj`), although other locations can be used. All user-specific files should be stored in there. Special purpose directories are configurable and specified by the XDG standard; they're not required though.

System and program files are (theoretically) nicely segregated on **Windows**, under `C:\Windows` and `C:\Program Files`. It's not that simple in practice: advent of 64-bit CPUs introduced a muddy distinction between _Program Files_ and _Program Files (x86)_. There's also some lousy translation handling going on, plus some programs install into `%AppData%` (where only program configurations should reside by design) because there's no user-specific directory for software.

**Linux**, again, has a different take on this - rather than turn a clean original design into a mess like Windows did, Linux got a head start by using a messy design from the very beginning. Wikipedia has an article on [Filesystem Hierarchy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) which explains what should go where and how it has changed over time.





```

C drive = /

C:\Windows = /etc, /usr, /var

C:\Windows\System32 = /sbin, /dev, /lib

C:\Program files = /opt, /usr

C:\Users = /home

C:\Temp = /tmp

D drive = /media (if D is a DVD drive)

E, F, G drives = /mnt (and others)

```











## Windows

`C:\Windows\System32\drivers\etc\hosts`: DNS file
`C:\Windows\System32\drivers\etc\networks`: Network Config file

Windows registry hives are stored in C:\Windows\System32\config. Inside this directory we can find the primary hives, such as SECURITY, SOFTWARE, and SYSTEM:

`C:\Windows\System32\config\SAM`: Usernames and Password
`C:\Windows\System32\config\SECURITY`: Security Log
`C:\Windows\System32\config\SOFTWARE`: Software Log 
`C:\Windows\System32\config\SYSTEM`: System Log




`C:\Windows\System32\winevt\`:  Windows Event Logs
`C:\Windows\repair\SAM`: Backup of User and Password
`C:\Documents and Settings\All Users\Start Menu\Programs\Startup\`: Windows XP All User Startup
`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup`: Windows All User Startup
`C:\Users\[USERNAME]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`: Windows User Startup
`C:\Windows\Prefetch`: Prefetch files
`C:\Windows\AppCompat\Programs\Amcache.hve`: Amcache.hve
`C:\Windows\Users\[USERNAME]\NTUSER.dat`: NTUSER.dat


`C:\Users\[USERNAME]\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`: PowerShell history

  










## Linux
