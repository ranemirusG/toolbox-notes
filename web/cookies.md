# Cookies

https://curl.se/docs/http-cookies.html





## Browsers
`edge://settings/siteData`









Cookies are key-value pairs that a web application will store on the user's browser and that will be automatically repeated on each request to the website that issued them.

Tiny pieces of data created by a website and stored on the USER'S COMPUTER.
store user-specific behaviours like items in their shopping cart or session IDs.

Some cookies have additional attributes, a small list of these are below:
	Cookie Name		The Name of the Cookie to be set	(Required)
	Cookie Value	Value, this can be anything plaintext or encoded 	(Required)
	Secure Only		If set, this cookie will only be set over HTTPS connections	(Not Required)
	Expiry			Set a timestamp where the cookie will be removed from the browser	(Not Required)
	Path			The cookie will only be sent if the specified URL is within the request	(Not Required)


Cookies are generally used by web servers to keep state information at the client's side. The server sets cookies by sending a response line in the headers that looks like Set-Cookie: <data> where the data part then typically contains a set of NAME=VALUE pairs (separated by semicolons ; like NAME1=VALUE1; NAME2=VALUE2;). The server can also specify for what path the cookie should be used for (by specifying path=value), when the cookie should expire (expire=DATE), for what domain to use it (domain=NAME) and if it should be used on secure connections only (secure).
If you have received a page from a server that contains a header like:

	Set-Cookie: sessionid=boo123; path="/foo";

it means the server wants that first pair passed on when we get anything in a path beginning with /foo.


- https://www.incibe.es/incibe/politica-cookies



A session cookie is needed because web servers use HTTP(S) to communicate which is stateless. Attaching session cookies means that the server will know who is sending what data. The server can then keep track of users' actions. 

If session cookies contain predictable values, an attacker can set their own session cookies and access users’ accounts.







JSON Web Tokens (JWT) is an integrity mechanism to guarantee that the cookie hasn't been altered by the user.

