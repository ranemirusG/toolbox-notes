$groups = Get-LocalGroup

foreach ($group in $groups) {
    Write-Host "Group: $($group.Name)"
    $members = Get-LocalGroupMember -Group $group.Name
    
    if ($members) {
        $memberNames = $members | Select-Object -ExpandProperty Name
        Write-Host "Members: $($memberNames -join ', ')"
    } else {
        Write-Host "No members found."
    }
    
    Write-Host
}
