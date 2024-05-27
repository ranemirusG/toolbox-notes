# Wireshark



## Filters

ip.addr == [IP]
tcp and ip.addr == [IP]

tcp contains [string]
(example `tcp contains stackoverflow`)

https://stackoverflow.com/questions/18375458/how-to-see-webpage-content-as-a-whole-sent-to-user-with-wireshark
`http && (media || data-text-lines)`