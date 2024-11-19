# Clipboard

It is a buffer that some operating systems provide for short-term storage and transfer within and between application programs. The clipboard is usually temporary and unnamed, and its contents reside in the computer’s RAM	

About copying and pasting in Linux terminal: <https://unix.stackexchange.com/questions/114392/copy-paste-in-a-terminal-without-shift>
<https://en.wikipedia.org/wiki/IBM_Common_User_Access>
<https://superuser.com/questions/1203127/how-can-i-press-insert-on-a-keyboard-without-that-key>


## Windows
%AppData%\Local\Microsoft\Windows\Clipboard
C:\Users\[USERNAME]]\AppData\Local\Microsoft\Windows\Clipboard


### Powershell

```

Set-Clipboard
scb # alias


# Get the content of the clipboard and display it to the command-line
Get-Clipboard
gcb # alias



# Get the content of the clipboard in a specific format
Get-Clipboard -Format FileDropList






# paste file copied with GUI
# whether with context menu (right click) or ctrl+c
# see: https://stackoverflow.com/questions/65383032/copy-and-paste-files-through-clipboard-in-powershell

Get-Clipboard -Format FileDropList | ForEach-Object { Copy-Item -Path $_ -Destination "DestinationDirectoryPath" }

Get-Clipboard -Format FileDropList | ForEach-Object { Copy-Item -Path $_ }










```



## Clipboard managers
- Parcellite





