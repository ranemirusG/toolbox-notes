# Text encoding tools

## Resources:

- <https://www.w3.org/International/articles/definitions-characters/>

- <https://www.rapidtables.com/>
- <https://emn178.github.io/online-tools/>
- <https://cyberchef.org/>
- <https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/>
- <https://blog.lunatech.com/posts/2009-02-03-what-every-web-developer-must-know-about-url-encoding>







## Conversions




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




# ASCII
From "Pequeno Manual do Programador GNU/Bash" (Blau Araujo, 2020):

    Quando trabalhamos com faixas de caracteres, especialmente com strings que
    contenham caracteres não utilizados na língua inglesa, é muito importante ter
    em mente que a tabela ASCII não contém caracteres acentuados nem cedilha.
    Por exemplo:
    ```
    :~$ var=maçã
    :~$ [[ $var == ma[a-z][a-z] ]]; echo $?
    1
    ```
    Não houve casamento com o padrão porque ç e ã não existem na tabela
    ASCII.

<https://asciiflow.com>





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







# POSIX

Classes:
[:alnum:]
[:alpha:]












# Unicode
- Examples:
    Leftwards Arrow U+2190 ←
    Upwards Arrow U+2191 ↑
    Rightwards Arrow U+2192 →
    Downwards Arrow U+2193 ↓
	
















# Linux
- Use `ctrl+shift+U` then type the four-character code and press Space or Enter
- Settings > Keyboard > Compose Keys



# Windows
`charmap.exe` on command line or `WIN + R` and type charmap

On `notepad` and `WordPad` and `LibreOfficeWriter` you can write the alt code in hexadecimal. Example: `40` then select it and press `Alt+x` and it converts to `@`.

# Notepad++
<https://github.com/notepad-plus-plus/notepad-plus-plus/issues/10581>


















# Shift Cipher

https://en.wikipedia.org/wiki/Caesar_cipher

rot13

```bash
tr '[A-Za-z]' '[N-ZA-Mn-za-m]' < data.txt
```

```python
import codecs
codecs.decode("Ebgngr zr 13 cynprf!","rot_13")
#Output: 'Rotate me 13 places!'
```


rot47




# Morse Code
https://www.dcode.fr/morse-code
https://en.wikipedia.org/wiki/Samuel_Morse

















