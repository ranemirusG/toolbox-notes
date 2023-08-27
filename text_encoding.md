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