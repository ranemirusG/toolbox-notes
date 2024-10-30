# sed
- implicity global
    By default prints out the pattern space at the end of each cycle through the script
- stream oriented
    treats multiple input files as one long stream

pattern space ---> buffer that contains the current input line
hold space ---> set-aside buffer for temporary storage / auxiliary

commands:
H, h (hold) ---> copy data from pattern space to hold space (h overwrites, H appends)

G, g (get) ---> copy from hold space to pattern space (g overwrites, G appends)

x (swap) ---> contents from spaces


## susbstitution flags:
g ---> make changes globally on all ocurrences
n ---> substitution at nth ocurrence of pattern
p --->  print the contents of the pattern space
w --->  write the contentens of the patterna space to file
numeric flag when the regular expression repeats itself on a line an the
replacemente must be made for only one of those occurence (we can say that 1
is the default numeric flag)


addresses require / as delimiter
regular exp may by anything except \n

## commands
d --->  delete CONTROL PASSES BACK TO THE TOP OF THE SCRIPT 
    "no further commands are attempted on the corpse of a delete line"
a\ --->  append (line-address)
i\ --->  insert (line-address)
c\ --->  change
y --->  transform 
    y/abc/xyz/
[address]= ---> print line numbet
n ---> next
[line-addres]r file
[line]w file
q --->  quit


multiline commands:
N --->  next
    $!N ---> exclude last line
D --->  delete up to the first new line of multiline patter space
P --->  




branching and conditional instructions to change the flow control:
: ---> label
b ---> /address/b label (if label not supplied, control is transferred to the end of script)
t




