# Bash / Zsh



# Search for files in directory which have been modified in the last 24 hs
find /directory -mtime 0

# Search for files in directory which have been modified between two dates
find . -type f \( -newermt '2023-09-01' -a ! -newermt '2023-09-05' \)





# find command

# Search for file with specified properties
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
find /path/to/search -type f ! -executable -size 1033c -readable


find /path/to/search -name "filename" # Find Files by Name

find /path/to/search -type d -name "dirname" # Find Directories by Name

find /path/to/search -mtime -N # Find Files Modified in Last N Days

find /path/to/search -type f -empty # Find Empty Files

find /path/to/search -type f -name "*.ext" # Find Files by Extension

find /path/to/search -type f -exec ls -s {} + | sort -n | tail # Find Largest Files

find /path/to/search -type f -size +10M # Find Files by Size

find /path/to/search -mtime -1 # Find Files Modified in Last 24 Hours

find /path/to/search -mmin -N # Find Files Modified in Last N Minutes

find /path/to/search -user username # Find Files Owned by User

find /path/to/search -group groupname # Find Files by Group

find /path/to/search -perm /6000 # Find SUID/SGID Files

find /path/to/search -perm 644 # Find Files with Specific Permissions

find /path/to/search -type f -perm /4000 # Find Setuid Executables

find /path/to/search -type f -perm /2000 # Find Setgid Executables

find /path/to/search -type f -name "filename" -delete # Find and Delete Files

find /path/to/search -type d -exec ls -l {} \; # Find Directories and List Contents

find /path/to/search -type f -name "pattern" -exec mv -t /path/to/destination {} + # Find Files and Move to Another Directory

find /path/to/search -type f -exec sed -i 's/oldstring/newstring/g' {} + # Find and Replace in Files

find /path/to/search -type f -mtime -7 -exec tar -czvf archive.tar.gz {} + # Find Recently Modified Files and Archive

## Example: identify any file (not directory) modified in the last day, NOT owned by the root 
user and execute ls -l on them:
find /path/to/search -type f -mtime -1 ! -user root -exec ls -l {} \;








# force ls command to display file size in MB
ls -l --block-size=M




ls -i # displays inode number which uniquely identifies each file in the file system
stat file
stat -f %Sm file
stat -f '%z' file

file exampleFile.txt # determine file type
od

# characters in file
wc -c < file
wc -c file | awk '{print $1*8}' #bits

# Get the number of linelines in a file
wc -l file








grep -r string
grep -r "string with spaces"
grep -ri "foO bAr qUx" # case insensitive

# output the name of the files containing the match
grep -l "pattern" file1 file2 file3

# search string in specific file
grep "string" /path/to/file/example.db

# match filename
find /path/to/dir -name "*.txt"
find /path/to/dir -name "*.txt" -size +1M # large files criteria
find /path/to/search -type f -name '*pattern*' | grep 'regex_pattern'

ls -l /path/to/file/*foo* 







