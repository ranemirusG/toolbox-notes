# Sed and Awk

## General Resources
- <https://unix.stackexchange.com/questions/526064/sed-to-print-out-the-line-number>














# Sed

- <http://www.grymoire.com/Unix/Sed.html>
- <http://www.thegeekstuff.com/tag/sed-tips-and-tricks/>


# 	sed -n 'ADDRESSp' filename
# sed -n '/PATTERN/p' filename


# Print contents of a file.
sed -n '/fox/p' text/*
sed -n '/Sysadmin/p' text/geek.txt

# Print a specific line `N`.
sed -n '3p' text/geek.txt

# Negation. Print every line besides the 3rd line.
sed -n '3!p' text/geek.txt

# Print lines `3` to `5`.
sed -n '3,5p' text/geek.txt

# Print lines starting with `3` and skipping by `2`.
sed -n '3~2p' text/geek.txt

# Print the last line.
sed -n '$p' text/geek.txt

# Print lines `2` to the last line.
sed -n '2,$p' text/geek.txt

# Print lines matching the pattern until the specified line.
sed -n '/Sysadmin/,3p' text/geek.txt
sed -n '/Oracle/,5p' text/geek.txt

# Print lines starting from `3` until it matches the pattern.
sed -n '3,/Sysadmin/p' text/geek.txt

# Print lines matching the pattern to the last line.
sed -n '/Website/,$p' text/geek.txt

# Prints the lines matching the pattern and the next '3' lines.
sed -n '/Sysadmin/,+3p' text/geek.txt

# Prints the lines matching the between the two patterns.
sed -n '/Hardware/,/Website/p' text/geek.txt


#-===================================================================
# PRINT LINE NUMBER
# http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
#
# Syntax:
# sed '=' filename
# sed '/PATTERN/=' filename
#-===================================================================

# Prints the line number for all lines in the file.
sed -n '=' filename

# Prints the line number that matches the pattern.
sed -n '/Linux/=' filename

# Prints the line number in range of two patterns (inclusive).
sed -n '/Linux/,/Hardware/=' filename

# Prints the total number of lines.
sed -n '$=' filename


#-===================================================================
# DELETE (d)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-delete-file-lines-using-address-and-patterns/
#
# Syntax (same as print):
# sed 'ADDRESS'd filename
# sed /PATTERN/d filename
#-===================================================================

# Deletes the nth line from the file.
sed '3d' text/geek.txt

# Delete every lines starting from 3 and skipping by 2.
sed '3~2d' text/geek.txt

# Delete lines from 3 to 5.
sed '3,5d' text/geek.txt

# Delete the last line.
sed '$d' text/geek.txt

# Delete lines matching the pattern.
sed '/Sysadmin/d' text/geek.txt


#-===================================================================
# SUBSTITUTE (s)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-replace-text-inside-a-file-using-substitute-command/
#
# Syntax:
# sed 'ADDRESSs/REGEX/REPLACEMENT/FLAGS' filename
# sed '/PATTERN/s/REGEX/REPLACEMENT/FLAGS' filename
#
# Delimiter:
# '/' can be replaced with any character (;@|-*~) as a delimiter.
#
# Flags:
# -g - replace all instances of REGEX with REPLACEMENT
# -n - replace the nth instance
# -p - print line if a substituion was made
# -i - case-insensitive substituion
# -r - extended regex (preferred)
# -w - write to file if a substituion was made
#-===================================================================

# Simple substituion for the first result.
sed 's/Linux/Unix/' text/geek.txt

# Simple substituion for global instances.
sed 's/Linux/Unix/g' text/geek.txt

# Replace nth instance.
sed 's/Linux/Unix/2' text/geek.txt

# Write matched lines to output.
sed -n 's/Linux/Unix/gp' text/geek.txt > text/geek-sub.txt

# Replace parens with square brackets.
sed 's/(/[/g; s/)/]/g' text/geek.txt
sed -r 's/\((.+)\)/\[\1\]/g' text/geek.txt

# Use & to access the pattern found.
sed -r 's/[0-9]+/ (&) /g' text/numbers.txt

# Use regex group for capturing additional patterns (up to 9).
sed 's/\(Linux\).\+/\1/g' text/geek.txt
sed -r 's/(Linux).+/\1/g' text/geek.txt

# Remove parenthesis and everything inside.
sed 's/(.\+)//g' text/geek.txt
sed -r 's/\(.+\)//g' text/geek.txt

# Remove only the parenthesis.
sed 's/(\(.\+\))/\1/g' text/geek.txt
sed -r 's/\((.+)\)/\1/g' text/geek.txt

# Replace everything inside parenthesis with YOLO.
sed -r 's/\(.+\)/\(YOLO\)/g' text/geek.txt

# Remove the last 3 characters.
sed 's/.\{3\}$//g' text/geek.txt
sed -r 's/.{3}$//g' text/geek.txt

# Remove the last word.
sed -r 's/\d$//g' text/geek.txt

# Remove all letters.
sed -r 's/[a-zA-Z]//g' text/geek.txt

# Remove number lists.
sed -r 's/[0-9](\. )?//g' text/geek.txt

# Remove all alphanumeric characters.
sed -r 's/\w//g' text/geek.txt

# Removes html tags.
sed 's/<[^>]*>//g' text/html.txt

# Remove html tags (intermediate).
sed -r 's|(</?[a-z]+>)||g' text/html.txt

# Replace value with parenthesis value.
sed 's/ .\+(\(.\+\))/ \1/g' text/geek.txt

# Commatize some numbers. Incorrect attempts.
sed -r 's/([0-9]+)([0-9]{3}$)/\1,\2/g' text/numbers.txt
sed -r 's/([0-9]*)([0-9]{3})+([0-9]{3}$)/\1,\2,\3/g' text/numbers.txt

# Commatize any number. Example with labels and loops
# http://shallowsky.com/blog/linux/cmdline/sed-insert-commas.html
sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' text/numbers.txt
sed -r ':loop; s/\B[0-9]{3}\>/,&/; t loop' text/numbers.txt


#-===================================================================
# APPEND (a), INSERT (i), CHANGE (c)
# http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
#
# Syntax:
# sed 'ADDRESSa TEXT' filename
# sed '/PATTERN/a TEXT' filename
#-===================================================================

# Append examples.
sed '1a hello world' text/geek.txt
sed '/Linux/a TUX' text/geek.txt
sed '$a this is the last line' text/geek.txt

# Insert examples.
sed '1i this will be inserted before line 1' text/geek.txt

# Change examples, aka replace.
sed '1c HAS BEEN REPLACED' text/geek.txt
sed -r '/[wW]indows/c HAS BEEN HAXed' text/geek.txt


#-===================================================================
# TRANSFORM
#
# Syntax:
# sed 'y/abcd/ABCD/' filename
#-===================================================================

# Converts all lowercase chars to uppercase.
sed 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' text/geek.txt

# Converts all uppercase chars to lowercase.
sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/' text/geek.txt

# Perform a two character step cipher.
sed 'y/abcdefghijklmnopqrstuvwxyz/cdefghijklmnopqrstuvwxyzab/' text/geek.txt


#-===================================================================
# MULTI-LINE OPERATIONS
# http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-multi-line-file-operation-with-6-practical-examples/
#
# The '-e' flag allows for multiple commands.
#-===================================================================

sed -r -e 's/etc\.*//g' -e 's/(\s+)(\))/\2/g' text/geek.txt

