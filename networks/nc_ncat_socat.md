# Netcat (nc) - ncat (Nmap's version) - socat




## netcat / nc
Swiss army knife
The clearest definition of Netcat is from *Hobbit* himself: a simple "utility which reads and writes data across network connections, using TCP or UDP protocols".



 - <https://www.fosslinux.com/133160/understanding-netcat-in-linux-through-practical-example s.htm>










## ncat

https://www.digitalocean.com/community/tutorials/how-to-use-netcat-to-establish-and-test-tcp-and-udp-connections

https://unix.stackexchange.com/questions/407547/how-to-know-which-flavor-of-netcat-im-using


### examples
ncat -C scanme.nmap.org 80 # -C option is for CRLF


evadir mecanismo de seguridad y utilizar UDP en lugar de TPC
ncat -v -l 1234 --udp
ncat --udp $IP 1234 < path/to/content.txt





Exec environment variables
```lua
The contents of the program env.lua:

function env(v)
	print(string.format("%s %q", v, os.getenv(v)))
end
env("NCAT_REMOTE_ADDR")
env("NCAT_REMOTE_PORT")
env("NCAT_LOCAL_ADDR")
env("NCAT_LOCAL_PORT")
env("NCAT_PROTO")
The output of running the program:

$ ncat -l --lua-exec env.lua &
$ ncat localhost
NCAT_REMOTE_ADDR "127.0.0.1"
NCAT_REMOTE_PORT "60179"
NCAT_LOCAL_ADDR "127.0.0.1"
NCAT_LOCAL_PORT "31337"
NCAT_PROTO "TCP"
```






## socat
Multipurpose relay (SOcket CAT)


