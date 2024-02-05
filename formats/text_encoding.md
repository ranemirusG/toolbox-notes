



# hex to utf-8


``` python

>>> bytes.fromhex("34204573746163696f6e6573").decode('utf-8')
'4 Estaciones'

```

``` powershell

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