# Detect consecutive duplicate lines and replace the newline with ' @ '.
# - The curly braces are used to group sed commands.
# - Begin by reading the first line and puts it in N.
# - Then reads the next line separated by a new line (\n) and appends it to N.
# - Lastly perform the substitution.
sed -e '{ N; s/\n/ @ /; }' text/duplicate-geek.txt


#-===================================================================
# CONTROL FLOW
# http://www.thegeekstuff.com/2009/12/unix-sed-tutorial-6-examples-for-sed-branching-operation/
#
# Syntax:
# sed ':label command(s) b label'
# sed ':label command(s) t label'
#-===================================================================

# Commatize numbers.
sed -r ':loop; s/(.*[0-9])([0-9]{3})/\1,\2/; t loop' text/numbers.txt
































# Awk



- <http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/>





# Command without search pattern will perform action on all lines.
awk '{ print; }' text/employee.txt

# Command without action will print the lines matching the pattern.
awk '/Technology/' text/employee.txt
sed -n '/Technology/p' text/employee.txt

# Multiple patterns with regex.
awk '/(Tech)|(Market)/' text/employee.txt

# Print columns. $NF contains the number of columns.
awk '{ print $2, $NF }' text/employee.txt

# Multi-line block.
awk 'BEGIN { print "Beginning this command"; }
{ print $2, $NF; }
END { print "End of this command"; }' text/employee.txt

# Same as above written as one line.
awk 'BEGIN { print "Beginning this command"; } { print $2, $NF; } END { print "End of this command"; }' text/employee.txt

# Find the employee with an id greater than 200.
awk '$1 > 200' text/employee.txt

# Match column to regex.
awk '$4 ~ /[tT]echnology/' text/employee.txt

# Sum columns.
awk '{ s += $1; print $1} END { print s }' text/employee.txt

# Sum column, only get result.
awk '{ s += $1 } END { print s }' text/employee.txt

# Sum columns with full syntax.
awk 'BEGIN { s=0 } { s += $1 } END { print s }' text/employee.txt


