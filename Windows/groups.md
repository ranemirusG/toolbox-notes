# Groups

```
whoami /groups




# Enumerate all groups in the entire domain
net group /domain
net group [GROUP NAME] /domain
net group "Sales Department" /domain



net localgroup
net localgroup [GROUP NAME]
net localgroup Administrators

Get-LocalGroup
Get-LocalGroup | Format-Table Name, PrincipalSource
get-LocalGroup | ft Name, SID






# List group members
Get-LocalGroupMember -Group "Administrators"
(Get-LocalGroupMember “Administrators”).Name





# Create new group
New-LocalGroup -Name "[GROUP NAME]"

# Delete group
Remove-LocalGroup "[GROUP NAME]"

# Add/Delete user to group
Add-LocalGroupMember -Group "GROUP" -Member "USER"
Remove-LocalGroupMember -Group "GROUP" -Member "USER"
net localgroup "GROUP" "USER" /add # cmd
net localgroup "GROUP" "USER" /delete # cmd


```