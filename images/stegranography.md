	## Steganography

Represent information within another message or physical object.

https://www.techtarget.com/searchsecurity/definition/steganography

## Tools

### steghide
a tool for hiding and retrieving data via steganography.


`-cf` cover file
`-ef` embedded file (hidden)
`-sf` stego file, use this instead the cover itself
```
steghide embed -cf laptop.jpg -ef secret.zip
steghide embed -cf laptop.jpg -ef secret.zip -sf laptop2.jpg


steghide extract -sf pizza.jpg

```

## StegDetect
It is a tool that detects steganographic content in images.

### ffmpeg

create espectrogram

`ffmpeg -i inputfile.mp3 -lavfi showspectrumpic=s=800x400:mode=separate spectrogram.png`