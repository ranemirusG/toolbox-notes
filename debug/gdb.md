# gdb


# Resources
- <https://codeberg.org/blau_araujo/curso-gdb>
- <https://stackoverflow.com/questions/10748501/what-are-the-best-ways-to-automate-a-gdb-debugging-session>
- <https://stackoverflow.com/questions/20570816/what-does-gdb-x-command-do>
- <https://stackoverflow.com/questions/7805782/hardware-watchpoints-how-do-they-work>


# Commands

info registers ----> shows all the registers
	info registers eax
	To display the register values continuously as you step through the code you can use display. Example `display $eax`

disassemble ----> Dump of assembler code for function or a specific memory address
disas

set logging enabled ----> save output to file

x ----> examine memory 

##### instructions
ni
starti


run ----> Start the program
start ----> Synonymous to (b main && run). Puts temporary b at main

break funcName ----> Set breakpoint at function funcName (short: b funcName)
break file::line ----> Set breakpoint at line in file
i b ----> list all breakpoints
break _exit ----> Breakpoint at exit of program

layout next ----> Cycle through the layouts of gdb
	`lay src` ----> source layout shortcut
tui enable (short tui e)
tui disable (short tuis d)cd
focus [name]] ----> Make the name window active for scrolling (short focus n)
	focus next
	focus prev
	focus src
	focus cmd
	focus asm
	focus regs
	`C-x o` ----> change active window


list ----> show some lines before and after the current line
	`l 25` list at line 25
where
frame ----> Without an argument, 'frame' just tells you where you are at (with an argument it changes the frame)

print [var name]
p [var] ----> Print the value of variable var
p [var] = [value] ----> Force set value to a var ???????????
set variable [var] = [value]
whatis [var name] ----> get variable type
ptype expr ----> Detailed print of datatype of expr
info locals ----> Print the local variables of the selected frame (local scope)
info args
info variables

up ----> call stack
down
backtrack ----> print entire callstack

display ----> always show variable value
	undisplay [id] to stop printing it
watch
watch var ----> Stop when var is modified
watch -l foo ----> Watch foo loaction
rwatch foo ----> Stop when foo is read
watch foo if foo>10 ----> Watch foo conditionally debugging from inside gdb


next ----> execute the current line in source (short: n)
step ----> step into function call at current line (short: s)
continue ----> resume execution (After a breakpoint) (short: c)
finish ----> finish the execution of current function (short: fin)
	until pop the current stack frame and stop

target record-full
	`reverse-next` or `rn`
	`reverse-step`
	`reverse-continue`

info source ----> compilation info (standard used for example)

gdb --configuration


gdb path/to/exe -ex 'set args arg1 arg2 arg3'
gdb --args path/to/exe arg1 arg2 arg3


### Python
programmatic way to check whether Python is compiled in:
When python is NOT supported:
on Windows:
C:\> gdb --ex "python import os" --batch 2>&1 | findstr Python
C:\>echo %ERRORLEVEL%
Python scripting is not supported in this copy of GDB.
0
When python _is_ supported, this string will not be printed, and
retval will be 1.


### Python
https://www.youtube.com/watch?v=xt9v5t4_zvE
https://www.youtube.com/watch?v=ck_jCH_G7pA
https://www.youtube.com/watch?v=rB9rPdMRxIA
https://www.youtube.com/watch?v=IqH3Mh-OI-8

pi or python-interactive ----> interactive interpreter

python gdb.execute('[command]') ----> Run a gdb command cmd from python prompt
	python gdb.execute('next') 

source file.py ----> load python script
