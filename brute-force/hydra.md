# Hydra

## Resources
- <https://github.com/vanhauser-thc/thc-hydra>
- <https://github.com/gnebbia/hydra_notes>


## Commands

`-s` PORT to specify a non-default port for the service in question.

`-V` or -vV, for verbose, makes Hydra show the username and password combinations that are being tried. This verbosity is very convenient to see the progress, especially if you are still not confident of your command-line syntax.

`-t` n where n is the number of parallel connections to the target. -t 16 will create 16 threads used to connect to the target.

`-d`, for debugging, to get more detailed information about what’s going on. The debugging output can save you much frustration; for instance, if Hydra tries to connect to a closed port and timing out, -d will reveal this right away.





### http
```
sudo hydra <username> <wordlist> MACHINE_IP http-post-form "<path>:<login_credentials>:<invalid_response>"

hydra -l <username> -P <wordlist> MACHINE_IP http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V

```


### ssh
```
hydra -l <username> -P <full path to pass> [IP] -t 4 ssh

hydra -l username -P wordlist.txt server service

hydra -t 16 -l administrator -P /usr/share/wordlists/rockyou.txt -vV [IP] ssh

```

### ftp
```
hydra -l user -P passlist.txt ftp://[IP]

hydra -l mark -P /usr/share/wordlists/rockyou.txt [IP] ftp

hydra -t 4 -l dale -P /usr/share/wordlists/rockyou.txt -vV ftp://[IP]

```



