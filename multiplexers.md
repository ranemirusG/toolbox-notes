# Multiplexers


- GNU Sreen (prefix ^a)
- tmux (prefix ^b)

### template
#### Screen
```

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




