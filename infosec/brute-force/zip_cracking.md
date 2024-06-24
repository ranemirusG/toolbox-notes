# Zip cracking

ZIP cracking is vital in digital forensics for accessing encrypted evidence, uncovering hidden information and completing data pictures. It allows investigators to retrieve password-protected files.


## John The Ripper

```
zip2john protected.zip > out.txt
john out.txt
```


## fcrackzip


### Brute force
-b – Selecting the option for a brute-force attack.

-u – This makes sure fcrackzip actually tries to unzip the file, without this we won’t actually get the right password.

-c – This is where we pick the characters we want to use in our dictionary attack. In this example we’re using ‘a’ which represents lowercase letters, and ‘1’ which represents numbers 0-9.

-l – This is where we state the length of the password we want to crack. If we know the password is between 4 and 6 characters, we would use "-l 4-6".

```
fcrackzip -b [ZIP FILE] -u -c a1 -l 4-6
```


### Dictionary attack
fcrackzip – Selecting the tool we want to use.

-D – Selecting the option for a dictionary attack.

-u – This makes sure fcrackzip actually tries to unzip the file, without this we won’t actually get the right password.

-p – Use strings as password.

/usr/share/wordlists/rockyou.txt – This is the location of our wordlist, required to perform a dictionary attack.

```
fcrackzip -D -u -p /usr/share/wordlists/rockyou.txt [ZIP FILE]
```
