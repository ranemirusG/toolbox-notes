function xah-rename-to-hash {
    # .DESCRIPTION
    # Rename piped file to the file's hash.
    # must get arg from pipe.
    # if file base name is already hexstring and all caps and length 64, no rename is done.
    # Version 2022-07-26 2022-09-05
    # .EXAMPLE
    # dir -recurse -file -filter *.jpg | xah-rename-to-hash
    # .LINK
    # http://xahlee.info/powershell/powershell_rename_file_to_hash.html

    process {

        if ($null -eq $_) {
            Write-Host "Pipe is empty. Nothing is done."
            return
        }

        $leaf = Split-Path -Leaf $_;
        $leafBase = Split-Path -LeafBase $_;

        if ((64 -eq $leafBase.length) -and ($leafBase -cmatch "^[0-9A-F]+$")) {  }
        else {
            # Sample
            # 005662EE35110980CEDC1E5B1CD0E23B329C394A65E9134B2EBD0EAE3EC09DC3

            $ext = Split-Path -Extension $_;
            $newName = (Get-FileHash $_).hash + $ext;
            Write-Host "Renaming`n $leaf to`n $newName"
            Rename-Item $_ $newName
        }
    }
}