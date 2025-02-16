# Email Headers

Everything up above the first blank line is the email header.

Binary content is encoded into text, for example as base64

Content-Type: multipart/mixed; boundary="[number]"

X-Sender-IP: [mail server ip]
	(In the past there was X-Originating-IP, which showed the actual sender IP)
