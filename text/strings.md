# Strings


## Substrings.

```bash
# example: get the first n characters from a given string in both Bash and PowerShell:
string="Hello, World!"; n=5; echo "${string:0:$n}"
echo "Hello, World!" | cut -c 1-5
```

```powershell
$string = "Hello, World!"; $n = 5; $string.Substring(0, $n)
"Hello, World!".Substring(0, 5)
```
