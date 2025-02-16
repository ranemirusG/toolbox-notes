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


Many email clients, Gmail and Yahoo! included, use both port 465 (for Implicit SSL/TLS) and 587 (for Explicit SSL/TLS), while others limit themselves only to 587.

Haraka is an open source high performance SMTP server developed in Node.js. The Haraka SMTP server comes with a plugin for processing attachments. Haraka versions prior to V2.8.9 are vulnerable to command injection.



### Tools

- swaks












## POP3 (Post Office Protocol version 3)
RFC 1939

Ports: 110, 995
POP3 retrieves emails via port 110 when STARTTLS is in place and via port 995 when using Implicit SSL/TLS.

Is used to download the email messages from a MDA server. Is an older protocol that was originally designed to be used on only one computer - only supports one-way email synchronization. To keep all mailboxes synchronized use IMAP.

Responsible for the transfer of email between a client and a mail server.
The mail client connects to the POP3 server, authenticates, downloads the new email messages before (optionally) deleting them.



















## IMAP (Internet Messaging Access Protocol)
Ports: 143, 993
IMAP retrieves emails via port 143 when STARTTLS is in place and via port 993 when using Implicit SSL/TLS.

Responsible for the transfer of email between a client and a mail server.

Messages are stored in a remote server.

Users can log in via multiple email clients on computers or mobile device and read the same messages.

All changes made in the mailbox will be synced across multiple devices and messages will only be removed from the server if the user deletes the email.

IMAP requires each command to be preceded by a random string to be able to track the reply.













## Encryption
See: SSL/TLS

### STARTTLS / STLS
STARTTLS is not a protocol but an email protocol command. It’s used to tell an email server that an email client (such as Gmail, Outlook, etc.) wants to upgrade an existing insecure connection to an encrypted one using SSL or TLS.