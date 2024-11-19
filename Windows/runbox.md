# Run Box



## Launch Run Box
```
Win + R
Win + X > R

c:\windows\system32\rundll32.exe shell32.dll,#61

explorer.exe shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}
explorer shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}


(New-Object -ComObject "Shell.Application").FileRun()
```












## Accessing Known Folders
You can use the `shell:` command in File Explorer or the Run Box to access known folders:
```
shell:Desktop
shell:Downloads
shell:AppsFolder
```




## MSC commands

La extensión .MSC son archivos de control que están asociados con la Consola de Administración de Microsoft (Microsoft Management Console) y sirven para ejecutar tareas administrativas.

Microsoft Management Console es un framework sobre herramientas administrativas. Viene con una interfaz gráfica de usuario y admite la creación, ejecución y ahorro de trabajos administrativos. MSC derivan de Microsoft Management Console Snap-in

El framework hospeda las herramientas y las muestra en su interfaz utilizando los denominados snap-ins y complementos de snap-ins. Lo que hace que la Consola de Administración de Microsoft sea tan flexible es que los administradores pueden crear y asignar herramientas a grupos de usuarios, equipos informáticos o usuarios específicos.

- <https://learn.microsoft.com/en-us/previous-versions/windows/desktop/mmc/snap-ins>




La ubicación predeterminada de los archivos MSC es `C:\Windows\System32`.



Archivo MSC	Consola	Descripción
azman.msc
Administrador de Autorización
Gestionar los almacenes de autorización.

certlm.msc
Certificados del Equipo Local
Carga la lista de certificados del equipo local.

certmgr.msc
Certificados de Usuario
Carga la lista de certificados de usuario.

comexp.msc
Servicios de Componentes
Cargas Servicios de componentes, Visor de eventos y servicios.

compmgmt.msc
Administración de Equipos
Incluye Herramientas del sistema, Almacenamiento y Servicios y Aplicaciones.

devmgmt.msc
Administrador de Dispositivos
Abre el Administrador de dispositivos para administrar el hardware y los dispositivos.

devmoderunasuserconfig.msc
Configuración de Usuario
Permite la Configuración de Software, la Configuración de Windows y Plantillas
 Administrativas.
diskmgmt.msc
Administración de Discos
Se abre Administración de discos para administrar dispositivos de almacenamiento
 conectados.
eventvwr.msc
Visor de Eventos
Se abre el visor de eventos que muestra eventos del sistema operativo, software y de
 hardware.
fsmgmt.msc
Carpetas Compartidas
Carga la lista de carpetas compartidas, sesiones y archivos abiertos.

gpedit.msc
Editor de Directivas de Grupo Local
Carga el Editor de directivas de grupo para administrar las políticas del sistema.

lusrmgr.msc
Usuarios y Grupos Locales
Interfaz para gestionar los usuarios locales y grupos de usuarios.

perfmon.msc
Monitor de Rendimiento
Carga el Monitor de rendimiento de Windows.

printmanagement.msc
Administración de Impresión
Administrar impresoras.

rsop.msc
Conjunto Resultante de Directivas
Lista de Políticas, los resultados completos sólo disponibles a través de la
 herramienta gpresult online.
 
secpol.msc
Directiva de Seguridad Local
Carga políticas tales como las directivas de cuentas, las políticas de clave pública,
 o la configuración de directiva de auditoria avanzada.
 
services.msc
Servicios
Carga la lista de servicios instalados para gestionarlos.

taskschd.msc
Programador de Tareas
Carga el programador de tareas para gestionar las tareas.

tpm.msc
Administración del TPM
Gestionar la TPM en el dispositivo local.

wf.msc
firewall de Windows con Seguridad Avanzada
Se inicia el Firewall de Windows con seguridad avanzada.

wmimgmt.msc
Raíz de Consola / Control WMI
Configurar y controlar el servicio de instrumentación de administración de Windows.


