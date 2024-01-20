function xah-dir-size {
    # .DESCRIPTION
    # Show dir size (counts all subdirs)
    # First arg is path of a dir. Default to current dir.
    # Version 2022-06-07 2022-06-28 2022-08-28
    # .LINK
    # http://xahlee.info/powershell/powershell_dir_size.html
    Param( [string] $path )
    $total = ((dir $path -File -Recurse | measure -Property Length -Sum).sum);
    "{0:#,#} bytes" -f $total;
}