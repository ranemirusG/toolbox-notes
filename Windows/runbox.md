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


