# Multiplexers

## Resources
- Both `tmux`and `screen` man pages are pretty good

- Screen cheatsheet <https://gist.github.com/jctosta/af918e1618682638aa82>

- <https://github.com/tmux/tmux/wiki/FAQ>
- <https://leanpub.com/the-tao-of-tmux/read>
- Tmux cheatasheet <https://gist.github.com/MohamedAlaa/2961058>






## Prefix
- GNU Sreen (prefix ^a)
- tmux (prefix ^b)






## Windows and Panes

### Screen
```
Split:

C-a |     # Create a split Horizontal
C-a S	  # Create a split Vertical
C-a c     # Create a new window within the split

Toggle:
C-a C-i
C-a <Tab>


Unsplit:
C-a X
C-a :remove


Rename window
c-a A

```


### tmux

```

```







## Scrollback / Copy Mode

### Screen
```
^a <Esc>
^a [


<space> (start selection)
<enter> (end)
^a ] (paste)


# Write the entire contents of the scrollback buffer to a file
(command mode)
: hardcopy -h <filename>

```


### tmux
```

ctrl+space (start selection)
ctrl+w (end selection)
^b ] (paste)


# Write the entire contents of the scrollback buffer to a file
(command mode)
: capture-pane -S -
: save-buffer <filename>

```















## Sessions


### Screen
```

screen -list


# start named session
screen -S [SESSION NAME]

# detach from within a session
^a d


# resume
screen -r [SESSION NAME]

```

### tmux
```

# start named session
tmux new-session -s [SESSION NAME]

```









