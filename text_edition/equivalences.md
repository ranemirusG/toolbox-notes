# Equivalences

Crosswalk between different editors.




## Sessions

### Vim
`:mksession session_name.vim`

`vim -S session_name.vim`


### Notepad++
File > Save Session / File > Load Session

`notepad++.exe -openSession`




## Duplicate line

### Vim
`yyp`
`Yp`

### Notepad++
`Ctrl+D`

### nano


## Cut line

### Vim
`dd`

### Notepad++
`Ctrl+L`

### nano


## Move line up/down

### Vim
`ddkp`
`ddjp`

### Notepad++
`Ctrl+Shift+up`
`Ctrl+Shift+down`

### nano

## Bookmarks / Marks

### Vim
`:h marks`
`:h sign`

### Notepad++
Ctrl+F2
F2
Shift+F2

### nano















## Compare files

### Vim
`:vsplit<filename>`
`vimdiff file1 file2`(fromcommandline)

### Notepad++


### nano








## Select

### Vim
Visual Mode

### Notepad++
Edit > Begin/End Select
`Ctrl+Shift+B`


### nano



## Select all(from here to top/bottom of file)

### Vim
`Ctrl+Shift+home`
`Ctrl+Shift+end`

### Notepad++
`vgg`
`vG`

### nano


## Select all(from here up/down one page)

### Vim
`vCtrl+U`
`vCtrl+D`


### Notepad++
`Ctrl+Shift+PgUp`
`Ctrl+Shift+PgDn`


### nano




## Column edit mode

### Vim
`Ctrl+V`
`Ctrl+a` to increase number


### Notepad++
`Alt+Shift+<up/down>`
`Alt+c` Column / Multi-Selection Editor


### nano





































## Code align on <char>
`Ctrl+Shift+=`(openspluginwizard)


## Repeat code align on <char>
`Ctrl+=`thenshortcutkey





## Capitalize
Access wizard from GUI
`gU[motion]`(forUPPER),`gu[motion]`(forlower)


## Column edit mode

### Vim
`gu{motion}` (for lower)
`gU{motion}` (for UPPER)

### Notepad++
`Alt+u` capitalize first letter from every word in selection
`Ctrl+Alt+u` capitalize only first letter from first word in selection
`Ctrl+Shift+u` UPPER
`Ctrl+u` lower
Edit > Convert Case to

### nano






## Merge lines

### Vim
`J`


### Notepad++
`Ctrl+J`


### nano







## Find / Search

### Vim
`/`
`:vimgrep` (or just `:vim`)
`:vim /foo/g **sh` (recursive, with two **)
`:vim /foo/ **{sh,rb}`
`:vim /echo/g %` in current file

### Notepad++
`Ctrl+F`, then `Alt+d` (find all in current document) or `Alt+o` (find in all open documents)
`Ctrl+Alt+I`: incremental search

### nano


## Jump to matching bracket, parenthesis, etc

### Vim
`%`

### Notepad++
`ctrl+b`


## ASCII characters

### Vim
`:as[cii]`


### Notepad++
Edit > Character Panel


### nano


## Clipboard / Registers

### Vim
`:reg`


### Notepad++
Edit > Clipboard History


### nano







