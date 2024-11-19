# Forensics


Triage Image (Small) > A collection of key artifacts from an operating system such as event logs, registry hives, and system files. The benefit of this type of image is that you will get 90% of the information in about 5% of the size
Logical Image (Moderate) > A copy of the physical disk but without the slack space
Forensic Image (Large) > A bit for bit copy of the physical disk including all of the slack space.


## Digital Evidence

It’s information or data that is related to an investigation, which is stored on, transmitted, or received by an electronic device

Files and data can be hidden in slack space on hard drives, and hidden inside legitimate files using steganography. 

When moving away from physical storage and looking at networking, there are a number of evidence types we can collect and use. Browser history is a big one, by working as a record book of what sites the user has visited, we can use this to understand what resources have been accessed online, and when. This is beneficial when dealing with events where an employee may be breaching the company’s Acceptable Use Policy by inappropriately browsing the internet during work hours (too much time on social media, gaming, inappropriate or pornographic sites, illegal sites, working on a personal business whilst at work).

Web proxy or router will also hold information about requested sites online, as everything will likely go through these systems. 


Mobile: Evidence such as call history (incoming/outgoing/number/duration), text messages, contacts, web history, images, videos, apps, GPS location, notes, and much more can be retrieved if appropriate. 

Evidencia volatil está en RAM o en algún cache que se pierde al perder la energía

Volatile Data: can be lost if a system is powered off


https://www.computerhope.com/jargon/s/slack-space.htm




https://www.incibe.es/empresas/blog/sabes-hacer-desechar-tu-dispositivo-movil
exigir certificado de destruccion a proveedores (INCIBE)




videos Alonso Caballero
https://www.youtube.com/watch?v=JAJvLd-_kk8
https://www.youtube.com/watch?v=25Zs0S61Dkk




https://en.wikipedia.org/wiki/Volatile_memory


# formato de evidencia mas utilizado
	raw ----> "dd"
	encase (comprime)






RFC 3227





























########


https://www.hexordia.com/




















































What does MAC timestamps stand for?
	modified accessed created


What endian are Windows personal computers?
little-endian



Association of Chief Police Officers (ACPO) guidelines. These guidelines were established in the United Kingdom to provide standards and best practices for forensic investigations conducted by law enforcement agencies. They outline procedures for collecting, handling, and analyzing digital evidence in a manner that ensures its integrity and admissibility in court. The ACPO guidelines have been influential in shaping digital forensic practices internationally, especially in law enforcement contexts.


Which of the following Windows utilities can be used to remotely administer a system via the command-line?
The two correct answers for remotely administering a system via the command-line in Windows are PSExec and WinRM. PsExec is a command-line tool provided by Microsoft's Sysinternals suite that allows you to remotely execute processes on another system. It can be used to run commands, scripts, or programs on a remote computer, making it a powerful tool for remote administration. Windows Remote Management (WinRM) is a Microsoft technology that enables remote management and automation of Windows-based systems. WinRM allows you to execute commands and scripts remotely, making it an essential component for remote administration and scripting in a Windows environment. It's used with PowerShell and other scripting languages to manage remote systems. The other options do not primarily serve as tools for remote administration via the command-line: Certutil is a command-line tool used for various certificate-related operations, such as managing certificates and certificate stores. It is not a tool for remote system administration. Conhost is a Windows console host process that provides support for console applications. It is not a utility for remote administration but rather a fundamental component of the Windows command-line interface. Rundll32 is a Windows utility used to execute functions exported from DLLs (Dynamic Link Libraries). While it can be used to run specific functions, it is not a dedicated tool for remote system administration.












































































# Resources

https://www.opentext.com/products/tableau-forensic-duplicators?utm_source=tableau&utm_medium=redirect


Certificaciones genericas:

CCE (Certified Computer Examiner)
GCFE (GIAC Certified Forensic Examiner)

Certificaciones de herramientas:
EnCE (EnCase Certified Examiner)
MCFE (Magnet Certified Examiner)
CCO (Cellebrite Certified Operator)
CCPA (Cellebrite Certified Physical Analist)

# Software

Software Autopsy https://www.autopsy.com

Software FTK Imager  https://accessdata.com/product-download/ftk-imager-version-4-5

Repositorio de casos de practica e imagenes forenses de computadoras y celulares https://digitalcorpora.org/

https://info-lab.org.ar

https://wiebetech.com/

https://www.igorware.com/hasher

https://www.magnetforensics.com/products/magnet-axiom/

https://en.wikipedia.org/wiki/High_Technology_Crime_Investigation_Association


# Books

"Your Code as a Crime Scene: Use Forensic Techniques to Arrest Defects, Bottlenecks, and Bad Design in Your Programs" (Adam Tornhill)










