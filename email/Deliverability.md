# Email Deliverability

## Resources
- <https://glockapps.com/>
- <https://mxtoolbox.com/>
- <https://www.mailgenius.com/>
- <https://sendmarc.com/>


## Warm-up
Smarltead
lemwarm (incluido en los planes de Lemlist)
Snov.io
Apollo.io
Warmbox.




## SPF, DKIM and DMARC
https://www.cloudflare.com/es-es/learning/email-security/dmarc-dkim-spf/










### SPF
https://learn.microsoft.com/es-es/defender-office-365/email-authentication-spf-configure?view=o365-worldwide
https://support.google.com/a/answer/10684623?hl=es
https://support.google.com/a/answer/33786?hl=es&visit_id=638584862928094561-2979556707&rd=1


Ante estas campañas de phishing que estamos viviendo en LATAM es importante tener mucha precaución y la idea de este post es hablar de SPF ✉ 🛡 .
Este protocolo de autenticación va a disminuir posible suplantación de nuestro dominio y solo con el cambio de registro txt de nuestro servicio de DNS. Lo que protegemos realizando la configuración de SPF es en caso de que alguien intenté suplantar nuestra identidad y envíe correos a los demas como podría ser el cambio de una letra, o software para mimetizar nuestros dominios, este chequeo en el receptor falle y se rechace dicho correo malicioso. 

¿Cómo funciona? Es sencillo.

Cuando cargamos en un registro txt las variables para SPF, le indicamos desde donde enviaremos correo, entre ellos nuestra IP y dominios autorizados para mandar en nuestro nombre. Por ejemplo:

v=spf1 mx a ip4:100.100.100.0/32 a:test.ejemplo.com include:tercero.com -all

v=spf1: es el SPF versión 1, un componente que identifica un registro TXT como un registro SPF.
a: autoriza al host detectado en el registro A del dominio a enviar los correos electrónicos.
include: se utiliza para autorizar los correos electrónicos que el remitente puede enviar en nombre de un dominio en el caso del ejemplo tercero.com.
-all: indica al servidor del receptor que las direcciones que no figuran en este registro SPF no están autorizadas a enviar ningún correo electrónico. También le indica a los servidores que rechacen dicha conexión.

Lo que va a hacer el servidor del receptor es chequear estos datos, en caso de que sean correctos, nos va a arrojar un "Pass", en caso de fallar arrojará un "Fail" y se tomará las acciones correspondientes de nuestra configuración. Tiene más respuestas (None, soft-fail, etc.) pero lo interesante es entender estos 2 puntos, donde nosotros declaramos quienes somos.












### DKIM
https://support.google.com/a/answer/33786?hl=es&visit_id=638584862928094561-2979556707&rd=1https://learn.microsoft.com/es-es/defender-office-365/email-authentication-dkim-configure?view=o365-worldwide
https://support.google.com/a/answer/174124?hl=es-419













### DMARC
https://learn.microsoft.com/es-es/defender-office-365/email-authentication-dmarc-configure?view=o365-worldwide
https://support.google.com/a/answer/2466580?hl=es
https://support.google.com/a/answer/2466563?hl=es




















































## Tips (for Outbound Sales)
- Nunca uses tu dominio principal para enviar emails en frío. Esto puede llevarte a quemar tu dominio principal, haciendo que cualquier tipo de correo proveniente de este dominio vaya a SPAM, incluso los que no son automatizados. En cambio, utilizá varios dominios secundarios para tus campañas outbound.
- Dejar un tiempo prudencial entre cada correo que envías
- DKIM, DMARC y SPF bien configurados (MailGenius es una herramienta gratuita para esto. También podés enviar un email de prueba a lavender@email.chk.fixmyemail.com y luego de unos minutos te responderá con tu diagnóstico).
- Monitorea constantemente no estar en ninguna blacklist/blocklist de SPAM, y si lo estuvieses, solicitá que te remuevan. Puedes utilizar MailGenius (gratuita) para esto.
- Utiliza una herramienta de email warm-up (como lemwarm, por ejemplo). Esto es clave en cualquier dominio nuevo, donde se recomienda hacer un warm-up de al menos 14 días antes de enviar cualquier email para construir la reputación necesaria. Si tu dominio no es nuevo, de todas formas también es recomendable continuar haciendo warm-up a tu correo electrónico.
- Envía tus correos en grupos pequeños, idealmente de menos de 40 por día.
- Construye cuidadosamente tus listas de contactos. Selecciona solo contactos que sean relevantes para tu propuesta de valor. Nada de enviar por enviar.
- Verifica bien cada email que está en tu lista de contactos. Podés utilizar una herramienta como Zerobounce o Neverbounce para eso.
- No utilices archivos adjuntos. Al menos no en los primeros emails de tu secuencia.
- No utilices imágenes. Al menos no en los primeros emails de tu secuencia.
- No utilices links. Si, el link de tu firma puede influir en tu deliverability.
- Escribe tus emails en texto sin formato, no utilices texto enriquecido.
- Relevancia y personalización son el mejor remedio contra el SPAM. No des razones para que alguien marque tus correos como SPAM, creá mensajes que estén pensados para la persona que está del otro lado.

- No contactes múltiples contactos de una misma empresa al mismo tiempo. Los filtros
de SPAM podrían pensar que se trata de un intento de phishing o similar.
- Usa spintax, variables y tests A/B para enviar emails distintos.
- No trackees tu tasa de apertura o de clics.
- No utilices proveedores de email diseñados para marketing como Sendgrid o Mailgun. Para emails en frío la mejor opción es atenerse a las reglas de proveedores como Microsoft (Outlook) o Google (GMail).
- Monitorea tu bounce rate, mucho bounce es una red flag 🚩 para los filtros anti SPAM. Objetivo: que sea menor al 2%.
- Optimiza tus mensajes para recibir respuestas, no hay mejor forma de elevar la reputación de tu dominio.
