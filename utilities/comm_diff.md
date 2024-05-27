# comm
## display the unique lines in `file1`, the unique lines in `file2` and the lines found in both files respectively.
`comm file1 file2`


## display only the lines that were found in both files
`comm -12 file1 file2`

## supress lines that appear in both files
`comm -3 passwords.old passwords.new`





# diff

- <https://unix.stackexchange.com/questions/81998/understanding-of-diff-output>

## context format
`diff -c file1 file2`


## unified format
`diff -u file1 file2`





# another idea using `sort` and `grep`
```
bandit17@bandit:~$ sort passwords.old passwords.new | uniq -u
kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
w0Yfolrc5bwjS4qw5mq1nnQi6mF03bii
bandit17@bandit:~$ cat passwords.new | grep w0Yfolrc5bwjS4qw5mq1nnQi6mF03bii
bandit17@bandit:~$ cat passwords.new | grep kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
```



# see also vimdiff