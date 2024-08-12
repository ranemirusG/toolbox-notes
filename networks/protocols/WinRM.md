# Windows Remote Management (WinRM)

TCP port 5985 and 5986 (HTTPS)

Is a Windows remote management protocol that can be used to facilitate remote access with Windows systems.

WinRM is typically used in the following ways:
- Remotely access and interact with Windows hosts on a local network.
- Remotely access and execute commands on Windows systems on the internet.
- Manage and configure Windows systems remotely.

WinRM implements access control and security for communication between systems through various forms of authentication.






## MSF

auxiliary/scanner/winrm/winrm_auth_methods
auxiliary/scanner/winrm/winrm_login
auxiliary/scanner/winrm/winrm_cmd

exploit/windows/winrm/winrm_script_exec