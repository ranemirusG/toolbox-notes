# Cookies

Key-value pairs that a web application will store on the user's browser and will be automatically repeated on each request to the website that issued them.

Used by web servers to keep state information at the client's side.

Store user-specific behaviours like items in their shopping cart or session IDs.

The server sets cookies by sending a response line in the headers that looks like `Set-Cookie: <data>` where the data part then typically contains a set of NAME=VALUE pairs separated by semicolons, like `NAME1=VALUE1; NAME2=VALUE2;`.

The server can also specify for what path the cookie should be used for (by specifying path=VALUE), when the cookie should expire (expire=DATE), for what domain to use it (domain=NAME) and if it should be used on secure connections only (secure).


If you have received a page from a server that contains a header like: `Set-Cookie: sessionid=boo123; path="/foo";` it means the server wants that first pair passed on when we get anything in a path beginning with /foo.









## Attributes

`name`— The name of the cookie to be set	(Required)

`value`— The value of the cookie (can be anything plaintext or encoded) 	(Required)

`domain`— The domain of the cookie.

`path`— The path property of the cookie. The cookie will only be sent if the specified URL is within the request	(Not Required)

`expires`/ Max-Age — The time when the cookie will expire. If the cookie is a session cookie, the value of this column will be “Session” (Not Required)

	- A session cookie is needed because web servers use HTTP(S) to communicate which is stateless. Attaching session cookies means that the server will know who is sending what data. The server can then keep track of users' actions. 

`size`— The size of the cookie name plus value in bytes.

`httpOnly`— Is this cookie HTTP only?
	If yes, the cookie cannot be accessed through client side script
	Using the HttpOnly flag when generating a cookie helps mitigate the risk of client side script accessing the protected cookie (if the browser supports it).
	If a browser that supports HttpOnly detects a cookie containing the HttpOnly flag, and client side script code attempts to read the cookie, the browser returns an empty string as the result.

`secure`— Is this cookie a secure cookie?

`sameSite`— Is this cookie a same-site cookie? Same-site cookies allow servers to mitigate the risk of CSRF and information leakage attacks by asserting that a particular cookie should only be sent with requests initiated from the same registrable domain. See: <https://web.dev/articles/samesite-cookies-explained>

`lastAccessed`— Date and time when the cookie was last read.

`created`— Date and time when the cookie was created.

`hostOnly`— Is this cookie a domain cookie? That is, the domain value matches exactly the domain of the current website.

























## Security

- <https://www.incibe.es/incibe/politica-cookies>



Don’t store sensitive data in cookie, unless required
Use HttpOnly to mitigate XSS attacks
Use SameSite to mitigate CSRF attacks
Use Secure to mitigate MITM attacks




If session cookies contain predictable values, an attacker can set their own session cookies and access users’ accounts.


JSON Web Tokens (JWT) is an integrity mechanism to guarantee that the cookie hasn't been altered by the user.
















## Browsers


### Google Chrome

Windows:
	`C:\Users\[USER]\AppData\Local\Google\Chrome\User Data\Default\Network\Cookies`


macOS:
	`~/Library/Application Support/Google/Chrome/Default/Cookies`


### Microsoft Edge

`edge://settings/siteData`


Windows:
	`C:\Users\[USER]\AppData\Local\Microsoft\Edge\User Data\Default\Network\Cookies`




### Mozilla Firefox


Linux:
	`~/.mozilla/firefox/[PROFILE]/cookies.sqlite`












## cURL
https://curl.se/docs/http-cookies.html












## JavaScript

`document.cookie.split(';')`
