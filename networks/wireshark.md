# Wireshark


## "Getting our bearings"

Go to `Statistics > Endpoints` to check the Endpoints table to get a feel for what IP addresses may be involved. 











## Filters

frame.number == 2808


### get logins
`urlencoded-form.key == "username"`




ip.addr == [IP]
tcp and ip.addr == [IP]

tcp.port == [PORT] && ip.dst == [DESTINATION IP]

tcp contains [string]
(example `tcp contains stackoverflow`)

https://stackoverflow.com/questions/18375458/how-to-see-webpage-content-as-a-whole-sent-to-user-with-wireshark
`http && (media || data-text-lines)`