## 2 COMANDOS DE ARCHIVOS MSC PARA EJECUTAR EN WINDOWS SERVER

adfs.msc
Servicios de federación de Active Directory

AdRmsAdmin.msc
Active Directory Rights Management Services

adsiedit.msc
Edición de ADSI

certim.msc
Los certificados de equipo local

certsrv.msc
Autoridad de certificación

certtmpl.msc
Plantillas de certificación

ciadv.msc
Servicio de indexación

cluadmin.msc
Failover Cluster Manager

da6to4.msc
Network Interfaces Performance Monitor

daihttps.msc
Tráfico HTTPS del Monitor de rendimiento

daipsecdos.msc
IPSec del Monitor de rendimiento

daisatapmsc
ISATAP del Monitor de rendimiento

dfsmgmt.msc
Administración de DFS

dhcpmgmt.msc
Administración de DHCP

dnsmgmt.msc
Administrador de DNS

domain.msc
Dominios y confianzas de Active Directory

dsa.msc
Usuarios y Computadoras de Active Directory

dssite.msc
Sitios y servicios de Active Directory

fsrm.msc
El Administrador de recursos del servidor de archivos

fxsadmin.msc
Administrador de servicios de Microsoft Fax

gpmc.msc
Administración de Políticas de Grupo

gpme.msc
Editor de administración de directivas de grupo

gptedit.msc
Editor GPO de inicio de directiva de grupo

hcscfg.msc
Autoridad de registro de mantenimiento

idmumgmt.msc
Gestión de Identidad de Microsoft para Unix

iis.msc
Administrador de servicios de información de Internet

iis6.msc
Administrador de servicios de información de Internet 6.0

lsdiag.msc
Diagnóstico de licencias de RD

napclcfg.msc
Configuración del cliente de NAP

mfsmgmt.msc
Servicios para Network File System

nps.msc
Servidor de directivas de red

ocsp.msc
Respondedor en línea

pkiview.msc
Enterprise PKI

remoteprograms.msc
Administrador de RemoteApp

rrasmgmt.msc
Routing y Acceso Remoto

sanmmc.msc
Administrador de almacenamiento para redes SAN

sbmgr.msc
Administrador de conexión a Escritorio remoto

scanmanagement.msc
Administración de digitalización

servermanager.msc
Administrador del servidor

storagemgmt.msc
Compartir y administrar almacenamiento

storexpl.msc
Explorador de almacenamiento

tapimgmt.msc
Telefonía

tsadmin.msc
Administrador de servicios de escritorio remoto

tsconfig.msc
Configuración del host de sesión de Escritorio remoto

tsgateway.msc
Administrador Gateway de RD

tsmmc.msc
Escritorios remotos

virtmgmt.msc
Hyper-V

wbadmin.msc
Seguridad de Windows Server

Wdsmgmt-msc
Servicios de implementación de Windows

winsmgmt.msc
WINS

wbiadmin.msc
Seguridad de Windows Server

wsrm.msc
Administrador de recursos del Sistema de Windows

wsus.msc
Servicios de actualización









## Shell commands

