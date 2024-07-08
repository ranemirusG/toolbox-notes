<#
Extract image from XML file
#>

# Example image bytes (replace with your actual image bytes)
$imageBytes = [System.IO.File]::ReadAllBytes("C:\Path\To\Your\Image.jpg")

# Example save path (adjust as needed)
$imagePath = "$env:USERPROFILE\image.jpg"

# Write the image bytes to the specified path
try {
    [System.IO.File]::WriteAllBytes($imagePath, $imageBytes)
    Write-Host "Image saved successfully to: $imagePath"
    Invoke-Item $imagePath  # Optional: Open the saved image
}
catch {
    Write-Error "Failed to save the image: $_"
}
