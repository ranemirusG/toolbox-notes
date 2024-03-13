# Filetypes

## Resources
- <https://en.wikipedia.org/wiki/List_of_file_formats>
- <https://www.file-extensions.org/>
- <https://support.microsoft.com/en-us/windows/common-file-name-extensions-in-windows-da4a4430-8e76-89c5-59f7-1cdbbc75cb01>
- <https://www.fileformat.com/>
- <https://learn.microsoft.com/en-us/DeployOffice/compat/office-file-format-reference>

## General

# Web
`.htm` MS-DOS and early versions of windows were limited to 8.3 filenames, so the extension .html was not possible. Microsoft users had to use .htm instead.


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



