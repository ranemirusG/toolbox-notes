# XML (eXtended Markup Language)


## Powershell

One-liner to get a list from an xml file (example Notepad++ session.xml)

([xml](gc "C:\Users\USER\AppData\Roaming\Notepad++\session.xml")).SelectNodes("//mainView/File/@filename") | ForEach-Object { $_.'#text'}

([xml](gc "path\to\xml\file.xml")).SelectNodes("//TAG/TAG/@PROPERTY") | ForEach-Object { $_.'#text'}