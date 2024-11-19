# Users


## Built-in (Windows Home):                                                            
WDAGUtilityAccount 
	A user account managed and used by the system for Windows Defender Application Guard scenarios.
Guest
	Built-in account for guest access to the computer/domain                                       
DefaultAccount
	A user account managed by the system.                                                          
Administrator
	Built-in account for administering the computer/domain                                         


## Built-in (Windows Server):
Administrator
Guest
KRBTGT (solo en dominios Active Directory)
IUSR_MachineName (si se instala IIS)
IWAM_MachineName (si se instala IIS)

Cuentas especiales:
Localsystem
LocalService
NetworkService


## Well-known SIDs
are constant across all systems. They're created when the operating system or domain is installed. They're called well-known SIDs because they identify generic users or generic groups.





- Win+R > lusrmgr.msc
- Control Panel > User Accounts



```
# go to Users directory
sl $env:SystemDrive/users


whoami /user
whoami /priv
whoami /all

hostname



# Logged users
PsLoggedOn \\[HOSTNAME] # SysInternals

# user last logon
net user john | findstr /B /C:"Last logon"





# List users in domain
net user /[DOMAIN]
net user [USERNAME] /[DOMAIN]






# List active user accounts in local system
net user
net users
Get-LocalUser
Get-LocalUser | Format-Table Name, Enabled, LastLogon
Get-LocalUser | Sort-Object -Property Enabled | Format-Table Name, Enabled, LastLogon



# list all SIDs on a system
gcim Win32_Account | ft Name, SID

# list all User SID
gcim Win32_UserAccount | ft Name, SID
Get-WmiObject win32_useraccount | Select name,sid

# Get SID from User
$objUser = New-Object System.Security.Principal.NTAccount("DOMAIN_NAME", "USER_NAME")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value

#Get User from SID
$objSID = New-Object System.Security.Principal.SecurityIdentifier S-1-5-21-455291304-1752063992-2633877976-1002
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
$objUser.Value

# Local user to SID
$objUser = New-Object System.Security.Principal.NTAccount(LOCAL_USER_NAME)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value

















# add user
net user "username" "p@ssw0rd" /add
New-LocalUser

# delete user
net user "username" /delete
Remove-LocalUser -Name "Username"

# Change user password
net user <username> <newpassword>

# Enable / Disable user
Disable-LocalUser -Name "[USERNAME]"
net user [USERNAME] /active:no

# enable/disable the built-in Administrator:
net user administrator /active:yes
net user administrator /active:no


```