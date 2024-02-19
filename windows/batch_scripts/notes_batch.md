# Batch files

## Resources
- <https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc758944(v=ws.10)?redirectedfrom=MSDN>
- <https://waynes-world-it.blogspot.com/2008/08/difference-between-bat-and-cmd.html>

## Notes
SET my_variable=Hello World
ECHO Hello World
ECHO %my_variable%

SET /A mult=7*9     ::multiplication operator
ECHO %mult%



## Fork bomb
:TOP
 start "" %0
 goto TOP