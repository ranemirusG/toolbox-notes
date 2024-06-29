# HTML encoding


HTML Entities encoding replaces special characters with an ampersand (&), followed by either a hexadecimal number or a reference to the character being escaped, and ending with a semicolon (;).
This method prevents the browser from incorrectly interpreting them as part of the markup, ensures the safe rendering of special characters in HTML and helps prevent attacks such as XSS.





`&colon;` character name
`&#58;` character decimal
`&#x3a;`character hexadecimal



The character set is specified in the <meta> tag:
<meta charset="UTF-8">
<meta charset="Windows-1252">
(HTML 4) <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
(HTML 5) <meta charset="ISO-8859-1">




`<img src=x onerror="&#x61;lert(1)">`



## Leading zeros

when using decimal or hex-style HTML encoding, you can optionally include an arbitrary number of leading zeros in the code points. Some WAFs and other input filters fail to adequately account for this.

`<a href="javascript&#00000000000058;alert(1)">Click me</a>`













