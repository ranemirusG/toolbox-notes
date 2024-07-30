# Email

Email delivery over the Internet requires the following components:

1. Mail Submission Agent (MSA)
2. Mail Transfer Agent (MTA)
3. Mail Delivery Agent (MDA)
4. Mail User Agent (MUA)




Properly configured SPF, DKIM, and DMARC will help other organizations better detect phishing emails originating from the organization, but does not help reduce the impact of incoming phishing attacks by the organization.

- <https://www.lifewire.com/how-to-find-email-server-ip-address-818402>
- <https://proton.me/blog/what-are-email-headers>



## Resources
<https://computer.howstuffworks.com/e-mail-messaging/email3.htm>
<https://www.afternerd.com/blog/smtp/>


## Protocols

### SMTP
Simple Mail Transfer Protocol (SMTP) is used to communicate with an MTA server.

Ports: 25, 465, 587, 2525


Performs three basic functions:

- It verifies who is sending emails through the SMTP server.
- It sends the outgoing mail
- If the outgoing mail can't be delivered it sends the message back to the sender


This protocol is used to send emails between servers within the network, or to external networks, such as over the internet. This is just a transport method, to actually download and view emails you need to use an email client and the protocol POP or IMAP.





### POP3
Ports: 110, 995
RFC 1939

responsible for the transfer of email between a client and a mail server

Post Office Protocol version 3 (POP3) is a protocol used to download the email messages from a MDA server.
The mail client connects to the POP3 server, authenticates, downloads the new email messages before (optionally) deleting them.

Post Office Protocol is an older protocol that was originally designed to be used on only one computer - only supports one-way email synchronization

To keep all mailboxes synchronized use IMAP.



### IMAP (Internet Messaging Access Protocol)
Ports: 143, 993

responsible for the transfer of email between a client and a mail server

Messages are stored in a remote server
Users can log in via multiple email clients on computers or mobile device and read the same messages
All changes made in the mailbox will be synced across multiple devices and messages will only be removed from the server if the user deletes the email


IMAP requires each command to be preceded by a random string to be able to track the reply.






### TLS
More secure than SSL
RFC 6101

An existing cleartext protocol can be upgraded to use encryption via SSL/TLS













STARTLS











####################################################################
####################################################################
TODO: ORDER THIS!!!!






https://www.reddit.com/r/ProtonMail/comments/z4aqtn/selective_new_mail_notification/


https://tutanota.com/blog/posts/gmail-independent-email


https://www.lifewire.com/get-free-email-account-1164062








#MAIL-CLIENT
K-9 Mail
mutt
https://cock.li/ ---> luke smith tutorial mutt https://www.youtube.com/watch?v=2jMInHnpNfQ

alpine


electronmail
https://itsfoss.com/electronmail/

https://www.33mail.com/



startmail
mailfence 
https://posteo.de/en
mimestream --->  for gmail in macOS
sparkmailapp
fastmail
https://mailvelope.com/
https://mailbox.org/en/
https://roundcube.net/
https://www.zoho.com

https://countermail.com/
https://ctemplar.com/
https://duckduckgo.com/email/
https://addy.io/

https://10minutemail.com/


purelymail


EASYDEMARC

https://en.wikipedia.org/wiki/DMARC#Alignment

