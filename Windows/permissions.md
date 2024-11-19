# Permissions

```

# run as administrator
Start-Process powershell -Verb runas
start powershell -Verb runas
Start-Process wt -Verb runAs


# allow all scripts to run without any restrictions or warnings
powershell -ep bypass

powershell.exe -ExecutionPolicy Bypass -File C:\Temp\your_script.ps1




accesschk “domain\user” -a * -nobanner # Sysinternals




# check whether you have elevated privileges (administrator rights) in PowerShell
# True if you're Admin / False if not
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)



```






## User Account Control (UAC)
is a security feature
protect the operating system from unauthorized changes
informs you when a program wants to make  a change that requires administrative permissions
triggers a consent prompt
each application that requires the ADMINISTRATOR ACCESS TOKEN must prompt the end user for consent
	An access token is an object that describes the security context of a process or thread
 
When a user signs in, the system creates an access token for that user. The access token contains information about the level of access that the user is granted, including specific security identifiers (SIDs) and Windows privileges.

By default, both standard and administrator users access resources and execute apps in the security context of a standard user.
