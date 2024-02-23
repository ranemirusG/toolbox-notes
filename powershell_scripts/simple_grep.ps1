# TODO: of course this can be improved
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