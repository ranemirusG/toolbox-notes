# Switch Caps Lock to Ctrl

## Windows
Sysinternals: `ctrl2cap.exe`



https://superuser.com/a/696477/1516179
On PowerShell:
`start /b /wait powershell.exe -nologo -WindowStyle Hidden -sta -command "$wsh = New-Object -ComObject WScript.Shell;$wsh.SendKeys('{CAPSLOCK}')"`

`start /b /wait powershell.exe -nologo -WindowStyle Hidden -sta -command "IF ([console]::CapsLock -eq 'True'){$wsh = New-Object -ComObject WScript.Shell;$wsh.SendKeys('{CAPSLOCK}')}"`


## Linux
`/etc/defaults/keyboard`


# Keyboard Layouts


1. **QWERTY**: Developed in the 1870s for typewriters by Christopher Sholes, QWERTY became the standard layout and is still the most widely used today.

2. **AZERTY**: Introduced in the 19th century, AZERTY gained popularity in French-speaking countries as an alternative to QWERTY.
- <https://en.wikipedia.org/wiki/AZERTY>

3. **QWERTZ**: Developed in the late 19th century, QWERTZ is used primarily in German-speaking countries and is similar to QWERTY with the positions of the Y and Z keys swapped.

4. **Dvorak**: Designed by Dr. August Dvorak and his brother-in-law Dr. William Dealey in the 1930s, the Dvorak Simplified Keyboard aimed to improve typing speed and reduce fatigue through ergonomic design.
- <https://en.wikipedia.org/wiki/Dvorak_keyboard_layout>

5. **Colemak**: Created by Shai Coleman in 2006, Colemak sought to balance typing efficiency with ease of transition from QWERTY, aiming to optimize typing comfort and speed.

6. **Workman**: Developed by OJ Bucao in 2010, Workman is a relatively newer layout designed to offer a comfortable and efficient typing experience for English text.
- <https://workmanlayout.org/>




## Resources