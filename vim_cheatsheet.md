# Vim commands 

## Table of Contents

1. [Formatting](#formatting)
2. [Windows](#windows)

## Formatting


Fix indentation:
`gg=G`


## Windows

Maximize splitted window:

Example: you have a help splitted window and want to open in a full size

	1) `:only`

	2) move it to a tab and the restore the original layout

	`<C-w>T`
	...enjoy the reading...
	before close set a mark ('a' in this case'):
	`ma`
	then close the tab:
	`ZZ`
	now restore it where you began:
	<C-w>s`a