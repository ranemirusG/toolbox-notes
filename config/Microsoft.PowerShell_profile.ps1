<#
Powershell Profile
By Ramiro Garcia
Since 2023
#>

# Source my private variables, functions etc.
# . ".\private_vars.ps1" # This doesn't work, see: https://stackoverflow.com/questions/684217/include-relative-files-in-powershell
. "$PSScriptRoot\private_vars.ps1"


# Source scripts from toolbox
<# added from Sysytem Properties > Environment Variables
$toolbox_powershell_scripts = "$HOME\toolbox-notes\powershell_scripts\"
$env:PATH += ";$toolbox_powershell_scripts"

and also $HOME\OneDrive\Documents\WindowsPowerShell\Scripts\
#>





# Prompt
function prompt {"PS: $(Get-Location)>`n"}



# Bindings

# Import-Module PSReadLine
# Custom key bindings for scrolling
Set-PSReadLineKeyHandler -Key Shift+UpArrow -Function ScrollDisplayUpLine
Set-PSReadLineKeyHandler -Key Shift+DownArrow -Function ScrollDisplayDownLine
Set-PSReadLineKeyHandler -Key Shift+PageUp -Function ScrollDisplayUp
Set-PSReadLineKeyHandler -Key Shift+PageDown -Function ScrollDisplayDown



# Alias

Remove-Item alias:curl # sane default

<# Use `..` to `cd ..`

This doesn't worked:
New-Alias -Name ".." -Value "Set-Location .." 

So I made it a function
#>
function .. { Set-Location .. }


function notepad++_NewInstance {
    $nppPath = "C:\Program Files\Notepad++\notepad++.exe"
    & $nppPath -nosession -multiInst $args
}






# Clear-Host cmdlet to the end of profile file to clear the console. (workaround, there has to be a better way)
Clear-Host

<#
TODO: avoid annoying msg when sourcing $PROFILE

New-Alias : The alias is not allowed, because an alias with the name 'todo' already exists.
At $HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1:38 char:1
+ New-Alias -Name "todo" -Value Open-Todo
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceExists: (todo:String) [New-Alias], SessionStateException
    + FullyQualifiedErrorId : AliasAlreadyExists,Microsoft.PowerShell.Commands.NewAliasCommand


see: https://devblogs.microsoft.com/scripting/best-practice-for-using-aliases-in-powershell-scripts/

#>