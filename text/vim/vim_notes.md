## Vim commands 

## Table of Contents

1. [Resources](#resources)
2. [Help](#help)
3. [Useful moves](#useful-moves)
4. [Search](#search)
6. [Formatting](#formatting)
7. [Windows and Tabs](#windows-and-tabs)
8. [Macros](#macros)
9. [Folding](#folding)
10. [Files](#files)
11. [Variables](#variables)
12. [Ex commands](#ex-commands)
13. [Tags](#tags)
14. [Run] (#run)
15. [Insert] (#insert)
16. [Shell] (#shell)



## Resources

### Ed
- `info ed`

### Ex
- `help ex-cmd-index`
- <https://vi.stackexchange.com/questions/457/does-ex-mode-have-any-practical-use>
- <https://renenyffenegger.ch/notes/development/vim/commands/index>
- <https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/utilities/ex.html>
- <https://www.ibm.com/docs/en/zos/2.3.0?topic=descriptions-ex-use-ex-text-editor>

### Vi
- An Introduction to Display Editing with Vi (Joy & Horton) <https://docs-archive.freebsd.org/44doc/usd/12.vi/paper.html>
- <https://en.wikibooks.org/wiki/Learning_the_vi_Editor/vi_Reference>

### Vim
- <https://vimtricks.com/p/category/tips-and-tricks/>
- <https://blauaraujo.com/comandos-e-teclas-essenciais-do-vim/>
- <https://www.youtube.com/watch?v=WfyXKnQ9kAQ>
- <https://learnvimscriptthehardway.stevelosh.com>
- <http://yyahnwiki.appspot.com/Vim>
- <http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html>
- <http://robertames.com/files/vim-editing.html>
- <http://derekwyatt.org/vim/>
- <https://rgz.ee>
- <https://blog.sanctum.geek.nz>
- <https://github.com/mhinz/vim-galore>
- <https://vimways.org>
- <https://www.cduan.com/technical/vi/vi-2.shtml>
- <https://www.freecodecamp.org/news/vim-isnt-that-scary-here-are-5-free-resources-you-can-use-to-learn-it-ab78f5726f8d/>
- <https://stackoverflow.com/questions/5400806/what-are-the-most-used-vim-commands-keypresses> 
- <https://medium.com/@mkozlows/why-atom-cant-replace-vim-433852f4b4d1>
- <https://www.arp242.net/effective-vimscript.html>
- Arnold Robbins, Elbert Hannah, and Linda Lamb (2008). "Simple Editing". Learning the vi and Vim Editors. O'Reilly Media, Inc.. ISBN 9781449313258
- <https://richsoni.com/posts/2014-12-21-vimscript-overview> 
- Celebrated Vimscript authors: <https://github.com/tpop>,
  <https://github.com/tommcdo>, <https://github.com/AndrewRadev>.
- <https://castel.dev/>  







## Help

### Open in new tab
:tab help foo

### Man pages
Move the cursor to the word you want to find help on and press ress 'K'

### Command-line arguments
:r!vim -h

:h vim-arguments












## Useful moves
Common actions, vanilla solutions and tricks.

### Exit Insert mode
<esc>
<c-c>
<c-[>


### Control keys in insert mode: that will eliminate many wasteful switches back to normal mode.
CTRL-W    delete word to the left of cursor

CTRL-O D  delete everything to the right of cursor

CTRL-U    delete everything to the left of cursor

CTRL-H    backspace/delete

CTRL-J    insert newline (easier than reaching for the return key)

CTRL-T    indent current line

CTRL-D    un-indent current line







### Surround
cw(<C-r><C-o>")<ESC>














## Search
```
"  list all occurrences of the word under the cursor
[I


" search patter in all files from current dir
:vimgrep/pattern/*
" then use Quickfix navigation
:copen
:cnext


```


Use `Ctrl+g` and `Ctrl+t` to stay in search mode after searching for a pattern, instead of pressing enter. Refine your pattern faster this way.






## Formatting and Editing

### Fix indentation:
`gg=G`


### split wrapped lines
`gq` in Visual Mode

:s/\v(.{80})/\1\r/g






### Replace / Substitute

Separate line with espaces into new lines 
:%s/\s\+/\r/g
:s/\s/\r/g
```
Example:
from this:
	foo baz bar
to this:
	foo
	baz
	bar
```




Dinamic substitution `:%s/\(## \)\(\d\+\)/\=submatch(1) . (submatch(2) - 1)/g`

from this:
```
## 1

## 2
```

to this:

```
## 0

## 1
```


### Apply last line edition to whole buffer
g&




















## Windows and Tabs

### Open buffer in tab
```
<C-W>T "open current buffer in new tab
:tab sb 2
:tabnew | b 2
:tab sball "open all buffers
:bufdo tab split "open all buffers

```

gf - Edit existing file under cursor in same window
C-W f - Edit existing file under cursor in split window
C-W C-F - Edit existing file under cursor in split window
C-W gf - Edit existing file under cursor in new tabpage







### Scroll two splits simultaneously in Vim with :set scrollbind or toggle with (Useful for comparing two files.)

`:set scb`

`:set scrollbind`













## Macros

run a macro in matching lines
:g/pattern/normal @q


Recursive macro (example with 'w' register)
 include `@w` at the end of the macro to make it recursively go to the end of the buffer. You can also dump the contents of a macro to a new file and edit it manually using `"wp`, then when you're finished with your edits load it back to the macro (which are just registers) with `"wy`. This is very handy if you've made an error in recording a macro and don't want to have to start again. Last tip: capital Q will append commands to the macro rather than re-record it from scratch.











## Folding

Fold can be created in Normal mode by typing zf{motion}. For example, zf'a will fold from the current line to wherever the mark a has been set, or zf3j folds the current line along with the following 3 lines











## Files

### Open current file parenth directory
`:e %:h`


### autocomplete path in Insert Mode. See: `help omni-compli`
CTRL-X CTRL-F
(and with CTRL-N and CTRL-P cycle through the options)


### load all files from directory
`:args path/to/dir/*`

### open file under cursor in split window
:vert belowright split <cfile>
:vert sfind <cfile>


### Rename current file
:saveas

or do it with Netrw, just press "R"



### Save visual selection as new file
```
:'<,'>w! >>newfile.txt
```



### Delete current file
:call delete(expand('%')) "you may want to map this

:call delete(@%) "shorter and if you don't want to map it

:call delete(@%) | bdelete! "to complete purge the current buffer also



### clear buffers
```
"all buffers
:%bd[elete]
:bd <c-a>

"buffers 3 to 5
:3,5bd[elete]   

"buffers 3 and 5
:bd 3 5


"buffers from the current one to last but one
:.,$-bd[elete]




```

### switch to alternate buffer
`<c-6>` or `:e #`


### Edit the file whose name is under or after the cursor
`gf`
`gF` if a number follows the file name, the cursor is positioned on that line. Ex: `eval.c:10`






## Variables
```
:echo mapleader
"(if it is the default value "E121: Undefined variable: mapleader")


" vim binary
:echo v:progpath



```



## Ex commands

```
" Copy all lines matching a pattern to end of file
:g/pattern/t$


" Copy all lines matching a pattern to register 'a'
" (qaq is a trick to clear register a before)
qaq:g/pattern/y A



" Reverse a file 
:g/^/m0


" Fast delete of all lines matching a pattern (avoid copying to the unnamed register)
:g/pattern/d _

" Over a range defined by marks a and b, replace each pattern2 with string on each line containing pattern1
:'a,'bg/pattern1/s/pattern2/string/gi






```

















## Tags

### open tag in new window
`<c-w>]` or `<c-w><c-]>`
`<c-w>} "as Preview, to close it <c-w>z`
`<c-w>]<c-w>T "in new Tab`




## Run

Run current file




## Insert

### From file
`:r ~/path/to/file`

### External command
`:.!` or just `!!` then execute shell command and the output will appear in the
buffer







## Shell

### Current shell
`:echo &shell`

### Change shell
`:set shell=/bin/zsh`
`:set shell=path/to/shell`


