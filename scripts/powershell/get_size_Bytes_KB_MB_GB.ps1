function Get-DirectorySize {
    param ($path)
    $size = 0
    if (Test-Path $path) {
        $size = (Get-ChildItem -Path $path -Recurse -File | Measure-Object -Property Length -Sum).Sum
    }
    return $size
}

Get-ChildItem | ForEach-Object {
    if ($_.PSIsContainer) {
        $size = Get-DirectorySize $_.FullName
    } else {
        $size = $_.Length
    }
    [PSCustomObject]@{
        Name        = $_.Name
        'Size(Bytes)' = $size
        'Size(KB)'    = [math]::round($size / 1KB, 2)
        'Size(MB)'    = [math]::round($size / 1MB, 2)
        'Size(GB)'    = [math]::round($size / 1GB, 2)
    }
} | Sort-Object 'Size(Bytes)' -Descending | Format-Table -AutoSize
