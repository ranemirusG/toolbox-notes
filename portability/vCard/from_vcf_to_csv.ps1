# Function to convert VCF to CSV
function Convert-VCFtoCSV {
    param(
        [string]$vcfFilePath,
        [string]$csvFilePath
    )

    # Read the content of the VCF file as a single string
    $vcfContent = Get-Content -Path $vcfFilePath -Raw

    # Regular expression to match each vCard entry
    $vcardPattern = "BEGIN:VCARD(.*?)END:VCARD"

    # Find all vCard entries
    $vcardMatches = [regex]::Matches($vcfContent, $vcardPattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)

    # Create an array to store the CSV data
    $csvData = @()

    # Process each vCard entry
    foreach ($match in $vcardMatches) {
        $vcardEntry = $match.Groups[1].Value

        # Extract relevant information from vCard entry
        $birthdayMatch = [regex]::Match($vcardEntry, "BDAY;.*?:(.*?)\r")
        $birthday = $null

        if ($birthdayMatch.Success) {
            $birthdayValue = $birthdayMatch.Groups[1].Value
            if ($birthdayValue -match '^\d{4}-(\d{2}-\d{2})$') {
                $birthday = $matches[1]
            }
        }

        $csvEntry = @{
            'Name'     = [regex]::Match($vcardEntry, "FN:(.*?)\r").Groups[1].Value
            'Email'    = [regex]::Match($vcardEntry, "EMAIL;.*?:(.*?)\r").Groups[1].Value
            'Phone'    = [regex]::Match($vcardEntry, "TEL;.*?:(.*?)\r").Groups[1].Value
            'Address'  = [regex]::Match($vcardEntry, "ADR;.*?:(.*?)\r").Groups[1].Value
            'Birthday' = $birthday
        }

        # Add CSV entry to the array
        $csvData += New-Object PSObject -Property $csvEntry
    }

    # Check if there is any data before exporting to CSV
    if ($csvData.Count -gt 0) {
        # Export the CSV data to a CSV file
        $csvData | Export-Csv -Path $csvFilePath -NoTypeInformation
        Write-Host "Conversion successful. CSV file created at: $csvFilePath"
    } else {
        Write-Host "No vCard entries found in the provided VCF file."
    }
}


# VCF file path
$vcfFile = "path\to\file.vcf"

# CSV file path
$csvFile = "path\to\file.csv"

# Call the function with user-provided paths
Convert-VCFtoCSV -vcfFilePath $vcfFile -csvFilePath $csvFile
