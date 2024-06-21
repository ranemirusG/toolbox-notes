function xah-subdir-sizes {
    # .DESCRIPTION
    # Show every subdir size.
    # First arg is path of a dir. Default to current dir.
    # Version 2022-06-07 2022-06-28 2022-08-28
    # .LINK
    # http://xahlee.info/powershell/powershell_dir_size.html
    Param( [string] $path )
    dir $path -Directory | foreach {
        $total = ((dir $_ -File -Recurse | measure -Property Length -Sum).sum );
        Write-Host $_.name " " -NoNewline; "{0:#,#} bytes" -f $total; }
}