# Email Protocols

Email delivery over the Internet requires the following components:

1. Mail Submission Agent (MSA)
2. Mail Transfer Agent (MTA)
3. Mail Delivery Agent (MDA)
4. Mail User Agent (MUA)











## SMTP (Simple Mail Transfer Protocol)

Is used to communicate with an MTA server.

Ports: 25, 465, 587, 2525

This protocol is used to send emails between servers within the network, or to external networks, such as over the internet. Is just a transport method, to actually download and view emails you need to use an email client and the protocol POP or IMAP.

Unidirectional: Only handles sending, not receiving emails.


Performs three basic functions:

- It verifies who is sending emails through the SMTP server
- It sends the outgoing mail
- If the outgoing mail can't be delivered it sends the message back to the sender




Haraka is an open source high performance SMTP server developed in Node.js. The Haraka SMTP server comes with a plugin for processing attachments. Haraka versions prior to V2.8.9 are vulnerable to command injection.














## POP3 (Post Office Protocol version 3)

Ports: 110, 995

RFC 1939

Is used to download the email messages from a MDA server. Is an older protocol that was originally designed to be used on only one computer - only supports one-way email synchronization. To keep all mailboxes synchronized use IMAP.

Responsible for the transfer of email between a client and a mail server.
The mail client connects to the POP3 server, authenticates, downloads the new email messages before (optionally) deleting them.



















## IMAP (Internet Messaging Access Protocol)
Ports: 143, 993

Responsible for the transfer of email between a client and a mail server.

Messages are stored in a remote server.

Users can log in via multiple email clients on computers or mobile device and read the same messages.

All changes made in the mailbox will be synced across multiple devices and messages will only be removed from the server if the user deletes the email.


IMAP requires each command to be preceded by a random string to be able to track the reply.












## TLS
More secure than SSL
RFC 6101

An existing cleartext protocol can be upgraded to use encryption via SSL/TLS







STARTLS







## DMARC

EASYDEMARC

https://en.wikipedia.org/wiki/DMARC#Alignment

