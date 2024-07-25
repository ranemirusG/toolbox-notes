# Text encoding tools

## Resources:

- <https://www.w3.org/International/articles/definitions-characters/>

- <https://www.rapidtables.com/>
- <https://emn178.github.io/online-tools/>
- <https://cyberchef.org/>
- <https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/>
- <https://blog.lunatech.com/posts/2009-02-03-what-every-web-developer-must-know-about-url-encoding>







## Conversions




# Linux
- Use `ctrl+shift+U` then type the four-character code and press Space or Enter
- Settings > Keyboard > Compose Keys

## iconv
```bash
iconv -f UTF-16 -t UTF-8 out.txt > out-utf8.txt
```


## dos2unix
DOS/Mac to Unix and vice versa text file format converter



# Windows
`charmap.exe` on command line or `WIN + R` and type charmap

On `notepad` and `WordPad` and `LibreOfficeWriter` you can write the alt code in hexadecimal. Example: `40` then select it and press `Alt+x` and it converts to `@`.

# Notepad++
<https://github.com/notepad-plus-plus/notepad-plus-plus/issues/10581>

















# character to UTF-16

```javascript

'a'.charCodeAt()

```

















# Decimal to text


```python
decimal_numbers = [85, 110, 112, 97, 99, 107, 32, 116, 104, 105, 115, 32, 66, 67, 68]

text = ''.join(chr(num) for num in decimal_numbers)
print(text)
```

```bash
decimal_numbers=(85 110 112 97 99 107 32 116 104 105 115 32 66 67 68)

for num in "${decimal_numbers[@]}"; do
    printf "\\$(printf '%03o' "$num")"
done

echo

```

```powershell
$decimalNumbers = @(85, 110, 112, 97, 99, 107, 32, 116, 104, 105, 115, 32, 66, 67, 68)

foreach ($num in $decimalNumbers) {
    [char]$num
}
```






























# binary to text

```python
# Binary input
binary_string = "01101000 01100101 01101100 01101100 01101111"  # Example: "hello"

# Split the binary string into 8-bit groups
binary_list = binary_string.split()

# Convert binary to text
text = ""
for binary_char in binary_list:
    decimal_value = int(binary_char, 2)  # Convert binary to decimal
    text += chr(decimal_value)           # Convert decimal to ASCII character

print("Converted text:", text)
```



```bash
# Example: "hello"
binary_string="01101000 01100101 01101100 01101100 01101111"

# Convert binary to text
text=""
for binary_char in $binary_string; do
    decimal_value=$((2#$binary_char))     # Convert binary to decimal
    text+=`printf \\$(printf '%03o' $decimal_value)`   # Convert decimal to ASCII character
done

echo "Converted text: $text"
```



```powershell
# Binary input
$binary_string = "01101000 01100101 01101100 01101100 01101111"  # Example: "hello"

# Split the binary string into 8-bit groups
$binary_list = $binary_string -split ' '

# Convert binary to text
$text = ""
foreach ($binary_char in $binary_list) {
    $decimal_value = [convert]::ToInt32($binary_char, 2)  # Convert binary to decimal
    $text += [char]$decimal_value                         # Convert decimal to ASCII character
}

Write-Host "Converted text: $text"
```





























# Hex to Binary

```python
hex_string = "aa55"
binary_string = bin(int(hex_string, 16))[2:].zfill(len(hex_string)*4)

print(binary_string)
```

```powershell
$hexNumber = "12"
$binaryNumber = [convert]::ToString([convert]::ToInt32($hexNumber, 16), 2)
```

# Binary to Hex

```powershell
$binaryNumber = "1100"
# opt 1
$hexNumber = [convert]::ToString([convert]::ToInt32($binaryNumber, 2), 16)
# opt 2
$hexNumber ="{0:X}" -f [convert]::ToInt32($binaryNumber, 2)
```




# hex to utf-8

```python

>>> bytes.fromhex("34204573746163696f6e6573").decode('utf-8')
'4 Estaciones'

```

```powershell

$hexString = "34204573746163696f6e6573"
$bytes = [byte[]]@(for ($i = 0; $i -lt $hexString.Length; $i += 2) { [convert]::ToByte($hexString.Substring($i, 2), 16) })
$text = [System.Text.Encoding]::UTF8.GetString($bytes)

Write-Host $text


```

``` bash
hex_string="34204573746163696f6e6573"

# Convert hexadecimal to binary
binary_string=$(echo "$hex_string" | xxd -r -p)

# Convert binary to text using printf
decoded_text=$(printf '%s' "$binary_string")

echo "$decoded_text"


```


``` perl
my $hex_string = "34204573746163696f6e6573";

# Convert hexadecimal to binary
my $binary_string = pack("H*", $hex_string);

# Convert binary to text
my $decoded_text = $binary_string;

print "$decoded_text\n";


```


# HTML
https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references
















## get ASCII value of the character

``` bash
printf "%d\n" "'I'"
```

``` powershell
[int][char]"I"
```

``` python
print(ord('I'))
```

## get character value from ASCII

``` bash
# oneliner
printf "\x$(printf %x 65)"

# two lines
printf "\x$(printf %x 65)"
printf "\x$1"

# using octal value
printf '%b' '\101'

printf '%b' '\'{101..107} # result: ABCDEFG


# using hex
printf "\x41"
printf "\x41\n"

# using awk
awk 'BEGIN{printf "%c", 64}'
```

``` powershell
[int][char]"I"
```

``` python
print(ord('I'))
```













## String to Base64

```powershell
$stringToEncode = "{"id":1,"admin":true}"
$encodedString = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($stringToEncode))
```







## Decode a Base64-encoded string
```powershell
$encodedString = "VEhNe0JBU0U2NF9FTkNPRElOR30="
$decodedBytes = [System.Convert]::FromBase64String($encodedString)
$decodedString = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
```




