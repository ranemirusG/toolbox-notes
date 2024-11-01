# Hash

Hashing is the process of converting data (usually of variable length) into a fixed-size string of characters, which is typically a hexadecimal value.

A hash is a unique string value that corresponds to the contents of the file. They are generated by hashing algorithms, such as Message Digest 5 (MD5) or Secure Hash Algorithm 256 (SHA256). If two files are exactly the same, the hash will match. But if even one character is different, the files will have unique hash values.





## Linux
`md5sum [FILE]`
`sha256sum [FILE]`



## PowerShell

```powershell
Get-FileHash [FILE] # By default, the hashing algorithm will be SHA256
Get-FileHash -Algorithm SHA256 [FILE]

Get-FileHash -Algorithm MD5 [FILE]
```

- To compute the MD5 hash of a string:
 ```powershell
 $stringToHash = "Hello, World!"
 $md5Hash = Get-FileHash -Algorithm MD5 -LiteralPath (ConvertTo-SecureString -AsPlainText $stringToHash -Force | Out-File 
temp.txt -Encoding ASCII)
 ```

- To compute the SHA-256 hash of a string:
 ```powershell
 $stringToHash = "Hello, World!"
 $sha256Hash = Get-FileHash -Algorithm SHA256 -LiteralPath (ConvertTo-SecureString -AsPlainText $stringToHash -Force | Out-File 
temp.txt -Encoding ASCII)
 ```
 
 
 
 
 









## Common Hash Types and Identification

- <https://hashcat.net/wiki/doku.php?id=example_hashes>



### 1. MD5
- Length: 32 characters
- Format: A hexadecimal string
- Example: `5d41402abc4b2a76b9719d911017c592`

### 2. SHA-1
- Length: 40 characters
- Format: A hexadecimal string
- Example: `2fd4e1c67a2d28fced849ee1bb76e7391b93eb12`

### 3. SHA-256
- Length: 64 characters
- Format: A hexadecimal string
- Example: `9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08`

### 4. SHA-512
- Length: 128 characters
- Format: A hexadecimal string
- Example: `cf83e1357eefb8bd...` [truncated]

### 5. LM (LAN Manager)
- Length: 32 characters
- Format: A hexadecimal string, often broken into two 16-character halves
- Example: `E52CAC67419A9A224A3B108F3FA6CB6D`

### 6. NTLM (New Technology LAN Manager)
- Length: 32 characters
- Format: A hexadecimal string
- Example: `32ed87bdb5fdc5e9cba88547376818d4`

### 7. bcrypt
- Length: 60 characters
- Format: Begins with `$2a$`, `$2b$`, or `$2y$`, followed by cost, salt, and hash
- Example: `$2y$10$iOrk210RQSAzNCx6Vyq2X.aJ/D.GuE4jRIikYiWrD3TM/PjDnXm4q`

### 8. DES (Data Encryption Standard)
- Length: 13 characters
- Format: A mix of alphanumeric characters, typically starts with a 2-character salt
- Example: `OQi/IXyj3/2VQ`

### 9. Blowfish (bcrypt variant)
- Length: 31 characters
- Format: Begins with `$2$` or `$2a$` followed by a 2-digit cost, then 53 characters of Base64
- Example: `$2a$12$abcdefghijklmnoopqrsuvwxyzABCD12345`

### 10. MySQL5.x (SHA-1)
- Length: 40 characters
- Format: A hexadecimal string, typically stored with a `*` prefix
- Example: `*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29`
