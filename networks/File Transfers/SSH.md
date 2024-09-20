## File Transfers with SSH


## Encrypted & Secure File Transfer

Secure Copy Protocol (SCP).

Start the SSH server easily on your Kali Linux with service ssh start.

On the target, we need to create a file, line by line, which will enter the SSH password in, and download the remote file.
The only reason that a one-liner doesn't work is because SCP prompts the user for a password, and simply echoing the password and piping it to the command won't work. The list of commands to build the file looks like this:
```
echo '#!/usr/bin/expect' > scp.exp
echo 'spawn scp username@ip-addr:/path-to-file out-file' >> scp.exp
echo 'set pass "password"' >> scp.exp
echo 'expect {' >> scp.exp
echo 'password: {send "$pass\r"; exp_continue}' >> scp.exp
echo '}' >> scp.exp
```

To run this file, use `expect scp.exp` and securely download the file you want.

You may need to create a new user for SSH to log into, if so, you can use the `adduser username` command and follow the prompt to set up a new user.
