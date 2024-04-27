# Filetypes

## Resources
- <https://en.wikipedia.org/wiki/List_of_file_formats>
- <https://www.file-extensions.org/>
- <https://support.microsoft.com/en-us/windows/common-file-name-extensions-in-windows-da4a4430-8e76-89c5-59f7-1cdbbc75cb01>
- <https://www.fileformat.com/>
- <https://learn.microsoft.com/en-us/DeployOffice/compat/office-file-format-reference>

## General

# Web
`.htm` MS-DOS and early versions of windows were limited to 8.3 filenames, so the extension `.html` was not possible. Microsoft users had to use `.htm` instead.

`.asp` ASP is a technology (much like PHP) for executing scripts on a web server.
"Active Server Page" file, which is an ASP.NET web page provided by a Microsoft IIS server. The server processes scripts within the file and then generates HTML to display the page in the browser. These files are also called Classic ASP files, and normally use the VBScript language. Newer ASP.NET pages are saved with the ASPX file extension and are often written in C#. A common place where you might see ".ASP" is at the very end of a URL that points to an ASP.NET web page, or when your browser sends you an ASP file by accident instead of the actual file you were trying to download.

Other file formats use this same file extension, like Adobe Color Separation Setup, but that format might be obsolete and irrelevant with newer program versions. These files contain color options (like separation type, ink limit, and color types) that are used when exporting or printing a document.

If you got an ASP file when you tried downloading something else (often a PDF), then there's a good chance that the server simply didn't name the file correctly.

For example, maybe you were trying to download a bank statement, and instead of having it open in your PDF viewer, it opens with a text editor or your computer doesn't know how to view it.

In this particular case, the server didn't append ".PDF" to the end of the file name, and instead used ".ASP" even though the actual file format is PDF. The easiest solution here is to just rename the file yourself, by erasing the last three letters after the period and putting in .PDF (e.g., statement.asp to statement.pdf)



# Text
`.odt` OpenDocument Text document

`.docx` uses the Office Open XML format that saves data in compressed XML files in ZIP format

`.doc` are based on the Binary Interchange File Format (BIFF) that stores information as binary files. Data is organized in a DOC file as a collection of records and structures that are arranged in binary streams as described in MS-DOC file format specifications.

# Spreadsheets

`.ods` OpenDocument Spreadsheet


## Windows batch files
`.bat`
The first filename extension used by Microsoft for batch files. This extension runs with DOS and all versions of Windows, under COMMAND.COM or cmd.exe, despite the different ways the two command interpreters execute batch files.
`.cmd`
Used for batch files in Windows NT family and sent to cmd.exe for interpretation. COMMAND.COM does not recognize this file name extension, so cmd.exe scripts are not executed in the wrong Windows environment by mistake. In addition, append, dpath, ftype, set, path, assoc and prompt commands, when executed from a .bat file, alter the value of the errorlevel variable only upon an error, whereas from within a .cmd file, they would affect errorlevel even when returning without an error.[3] It is also used by IBM's OS/2 for batch files.
`.btm`
The extension used by 4DOS, 4OS2, 4NT and Take Command. These scripts are faster, especially with longer ones, as the script is loaded entirely ready for execution, rather than line-by-line.[4]




## pem crt
- <https://stackoverflow.com/questions/63195304/difference-between-pem-crt-key-files>

`.key` is the private key. This is accessible the key owner and no one else.

`.csr` is the certificate request. This is a request for a certificate authority to sign the key. (The key itself is not included.)

`.crt` is the certificate produced by the certificate authority that verifies the authenticity of the key. (The key itself is not included.) This is given to other parties, e.g. HTTPS client.

`.pem` is a text-based container using base-64 encoding. It could be any of the above files.

`.pem` OpenSSH
`.ppk` PuTTY

-----BEGIN EXAMPLE-----
...
-----END EXAMPLE-----



`.dat`: generic data file that stores specific information relating to the program that created the file


## Audio

`.wav`
`.aiff`
`.au`