GRAFOCRITICA, El Documento, La Escritura y su Proyección Forense. Editorial Tecnos. Madrid 1963.
TRATADO DE CRIMINALISTICA. Documentos Tomo I. Editorial Policial. Buenos Aires 1983
TRATAMIENTO DE EVIDENCIAS INFORMÁTICAS
Forensic Guide for Digital Evidence : A Guide for LE, USADOJ 2004
Computer Forensics –Incident Response Essentials, Warren Krause III Addison W , 2002
Guide to Computer Forensics and Investigations, Nelson & Phillips , Thomson 2nd Ed , 2006
DELITOS INFORMÁTICOS: ESTAFAS Y FRAUDES. (2005). Obtenido de http://delitosinformaticos.com/estafas/: http://delitosinformaticos.com/estafas/
biblioteca jurídica OnLine. (01 de 02 de 2012). Recuperado el 12 de febreri de 2012, de http://www.eldial.com:
Amadeo, S., & Palazzi, P. (1999). Codigo Procesal penal de la Nacion "Anotado con jurisprudencia". Buenos Aires: Depalma.
Argentina. (2006). Codigo Procesal Penal de la Nacion. Buenos Aires: zavalia.
Ashcroft, J. (1999). FORENSIC EXAMINATION OF DIGITAL EVIDENCE. N. W. Washington, DC, U.S: Department of Justice Office of Justice Programs.
Barrett, D., Kipper, G., & Barrett, D. (2010). VIRTUALIZATION AND FORENSIC. Internet: Libro electronico.
Brenna, R. G. (2002). INFORMATICA Y DERECHO (Aportes de Doctrina Internacional). Buenos Aires: DEPALMA.
BREZINSKI, D. y. (2002). Guidelines for Evidence Collection and Archiving.
Casey, E. (2011). Digital Evidence and Computer Crime, Third Edition: Forensic Science, Computers, and the Internet.
Cuervo, J. (2011). Base de información a los investigadores en el campo del Derecho Informático. Obtenido de http://www.informatica-juridica.com: http://www.informatica-juridica.com
Darahuge, M., & Arellano, L. (2011). MANUAL DE INFORMÁTICA FORENSE. Buenos Airea: ERREPAR SA.
García Martínez, A. (2001). LA FORMACIÓN DE UN IRT (Incident Response Team) FORENSE.
Garrone, J. (1986). Dicionario Juridico. Buenos Aires: Abeledo Perrot SAE.
Ghosh, A. (2004). Guidelines for the Management.
GODFREY, T. (2003). New Guidelines to Combat E-Crime.
International Organization for Standardization , & information security standard. (2007). ISO/IEC ISO IEC 27001, 27002. -: -.
John, R. (1998). TCP/IP Edicion Especial. Espana: Fareso SA.
José, C. M. (2003). Admisibilidad de la Evidencia Digital.
Judicial, D. (02 de 01 de 2012). Diario Judicial. Obtenido de http://www.diariojudicial.com/: http://www.diariojudicial.com/
JUSTICE, U. D. (2004). A guide for law enforcement. Special Report.
JUSTICE, U. D. (2004). Forensic examination of digital evidence.
Justice, U. D. (s.f.). The Computer Crime and Intellectual Property Section “CCIPS”. Obtenido de http://www.justice.gov/criminal/cybercrime/: http://www.justice.gov/criminal/cybercrime/
Library, N. S. (s.f.). National Software Reference Library. Obtenido de http://www.nsrl.nist.gov/: http://www.nsrl.nist.gov/
María Teresa , J., Caballero Velasco, M., Pérez, C., Matas García, A., & Soler, E. (2012). Hackers Edicion2012. Mexico: Edigrafos SA.
Martínez Alvarez, E. (2009). CÓDIGO PROCESAL CIVIL Y COMERCIAL DE LA NACIÓN. Buenos Aires: ZAVALIA.
Menezes, A., Paul, O., & Scott, V. (s.f.). Handbook of applied cryptography. 1997: CRC Press Inc.
Rabinovich de Landau, S. G. (2002). EL PERITAJE JUDICIAL (Doctrina y Jurisprudencia, Leyes, Decretos, Reglamentos y Acordadas. Modelos de Escritos y Peritajes). Buenos Aires: LA LEY.
S., T. A. (2011). Redes de Computadoras Cuarta edicion. Buenos aires .
Salgado, F., & Luzmila, L. (2009). DERECHO INFORMÁTICO. Mexico: PATRIA.
Stallings, W. (2005). Cryptography and Netware Security. 4º edition, Prentice Hall.