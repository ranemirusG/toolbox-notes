param (
    [string]$searchString,  # The string to search for, passed as an argument
    [switch]$help           # A switch parameter to display help information
)

# Display help if the help flag is passed
if ($help) {
    $helpMessage = @"
Simple Grep Script
This script searches for a specified string in files within the current directory and subdirectories.

Usage:
  .\simple_grep.ps1 <searchString> [-help]

Options:
  <searchString>  The string to search for in files.
  -help           Displays this help message.

Output Choices:
  'f': Display a list of unique files containing the matching lines.
  'l': Display all matching lines with file information.
"@
    Write-Host $helpMessage -ForegroundColor Cyan
    exit
}

# Check if the search string is provided
if (-not $searchString) {
    Write-Host "No search string provided."
    Write-Host "Usage: .\simple_grep.ps1 <searchString> [-help]"
    exit
}

# Function to prompt for a valid output choice
function Get-ValidOutputChoice {
    while ($true) {
        $choice = Read-Host "Enter 'f' for files with matching lines (unique) or 'l' for all matching lines"
        if ($choice -eq "f" -or $choice -eq "l") {
            return $choice
        } else {
            Write-Host "Invalid choice. Please enter 'f' or 'l'." -ForegroundColor Yellow
        }
    }
}

# Prompt for a valid output choice
$outputChoice = Get-ValidOutputChoice

# Perform the search based on the output choice
switch ($outputChoice) {
    "f" {
        Get-ChildItem -Recurse |
        Select-String -Pattern $searchString |
        Select-Object -ExpandProperty Path -Unique
    }
    "l" {
        Get-ChildItem -Recurse |
        Select-String -Pattern $searchString
    }
}





<#

# Old Version

$searchString = Read-Host -Prompt "Enter the string to search for"

$outputChoice = Read-Host "f for files matching lines (unique) or l for all matching lines"

switch ($outputChoice) {
    "f" {


		Get-ChildItem -Recurse | Select-String -Pattern $searchString | Select-Object -ExpandProperty Path -Unique

    }
    "l" {
		Get-ChildItem -Recurse | Select-String -Pattern "$searchString"
    }
    default {
        Write-Host "Invalid choice" -ForegroundColor Red
    }
}
#>