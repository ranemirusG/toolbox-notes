# Read files





## bash/zsh


```
less file.txt
more file.txt
cat file.txt
head
tail
echo "$(less file.txt)"
echo "$(cat file.txt)"
tac file.txt # `tac` is `cat` in reverse line order
rev file.txt # reversed characters
nl file.txt # line numbers
tr -d '\0' < file.txt
paste -s file.txt
fold -w 80 file.txt
fmt file.txt
cut -f 1,3 file.txt
view file.txt
comm file.txt file.txt
strings file.txt
while read line; do echo $line; done < file.txt
while IFS= read -r line; echo "$line"; done < file.txt
grep '' file.txt
grep '.' file.txt
awk '{print}' file.txt
sed -n 'p' file.txt
hexdump -C file.txt
od -c file.txt
xxd file.txt
curl file:///home/username/file.txt
nano file
vim file
vi file




# read file at specific line
sed -n '8p' file.txt
awk 'RN==8' file.txt
more +8 file.txt
less +8 file.txt
head -n 8 filename.txt | tail -n 1

```








## cmd














## PowerShell

```
Get-Content file
gc file
more file
cat file
Invoke-WebRequest file:///$env:USERPROFILE/path/to/file
curl file:///$env:USERPROFILE/file.txt
curl file:///%USERPROFILE%/file.txt # CMD
curl file:///Users/useraname/file.txt # CMD
curl file:///Users/useraname/file.txt # CMD curl on Windows also allows this incorrect format (with only 2 slashes)

# read file at specific line
Get-Content file.txt | Select-Object -Index 2

```