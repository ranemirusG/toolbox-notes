# Copy-Paste


## Paste bins
- <https://snips.sh/>





## Base 64 Encoding + Copy & Paste
We won't be actually transferring a file across a network, but instead we will be copy-pasting executable files from our attacking machine to the target. But how can we copy and paste executable files, which are full of unprintable characters?

The trick is by first encoding the file in Base 64.
We can do this by using Python:
```
python -c 'print(__import__("base64").b64encode(open("file", "rb").read()))'
```

Then, on the target, we can copy and paste the string into a `.txt` file with `echo "string" > output.txt`, and use base64 to decode the file, with `base64 -d output.txt > output-file`











