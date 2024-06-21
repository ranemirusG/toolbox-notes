<#
Split each `##` section into a new file

 A useful and related one-liner:
	( (gc example_file.md -raw) -split '(?=##)' )[2].Trim() | Write-Output

#>


param (
    [string]$FilePath
)

# Check if the file exists
if (-Not (Test-Path -Path $FilePath)) {
    Write-Host "File not found: $FilePath"
    exit 1
}

# Read the content of the input markdown file
$content = Get-Content -Path $FilePath -Raw

# Split the content by the "##" sections using lookahead assertion
$sections = $content -split "(?=##)"

# Remove empty entries
$sections = $sections | Where-Object { $_ -ne "" }

# Function to sanitize filenames
function Get-SafeFileName {
    param (
        [string]$name
    )
    # Replace invalid filename characters with underscore
    return $name -replace '[<>:"/\\|?*]', '_'
}

# Loop through each section
foreach ($section in $sections) {
    # Extract the first line as the title and sanitize it for a valid filename
    $title = ($section -split "`n")[0].TrimStart('#').Trim()
    $safeTitle = Get-SafeFileName $title
    $filename = "$safeTitle.md"
    
    # Replace "##" with "#" in the section content
    $sectionContent = $section -replace '##', '#'

    # Write the section content to the new file
    Set-Content -Path $filename -Value $sectionContent.Trim()

    Write-Host "Created file: $filename"
}

Write-Host "Sections have been split into separate files."
