# Multiplexers


- GNU Sreen (prefix ^a)
- tmux (prefix ^b)


## Scrollback

### Screen
```
^a Esc
```

### tmux
```
^b [
```

Write the entire contents of the scrollback buffer to a file

### Screen
```
(command mode)
: hardcopy -h <filename>
```

### tmux
```
(command mode)
: capture-pane -S -
: save-buffer <filename>
```




