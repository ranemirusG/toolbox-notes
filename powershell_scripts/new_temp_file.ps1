# Prompt the user to enter the file name
$fileName = Read-Host "Enter the name of the file (with extension)"

# Get the path to the temporary directory
$tempDirectory = [System.IO.Path]::GetTempPath()

# Combine the temporary directory path and the file name
$filePath = Join-Path -Path $tempDirectory -ChildPath $fileName

# Create a new file in the temporary directory
New-Item -ItemType File -Path $filePath -ErrorAction SilentlyContinue

# Check if the file was created successfully
if (Test-Path $filePath) {
    Write-Host "New file created at: $filePath"

    # Check if Notepad++ is installed
    $notepadPlusPlusPath = "C:\Program Files\Notepad++\notepad++.exe"
    if (Test-Path $notepadPlusPlusPath) {
        # Open the file with Notepad++
        Start-Process -FilePath $notepadPlusPlusPath -ArgumentList $filePath
    } else {
        Write-Host "Notepad++ is not installed. File will not be opened."
    }
} else {
    Write-Host "Failed to create the file."
}
