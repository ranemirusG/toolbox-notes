# Count

## bash/zsh

```
# count directories
ls -l | grep -c '^d'


# count characters in file
wc -c < file
wc -c file | awk '{print $1*8}' #bits

# Get the number of lines in a file
wc -l file


```





## cmd





## PowerShell

```
# Count directories
(gci -Directory).count




# number of linelines in a file
(Get-Content myfile.txt | Measure-Object -Line).Lines

# number of words in a file
(Get-Content myfile.txt | Measure-Object -Word).Words


```