1. shell:SendTo - Send to folder  
2. shell:Start Menu - Start menu folder  
3. shell:Startup - Roaming Startup folder  
4. shell:Common Startup - Startup folder  
5. shell:Recent - Recent items folder  
6. shell:Roaming Tiles - Roaming tiles folder  
7. shell:CommonVideo - Public user account’s Public Videos folder  
8. shell:OneDrivePictures - OneDrive pictures folder  
9. shell:PrintersFolder - Printers folder with a gallery of all printers  
10. shell:Common Programs - Programs folder in the Start menu folder  
11. shell:Camera Roll - Current user’s Camera Roll folder  
12. shell:Templates - Templates folder inside Roaming folder  
13. shell:InternetFolder - Internet folder (no longer available in Windows 11)  
14. shell:AppDataDocuments - App Data Documents folder (no longer available in Windows 11)  
15. shell:My Pictures - Current user’s Pictures folder  
16. shell:UserProgramFiles - App Data > Local > Programs folder  
17. shell:PrintHood - Printer Shortcuts folder  
18. shell:MyComputerFolder - This PC folder in File Explorer  
19. shell:ProgramFilesX86 - Program Files (x86) folder  
20. shell:My Video - Current user’s Videos folder  
21. shell:Common Templates - ProgramData > Templates folder  
22. shell:NetworkPlacesFolder - Network page in File Explorer  
23. shell:Public - Public user folder  
24. shell:NetHood - Network Shortcuts folder  
25. shell:AccountPictures - Roaming Account Pictures folder  
26. shell:ProgramFilesCommon - Common Files folder  
27. shell:SearchHistoryFolder - Search History folder (no longer available in Windows 11)  
28. shell:CSCFolder - (no longer available in Windows 11)  
29. shell:Recorded Calls - (no longer available in Windows 11)  
30. shell:Local Downloads - Downloads folder  
31. shell:AppDataProgramData - (no longer available in Windows 11)  
32. shell:PublicLibraries - Public user’s Library folder  
33. shell:ProgramFilesX64 - Program Files folder  
34. shell:ProgramFilesCommonX86 - Program Files (x86) > Common Files folder  
35. shell:Administrative Tools - Windows Tools folder  
36. shell:UserProfiles - User profiles folder  
37. shell:PublicAccountPictures - Public user’s Account Pictures folder  
38. shell:SearchTemplatesFolder - (no longer available in Windows 11)  
39. shell:ThisDeviceFolder - This Device folder  
40. shell:Cookies - INetCookies folder  
41. shell:Local Pictures - Current user’s Pictures folder  
42. shell:ImplicitAppShortcuts - Implicit App Shortcuts folder  
43. shell:VideosLibrary - Videos folder  
44. shell:ResourceDir - Resources folder  
45. shell:Windows - Windows Folder  
46. shell:Device Metadata Store - Device Metadata Store folder  
47. shell:ThisPCDesktopFolder - Desktop folder  
48. shell:Common Administrative Tools - Start menu Windows Tools folder  
49. shell:System - System32 folder  
50. shell:History - History folder  
51. shell:Personal - Current user’s Documents folder  
52. shell:Quick Launch - Quick Launch folder  
53. shell:Links - Links folder  
54. shell:User Pinned - User Pinned folder  
55. shell:MusicLibrary - Current user’s Music Library folder  
56. shell:Common Start Menu - Program Data > Start menu folder  
57. shell:Ringtones - AppData Local Ringtones folder  
58. shell:Original Images - (no longer available in Windows 11)  
59. shell:AppDataFavorites - (no longer available in Windows 11)  
60. shell:ProgramFilesCommonX64 - Program Files Common Files folder  
61. shell:LocalizedResourcesDir - (no longer available in Windows 11)  
62. shell:My Music - Current user’s Music folder  
63. shell:Desktop - Current user’s Desktop folder  
64. shell:AddNewProgramsFolder - Get Programs page in Control Panel  
65. shell:CommonPictures - Public user’s Public Pictures folder  
66. shell:ControlPanelFolder - Control Panel Items page  
67. shell:SavedGames - Current user’s Saved Games folder  
68. shell:Common AppData - ProgramData folder  
69. shell:DpapiKeys - AppData > Protect folder  
70. shell:SavedPictures - Pictures > Saved Pictures folder  
71. shell:OneDriveMusic - OneDrive music folder  
72. shell:CommonDownloads - Public Downloads folder  
73. shell:GameTasks - Game Explorer folder  
74. shell:Cache - INetCache folder  
75. shell:PublicGameTasks - Public Game Explorer folder  
76. shell:Retail Demo - Retail Demo folder (may not work on all systems and Windows versions)  
77. shell:PhotoAlbums - (no longer available in Windows 11)  
78. shell:Common Documents - Public documents folder  
79. shell:ChangeRemoveProgramsFolder - Programs and Features page in the Control Panel  
80. shell:MAPIFolder - (no longer available in Windows 11)  
81. shell:CommonRingtones - Ringtones folder  
82. shell:Searches - Current user’s searches folder  
83. shell:Programs - Start Menu Programs folder  
84. shell:SystemCertificates - System Certificates folder  
85. shell:Local Documents - Documents folder  
86. shell:PicturesLibrary - Pictures folder  
87. shell:CryptoKeys - AppData Crypto folder  
88. shell:RecordedTVLibrary - (no longer available in Windows 11)  
89. shell:Contacts - Contacts folder  
90. shell:Local Videos - Video folder  
91. shell:AppDataDesktop - (no longer available in Windows 11)  
92. shell:OneDrive - OneDrive folder  
93. shell:OEM Links - OEM Links folder (may not work on all systems and Windows versions)  
94. shell:OneDriveDocuments - OneDrive documents folder  
95. shell:HomeGroupFolder - (no longer available in Windows 11)  
96. shell:Common Start Menu Places - (no longer available in Windows 11)  
97. shell:AppMods - (no longer available in Windows 11)  
98. shell:ConflictFolder - Sync Center Conflicts folder in the Control Panel  
99. shell:CD Burning - Temporary Burn folder  
100. shell:Fonts - Fonts folder  
101. shell:CommonMusic - Public Music folder  
102. shell:Captures - Current user’s Video > Captures folder  
103. shell:Development Files - (no longer available in Windows 11)  
104. shell:HomeGroupCurrentUserFolder - (no longer available in Windows 11)  
105. shell:SyncCenterFolder - Sync Center page in Control Panel  
106. shell:RecycleBinFolder - Open Recycle Bin  
107. shell:3D Objects - 3D Objects folder (may not work in Windows 11)  
108. shell:LocalAppDataLow - AppData LocalLow folder  
109. shell:SearchHomeFolder - Search results page in File Explorer  
110. shell:Application Shortcuts - AppData Local Application Shortcuts folder  
111. shell:Downloads - Downloads folder  
112. shell:Favorites - Current user’s Favorites folder  
113. shell:CameraRollLibrary - Current user’s camera roll folder  
114. shell:Screenshots - Pictures > Screenshots folder  
115. shell:SavedPicturesLibrary - Current user’s Saved Pictures folder  
116. shell:Profile - Current user’s profile folder  
117. shell:ConnectionsFolder - Network Connections page in the Control Panel  
118. shell:Local AppData - AppData > Local folder  
119. shell:OneDriveCameraRoll - OneDrive camera roll folder  
120. shell:ProgramFiles - Program Files folder  
121. shell:Common Desktop - Public user’s desktop folder  
122. shell:CredentialManager - Credentials folder in ‘Appdata > Roaming’ folder  
123. shell:SyncResultsFolder - Sync Results folder in the Control Panel  
124. shell:AppData - AppData folder  
125. shell:Libraries - Current user’s libraries folder  
126. shell:DocumentsLibrary - Current user’s documents folder  
127. shell:SyncSetupFolder - Sync setup page in the Control Panel  
128. shell:AppsFolder - Applications folder  
129. shell:Roamed Tile Images - (no longer available in Windows 11)  
130. shell:UserProgramFilesCommon - AppData > Local > Programs > Common folder  
131. shell:SystemX86 - SysWOW64 folder  
132. shell:Local Music - Music folder  
133. shell:UsersFilesFolder - Current user’s profile folder  
134. shell:Playlists - (no longer available in Windows 11)  
135. shell:UsersLibrariesFolder - Libraries folder  
136. shell:AppUpdatesFolder - Installed Windows updates page in the Control Panel  
