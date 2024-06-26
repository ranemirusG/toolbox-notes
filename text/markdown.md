# Markdown notes

## Resources
- <https://daringfireball.net/projects/markdown/>
- <https://www.markdownguide.org/>
- <https://dillinger.io/>
- <https://asciidoc.org/>
- <https://www.youtube.com/watch?v=W33_l1oOX9A>

- <https://github.com/preservim/vim-markdown>


## Create two blank lines in Markdown
Source: https://stackoverflow.com/a/48583859/16233108
```
# RAW
## Creates 2 Lines that CAN be selected as text
## -------------------------------------------------
### The non-breaking space ASCII character
&nbsp;
&nbsp;

### HTML <(br)/> tag
<br />
<br />

## Creates 2 Lines that CANNOT be selected as text
## -------------------------------------------------
### HTML Entity &NewLine;
&NewLine;
&NewLine;

### Backticks with a space inside followed by two spaces
`(space)`(space)(space)
`(space)`(space)(space)
#### sample:
` `  
` `


```
