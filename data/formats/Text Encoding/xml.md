# XML (eXtended Markup Language)


XML is closely related to HTML and also supports character encoding using the same numeric escape sequences.



```
<stockCheck>
    <productId>
        123
    </productId>
    <storeId>
        999 &#x53;ELECT * FROM information_schema.tables
    </storeId>
</stockCheck>
```






## Powershell

One-liner to get a list from an xml file (example Notepad++ session.xml)

([xml](gc "C:\Users\USER\AppData\Roaming\Notepad++\session.xml")).SelectNodes("//mainView/File/@filename") | ForEach-Object { $_.'#text'}

([xml](gc "path\to\xml\file.xml")).SelectNodes("//TAG/TAG/@PROPERTY") | ForEach-Object { $_.'#text'}