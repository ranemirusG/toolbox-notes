## Vim commands 

## Table of Contents

1. [Resources](#resources)
2. [Help](#help)
3. [Useful moves](#useful-moves)
4. [Formatting](#formatting)
5. [Windows](#windows)
6. [Files](#files)

## Resources

- https://www.youtube.com/watch?v=WfyXKnQ9kAQ
- https://learnvimscriptthehardway.stevelosh.com
- http://yyahnwiki.appspot.com/Vim
- http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
- http://robertames.com/files/vim-editing.html
- http://derekwyatt.org/vim/
- https://rgz.ee
- https://blog.sanctum.geek.nz
- https://github.com/mhinz/vim-galore
- https://vimways.org
- https://www.cduan.com/technical/vi/vi-2.shtml
- https://www.freecodecamp.org/news/vim-isnt-that-scary-here-are-5-free-resources-you-can-use-to-learn-it-ab78f5726f8d/
- https://stackoverflow.com/questions/5400806/what-are-the-most-used-vim-commands-keypresses 
- https://medium.com/@mkozlows/why-atom-cant-replace-vim-433852f4b4d1
- https://www.arp242.net/effective-vimscript.html
- Arnold Robbins, Elbert Hannah, and Linda Lamb (2008). "Simple Editing". Learning the vi and Vim Editors. O'Reilly Media, Inc.. ISBN 9781449313258

## Help

### Man pages
Move the cursor to the word you want to find help on and press ress 'K'

### Command-line arguments
:r!vim -h

:h vim-arguments

## Useful moves
Common actions, vanilla solutions and tricks.


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

### Apply last line edition to whole buffer
g&



## Windows

### Maximize splitted window:

Example: you have a help splitted window and want to open in a full size

	1) `:only`

	2) move it to a tab and the restore the original layout

	<C-w>T

	...enjoy the reading...

	before close set a mark ('a' in this case'): ma

	then close the tab: ZZ

	now restore it where you began: <C-w>s`a







## Macros

run a macro in matching lines
:g/pattern/normal @q


Recursive macro (example with 'w' register)
 include `@w` at the end of the macro to make it recursively go to the end of the buffer. You can also dump the contents of a macro to a new file and edit it manually using `"wp`, then when you're finished with your edits load it back to the macro (which are just registers) with `"wy`. This is very handy if you've made an error in recording a macro and don't want to have to start again. Last tip: capital Q will append commands to the macro rather than re-record it from scratch.











## Folding

Fold can be created in Normal mode by typing zf{motion}. For example, zf'a will fold from the current line to wherever the mark a has been set, or zf3j folds the current line along with the following 3 lines




## Files

### open file under cursor in split window
:vert belowright split <cfile>
:vert sfind <cfile>


### Rename current file
:saveas

or do it with Netrw, just press "R"

### Delete current file
:call delete(expand('%')) "you may want to map this

:call delete(@%) "shorter and if you don't want to map it

:call delete(expand('%')) | bdelete! "to complete purge the current buffer also







