# Browsers



##  Resources
- <https://www.chromium.org/Home/>
- <https://chromium.googlesource.com/chromium/src.git>
- <https://blog.chromium.org/>
- <https://peter.sh/experiments/chromium-command-line-switches/>
- "How browsers work | JSUnconf 2017" <https://www.youtube.com/watch?v=0IsQqJ7pwhw>










##  General

view-source: `ctrl+U`

History: `ctrl+H` / `Back arrow` button

Downloads: `ctrl+J`

`F10` focus back to page


Browser task manager: `Shift + Esc`




1. **Chrome**:
	- `chrome://settings/`: Access browser settings.
	
	- `chrome://net-internals/#dns`
	- `chrome://flags`
	
	- `chrome://extensions/`: Access the extensions page.
	- `chrome://flags/`: Access experimental features.
	- `chrome://bookmarks/`: Access bookmarks.
	- `chrome://history/`: Access browsing history.


2. **Mozilla Firefox**:
	- `about:settings`
	- `about:config`: Access advanced configuration options.
	- `about:support`: Access troubleshooting information.
	- `about:profiles`: Manage browser profiles.
	- `about:downloads`: View downloads.
	- `about:addons`: Access the add-ons page.


3. **Microsoft Edge**:
	- `edge://wallet/personalInfo`: passwords, addresses, and payment methods
	
	- `edge://settings/`: Access browser settings.
	
	- `edge://net-internals/`:
	
	- `edge://extensions/`: Access the extensions page.
	- `edge://history/`: Access browsing history.
	- `edge://history/all`
	
	- `edge://favorites/`: Access favorites/bookmarks.
	- `edge://downloads/`: View downloads.









## Dev Tools
- <https://www.geeksforgeeks.org/browser-developer-tools/>
- <https://developer.chrome.com/docs/devtools/shortcuts>





### Global keyboard shortcuts
The following keyboard shortcuts are available in most, if not all, DevTools panels:

Open whatever panel you used last
`Command+Option+I` / `F12` / `Control+Shift+I`

Open the Console panel
`Command+Option+J` / `Control+Shift+J`

Open the Elements panel
`Command+Shift+C` / `Command+Option+C` / `Control+Shift+C`




Show Settings `?` /  `F1` / `Function+F1`
Focus the next panel `Command+]` / `Control+]`
Focus the previous panel `Command+[` / `Control+[`

Switch back to whatever docking position you last used. If DevTools has been in its default position for the entire session, then this shortcut undocks DevTools into a separate window
`Command+Shift+D` / `Control+Shift+D`

Toggle Device Mode
`Command+Shift+M` /	`Control+Shift+M`

Toggle the Drawer
`Escape`

Normal reload
`Command+R`	`F5` / `Control+R`

Hard reload
`Command+Shift+R` /	`Control+F5` / `Control+Shift+R`




Run snippet
Press `Command+O` / `Control+O to open the Command Menu, type ! followed by the name of the script, then press Enter










### Elements


Expand or collapse the currently-selected node and all of its children	
Hold `Option` / `Control+Alt` then click the arrow icon next to the element's name



Hide the currently-selected element: `h`


Toggle Edit as HTML mode on the currently-selected element
`Function+F2` /	`F2` (like LibreOffice Calc edit cell...)



### Styles pane

Go to the line where a property value is declared
Hold `Command` / `Control` then click the property value


There are many more.





### Console Panel

Open the Console panel
`Command+Option+J` / `Control+Shift+J`

Focus the Console
`Control+``

Clear the Console
`Command+K or Option+L` / `Control+L`

#### Search tab
Expand/collapse all search results
`Command+Option+{ or }` / `Control+Shift+{ or }`




### Sources (Chrome, Edge) / Debugger (Firefox)

It's similar to a code editor.

Pause script execution (if currently running) or resume (if currently paused)
`F8` / `Command+\` / `Control+\`
Also:
`F10`, `F11`, `Shift+F11` (debuger commands)

Go to line: `Control+G`


Go to a function declaration (if currently-open file is HTML or a script), or a rule set (if currently-open file is a stylesheet)
Press `Command+Shift+O` / `Control+Shift+O`, then type in the name of the declaration / rule set, or select it from the list of options

Close the active tab
`Option+W` / `Alt+W`

Open next or previous tab
`Function+Command+Up or Down` /	`Control+Page Up or Page Down`
Toggle the Navigation sidebar on the left
`Command+Shift+Y` / `Control+Shift+Y`
Toggle the Debugger sidebar on the right
`Command+Shift+H` / `Control+Shift+H`



There are many more.















### Network

Start / stop recording
`Command+E` / `Control+E`
Record a reload
`Command+R` / `Control+R`
Replay a selected XHR request
`r`
Hide the details of a selected request
`Escape`









### Performance
<https://www.youtube.com/watch?v=o-fUkB3zT_I>








### Memory












### Application
view and edit the storage used by a web app and debug your PWAs
https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps-chromium/




















## Microsoft Edge

`msedge.exe`

Edge is based on chromium engine, it basically uses the same switches

https://learn.microsoft.com/en-us/microsoft-edge/

https://answers.microsoft.com/en-us/microsoftedge/forum/all/get-list-of-edge-command-line-switches/519d9efd-03df-4815-9cc7-b8f51d1bc932


https://microsoftedge.github.io/Demos/



### Detached Elements
Investigate memory leaks problems
https://learn.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/memory-problems/dom-leaks

	training
	https://blogs.windows.com/msedgedev/2021/12/09/debug-memory-leaks-detached-elements-tool-devtools/
	https://microsoftedge.github.io/Demos/detached-elements/

### 3D (previously Layers)

HTML parsing ----> CSS parsing ----> Layout ----> Painting









## Mozilla Firefox
<https://getfirebug.com/>






## Vivaldi








## qutebrowser








## Tor











## Lynx















