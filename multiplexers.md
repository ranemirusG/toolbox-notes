# Multiplexers

## Resources
- `tmux` man page is pretty good
- <https://leanpub.com/the-tao-of-tmux/read>

- GNU Sreen (prefix ^a)
- tmux (prefix ^b)




## Basics

### Windows and Panes
#### Screen
```


Split:

C-a |     // Create a split
C-a <Tab> // Move to the split
C-a c     // Create a new window within the split

	
```

#### tmux

```

```


## Scrollback

### Enter COPY MODE
#### Screen
```
^a Esc
```


#### tmux
```
^b [
```

### Select and Paste
#### Screen

```
space (start selection)
enter (end)
^a ] (paste)

```


#### tmux
```
ctrl+space (start selection)
ctrl+w (end selection)
^b ] (paste)

```



### Write the entire contents of the scrollback buffer to a file
#### Screen
```
(command mode)
: hardcopy -h <filename>
```

#### tmux
```
(command mode)
: capture-pane -S -
: save-buffer <filename>
```




