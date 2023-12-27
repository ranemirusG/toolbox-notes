<#

List attributes

#>


param(
    [string]$filePath
)

# Check if the file path is provided
if (-not $filePath) {
    Write-Error "Please provide the path to the file using the -filePath parameter."
    exit
}

# Create a Shell object
$shell = New-Object -ComObject Shell.Application

# Get the folder that contains the file
$folder = $shell.Namespace((Get-Item $filePath).DirectoryName)

# Get the file using its name
$file = $folder.ParseName((Get-Item $filePath).Name)

# Loop through all the properties and display them
for ($i = 0; $i -lt 266; $i++) {
    $propertyValue = $folder.GetDetailsOf($file, $i)
    if ($propertyValue) {
        Write-Output "$($folder.GetDetailsOf($folder.Items, $i)): $propertyValue"
    }
}
