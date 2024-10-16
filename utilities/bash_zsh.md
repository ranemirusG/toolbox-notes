# Bash / Zsh


- https://gtfobins.github.io/
- http://mywiki.wooledge.org/Bashism
- https://catonmat.net/books
- https://jvns.ca/blog/2023/08/08/what-helps-people-get-comfortable-on-the-command-line-/
- https://furbo.org/2014/09/03/the-terminal/






## History

history # to see timestamp set: HISTTIMEFORMAT="%F %T " or HISTTIMEFORMAT="%y-%m-%d %T "

history 10 # last 10 commands


- <https://stackoverflow.com/questions/43158140/way-to-create-multiline-comments-in-bash>



## Help

info [COMMAND]
whatis [COMMAND]

man [COMMAND]
# perform a keyword search
apropos [KEYWORD]
man -k [KEYWORD]
man -k '^passwd$'
# look at the exact  manual page
man 5 passwd
man [PAGE] [COMMAND]






## Environment


# whether you are using XFCE, GNOME, or another desktop
echo $XDG_CURRENT_DESKTOP


env | grep DESKTOP_SESSION


ps -e | grep -E "xfce|gnome"

dpkg -l | grep -E "xfce4|gnome-shell"














# read file content
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




# list open files (lsof), including network connections
lsof


# list directory contents
ls -1a
ls -larth
find . -maxdepth 1
find -maxdepth 1 # current dir by default
tree -L 1 .
tree -L 1 # current dir by default

ll # may be a default alias of `ls -l`
dir # equivalent to `ls -C -b` (see `info dir`)

# recursive
ls -R
find .
tree



# list directories
ls -l | grep '^d'
ls -d .* # only hidden directories
ls -l | grep -c '^d' # count directories
find . -maxdepth 1 -type d | wc -l



# get full path of filename
realpath file

# Copy filename
basename file | clip

# Copy dir
pwd | pbcopy # macOS






# Search file by name
find /path/to/directory -name "example.txt"
find /path/to/directory -iname "*example*.txt"
find /path/to/directory -name "*example*.txt" ! -name "*.log"






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











# environment variables
printenv

# show a list including the shell variables and environment variables
( set -o posix ; set ) | less












# Size of current directory
du -sk . # in KB
du -ah
ls -A -R -g -o "$@" | awk '{n1 += $3} END {print n1}'
du -sch
du -hd 1 # the number is the depth of directory levels to be displayed
du -bch

# shows how much disk space you have left on the current drive and then tells you how much every file/directory takes up
df -h .; du -sh -- * | sort -hr



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























# Create
touch file
echo "foo" > file
mkdir
mkdir -p ~/nested/path/to/dir/

# Create file of specific size
dd if=/dev/zero of=1MBFile.txt bs=1M count=1
base64 /dev/urandom | head -c 1048576 > 1MBFile.txt



# Create file with content from clipboard
cat > file << EOF #paste + Enter + EOF

pbpaste > file # macOS


# Delete
rm file
rm -rf /path/to/dir # delete directory recursively
