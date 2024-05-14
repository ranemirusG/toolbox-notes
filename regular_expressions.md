# Regular Expressions (regex/regexp)

## Resources
- <https://help.libreoffice.org/6.2/en-US/text/shared/01/02100001.html>








## SQL
`LIKE` and `ILIKE` clauses.

`%` is any sequence of zero or more characters
`_` is a single character
`[]` character class. Ex: 'colo[u]r'



- <https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-MATCHING>






## FLAGS
`g`: global

`i`: case insensitive 

`m`:  multi line. Causes ^ and $ to match the begin/end of each line (not only begin/end of string)















## JavaScript

```



let myRegex = /b[aiu]g/ig // another way could be:
						  // let re = new RegExp("b[aiu]g", "i");
let longHand = /[A-Za-z0-9_]+/;
let shortHand = /\w+/; // is the same as the above longHand to represent all the alphabet lowercase and upper case plus numbers and underscore (_)
let opposite = /\W/

// also \d is equal to the character class [0-9]
// and \D for non-digit characters
// \s for whitespace and \S for non-whitespace




REGEX.test(STRING) // check
STRING.match(REGEX) // return the match as an array




let textHTML = "<h1>Winter is coming</h1>";
let myRegexHTML = /<.*?>/; // lazy match
let result = textHTML.match(myRegexHTML); // returns '<h1>'
let myRegexHTML = /<.*>/; // greedy match (is the default)
let result = textHTML.match(myRegexHTML); // returns '<h1>Winter is coming</h1>'


// Number of matches

let A4 = "haaaah";
let A2 = "haah";
let A100 = "h" + "a".repeat(100) + "h";
let multipleA = /ha{3,}h/;
multipleA.test(A4); // true
multipleA.test(A2); // false
multipleA.test(A100); // true
// {3} for EXACT number



```









## PHP


`preg_match()` Returns 1 if the pattern was found in the string and 0 if not
`preg_match_all()` Returns the number of times the pattern was found in the string, which may also be 0

```
$str = "Visit Microsoft!";
$pattern = "/microsoft/i";
echo preg_replace($pattern, "W3Schools", $str);

```

```
if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$website)) {
      $websiteErr = "Invalid URL";
    }    
```


















## Vim


Dinamic substitution `:%s/\(## \)\(\d\+\)/\=submatch(1) . (submatch(2) - 1)/g`

from this:
```
## 1

## 2
```

to this:

```
## 0

## 1
```