# Open all text files in the default text editor
$files = Get-ChildItem -File | Where-Object { $_.Extension -eq "" -or @(".txt", ".rst", ".md") -contains $_.Extension }

foreach ($file in $files) {
    Start-Process -FilePath $file.FullName
}
