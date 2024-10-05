# Volatility

- <https://volatilityfoundation.org/the-volatility-framework/>
- <https://github.com/volatilityfoundation/volatility>
- <https://github.com/volatilityfoundation/volatility3>
- <https://blog.onfvp.com/post/volatility-cheatsheet/>











## Commands
```
-f recollection.bin imageinfo
--profile=Win7SP1x64 -f recollection.bin clipboard
--profile=Win7SP1x64 -f recollection.bin consoles
--profile=Win7SP1x64 -f recollection.bin netscan
--profile=Win7SP1x64 -f recollection.bin hashdump
--profile=Win7SP1x64 -f recollection.bin filescan | grep passwords.txt
--profile=Win7SP1x64 -f recollection.bin pstree

# Host Name of the machine
--profile=Win7SP1x64 -f recollection.bin hivelist
--profile=Win7SP1x64 -f recollection.bin printkey -o 0xfffff8a000024010 -K 'ControlSet001\Control\ComputerName\ComputerName'



--profile=Win7SP1x64 -f recollection.bin filescan | grep -i downloads

--profile=Win7SP1x64 -f recollection.bin filescan | grep -i history

--profile=Win7SP1x64 -f recollection.bin dumpfiles -n --dump-dir=[OUTPUT_DIR] -Q 0x000000011e0d16f0
```







`strings -el recollection.bin | grep -i mail`
