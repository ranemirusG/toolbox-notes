# Nmap commands




nmap -p- --min-rate=1000 -T4 --open -n -sS --max-retries 1 [IP]

nmap -p- --min-rate=1000 -T4 --open -n -sS --max-retries 1 [IP] | sed -n 's/^\([0-9]\+\)\/tcp.*/\1/p' | paste -sd,

nmap -sTV -A [puertos]

nmap -sTV -A -p80 --script=http-headers

nmap -sTV -A -53 --script=dns-*
nmap -sTV -A -53 --script=vulners.nse
https://vulners.com





nmap --script-help 'http-enum'
nmap --script-help 'http-headers'


nmap -sC -sV -p80 -







# full ports scan
nmap -Pn -n -p- -vv --open -oN enum/nmapfullports ${IP}

# From the full port scan you may find non-standard port openning
# Further enumerate it with nmap version scan to find out what is running on that port. The -sV option is a must before you want to run any other script scan
nmap -Pn -n -p PORT(S) -sC -sV -vv --open -oN enum/nonstandardports ${IP}

# initial version scan
nmap -Pn -n -p -sC -sV -oN enum/nmapversion ${IP} -vv --open

# port knocking
for i in RANGE;do nmap -Pn -n -p $i --host-timeout 201 --max-retries 0 ${IP};done

# service vuln scan
nmap -Pn -n -p ${PORT} -sC -sV -oN enum/servicevulnscan ${IP}

# Use with proxychain, quite important in AD environment

# Specify ports to reduce scan time
proxychains4 -q nmap -Pn -n -sT -p PORT(S) -vv --open






sudo nmap -sV -p 443 --script "vuln" 192.168.50.124 #running vuln category scripts
