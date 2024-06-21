<# LOREM IMPSUM (using LibreOffice Autotex)
It has 233 words in total

example:
`> lorem.ps1 10`
It will copy the first 10 words to clipboard

#>





param (
    [int]$numWords
)

# Path to the 7-Zip executable (adjust this path if necessary)
$sevenZipPath = "C:\Program Files\7-Zip\7z.exe"

# Path to the archive file (Libre Office autotext)
$archivePath = "C:\Program Files\LibreOffice\share\autotext\en-US\standard.bau"

# Name of the XML file within the archive
$xmlFileName = "LOREM/LOREM.xml"  # Adjust as needed

# Extract the XML file using 7-Zip and store it as a variable
$extractedContent = & $sevenZipPath e -so "$archivePath" "$xmlFileName"

# Load the extracted content as XML with namespace handling
$xml = [xml]$extractedContent
$namespaceManager = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
$namespaceManager.AddNamespace("text", "http://openoffice.org/2000/text")

# Extract the text within <text:p> elements using the namespace manager
$textNodes = $xml.SelectNodes('//text:p', $namespaceManager) | ForEach-Object { $_.'#text' }

# Join the text nodes and split them into words
$words = $textNodes -split '\s+' | Where-Object { $_ -match '\w' }

# Take the specified number of words
if ($words.Count -gt $numWords) {
    $selectedWords = $words[0..($numWords - 1)]
} else {
    $selectedWords = $words
}

# Set the selected text to the clipboard
$selectedText = $selectedWords -join ' '
$selectedText | Set-Clipboard
Write-Host "Copied to clipboard:"
Get-Clipboard

# Display the selected text
# $selectedText
