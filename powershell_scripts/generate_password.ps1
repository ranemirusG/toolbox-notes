Function GeneratePassword ([Parameter(Mandatory=$true)][int]$PasswordLenght)
{
Add-Type -AssemblyName System.Web
$PassComplexCheck = $false
do {
$newPassword=[System.Web.Security.Membership]::GeneratePassword($PasswordLenght,1)
If ( ($newPassword -cmatch "[A-Z\p{Lu}\s]") `
-and ($newPassword -cmatch "[a-z\p{Ll}\s]") `
-and ($newPassword -match "[\d]") `
-and ($newPassword -match "[^\w]")
)
{
$PassComplexCheck=$True
}
} While ($PassComplexCheck -eq $false)
return $newPassword
}

<#
Simpler way:
# Import System.Web assembly
Add-Type -AssemblyName System.Web
# Generate random password
[System.Web.Security.Membership]::GeneratePassword(x,y)
#where x is the length and y is the number of non-alphabetical or non-numerical special characters


#>