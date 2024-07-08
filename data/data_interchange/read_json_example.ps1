<#

# JSON file content sample

[{"computerToolCategoryId":12,"computerToolCategoryName":"Banco de Dados","entityId":12,"entityName":"ComputerToolCategory","labelKey":"vamosnessa.ats.refdata.computertoolcategory.12","deprecated":false,"tools":[{"computerToolId":13,"computerToolName":"Cassandra","computerToolCategoryId":12,"entityId":13,"entityName":"ComputerTool","labelKey":"vamosnessa.ats.refdata.computertool.13"},{"computerToolId":19,"computerToolName":"DB2","computerToolCategoryId":12,"entityId":19,"entityName":"ComputerTool","labelKey":"vamosnessa.ats.refdata.computertool.19"},{"computerToolId":18,"computerToolName":"DataFlex","computerToolCategoryId":12,"entityId":18,"entityName":"ComputerTool","labelKey":"vamosnessa.ats.refdata.computertool.18"},{"computerToolId":22,"computerToolName":"Firebird","computerToolCategoryId":12,"entityId":22,"entityName":"ComputerTool","labelKey":"vamosnessa.ats.refdata.computertool.22"}]

#>


param(
    [Parameter(Mandatory=$true)]
    [string]$JsonFilePath
)

# Read the JSON file
$jsonData = Get-Content -Raw -Path $JsonFilePath | ConvertFrom-Json

# Specify the output file path
$outputFilePath = [System.IO.Path]::ChangeExtension($JsonFilePath, ".txt")

# Initialize an empty string to store the formatted output
$output = ""

# Loop through each category in the JSON data
foreach ($category in $jsonData) {
    # Add category name to the output
    $output += "Category: $($category.computerToolCategoryName)`n"

    # Initialize an empty array to store the computerToolNames for this category
    $categoryToolNames = @()

    # Loop through each tool in the category
    foreach ($tool in $category.tools) {
        # Add the computerToolName to the array
        $categoryToolNames += $tool.computerToolName
    }

    # Add the list of computerToolNames for this category to the output
    $output += ($categoryToolNames -join "`n") + "`n`n"
}

# Output the formatted list to the file
$output | Out-File -FilePath $outputFilePath

# Confirmation message
Write-Host "Computer tool names have been saved to $outputFilePath"

