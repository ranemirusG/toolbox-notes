# Pandoc

<https://pandoc.org/MANUAL.html>

If multiple input files are given, pandoc will concatenate them all (with blank lines between them) before parsing. (Use --file-scope to parse files individually.)


## Character encoding
Pandoc uses the UTF-8 character encoding for both input and output. If your local character encoding is not UTF-8, you should pipe input and output through iconv:

`iconv -t utf-8 input.txt | pandoc | iconv -f utf-8`



## HTML
specify a title, use 'title' in metadata or --metadata title="..."


## Templates
https://github.com/jgm/pandoc-templates

## Resources
- <https://pypi.org/project/panflute/>