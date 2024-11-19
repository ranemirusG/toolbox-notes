# `pushd`, `popd` and `dirs`


## Useful commands
```
# cd to N of the stack
cd ~2


pushd +1  # Rotate the stack to the left
pushd -1  # Rotate the stack to the right


# Remove the directory at index N
popd +N





```



## pushd

pushd [-n] [+N | -N | dir]
    Add directories to stack.
    
    Adds a directory to the top of the directory stack, or rotates
    the stack, making the new top of the stack the current working
    directory.  With no arguments, exchanges the top two directories.
    
    Options:
      -n	Suppresses the normal change of directory when adding
    		directories to the stack, so only the stack is manipulated.
    
    Arguments:
      +N	Rotates the stack so that the Nth directory (counting
    		from the left of the list shown by `dirs', starting with
    		zero) is at the top.
    
      -N	Rotates the stack so that the Nth directory (counting
    		from the right of the list shown by `dirs', starting with
    		zero) is at the top.
    
      dir	Adds DIR to the directory stack at the top, making it the
    		new current working directory.
    
    The `dirs' builtin displays the directory stack.
    
    Exit Status:
    Returns success unless an invalid argument is supplied or the directory
    change fails.





## popd
popd [-n] [+N | -N]
    Remove directories from stack.
    
    Removes entries from the directory stack.  With no arguments, removes
    the top directory from the stack, and changes to the new top directory.
    
    Options:
      -n	Suppresses the normal change of directory when removing
    		directories from the stack, so only the stack is manipulated.
    
    Arguments:
      +N	Removes the Nth entry counting from the left of the list
    		shown by `dirs', starting with zero.  For example: `popd +0'
    		removes the first directory, `popd +1' the second.
    
      -N	Removes the Nth entry counting from the right of the list
    		shown by `dirs', starting with zero.  For example: `popd -0'
    		removes the last directory, `popd -1' the next to last.
    
    The `dirs' builtin displays the directory stack.
    
    Exit Status:
    Returns success unless an invalid argument is supplied or the directory
    change fails.


## dirs
dirs [-clpv] [+N] [-N]
    Display directory stack.
    
    Display the list of currently remembered directories.  Directories
    find their way onto the list with the `pushd' command; you can get
    back up through the list with the `popd' command.
    
    Options:
      -c	clear the directory stack by deleting all of the elements
      -l	do not print tilde-prefixed versions of directories relative
    		to your home directory
      -p	print the directory stack with one entry per line
      -v	print the directory stack with one entry per line prefixed
    		with its position in the stack
    
    Arguments:
      +N	Displays the Nth entry counting from the left of the list
    		shown by dirs when invoked without options, starting with
    		zero.
    
      -N	Displays the Nth entry counting from the right of the list
    		shown by dirs when invoked without options, starting with
    		zero.
    
    Exit Status:
    Returns success unless an invalid option is supplied or an error occurs.









## PowerShell

They are equivalent to the `Push-Location` and `Pop-Location` cmdlets.


`Push-Location` and `Pop-Location` are not constrained to just the file system. Now you can use different providers available as PSdrives



```

# push the current location onto a new stack named Stack2, and then changes the current location to the home directory
Push-Location ~ -StackName Stack2


# View the directory stack
Get-Location -Stack

```




Use case for named stacks:

```
$Stack1 = @('C:\Windows\','C:\Users\')
$Stack2 = @('HKLM:\System\CurrentControlSet\Control\BitlockerStatus','HKCU:\Environment\')

# Create two named location stacks using foreach loop

foreach ($location in $Stack1) {
    Push-Location -Path $location -StackName 'Stack1'
}

foreach ($location in $Stack2) {
    Push-Location -Path $location -StackName 'Stack2'
}







```