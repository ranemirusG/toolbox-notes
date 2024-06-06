# Certificates

A certificate, which is issued by a certification authority, is a confirmation of your identity and contains information used to protect data or to establish secure network connections. A certificate store is the system area where certificates are kept.


## Resources
- <https://en.wikipedia.org/wiki/Certificate_Transparency>
- <https://aws.amazon.com/what-is/ssl-certificate/>
- <https://stackoverflow.com/questions/40061263/what-is-ca-certificate-and-why-do-we-need-it>
- <https://curl.se/docs/sslcerts.html>







## Tools
https://crt.sh

`openssl s_client -showcerts -connect stackoverflow.com:443`



### Powershell
`Get-ChildItem -Path Cert:\LocalMachine\Root | Where-Object {$_.Issuer -like "*Portswigger*"} | Format-List`







## Certificate Authorities
- <https://en.wikipedia.org/wiki/Certificate_authority>

Let's encrypt
VeriSign
	https://www.verisign.com/en_US/website-presence/online/ssl-certificates/index.xhtml
Symantec
Thawte
WebTrust










## Browser's Lock Icon (or Tune Icon, see <https://blog.chromium.org/2023/05/an-update-on-lock-icon.html>)

`Click the icon > Show certificate`


### FBI: Cyber Actors Exploit 'Secure' Websites In Phishing Campaigns <https://www.ic3.gov/Media/Y2019/PSA190610>
Websites with addresses that start with “https” are supposed to provide privacy and security to visitors. After all, the “s” stands for “secure” in HTTPS: Hypertext Transfer Protocol Secure. In fact, cyber security training has focused on encouraging people to look for the lock icon that appears in the web browser address bar on these secure sites. The presence of “https” and the lock icon are supposed to indicate the web traffic is encrypted and that visitors can share data safely. Unfortunately, cyber criminals are banking on the public’s trust of “https” and the lock icon. They are more frequently incorporating website certificates—third-party verification that a site is secure—when they send potential victims emails that imitate trustworthy companies or email contacts. These phishing schemes are used to acquire sensitive logins or other information by luring them to a malicious website that looks secure.

RECOMMENDATIONS:
The following steps can help reduce the likelihood of falling victim to HTTPS phishing:

- Do not simply trust the name on an email: question the intent of the email content.
- If you receive a suspicious email with a link from a known contact, confirm the email is legitimate by calling or emailing the contact; do not reply directly to a suspicious email.
- Check for misspellings or wrong domains within a link (e.g., if an address that should end in “.gov” ends in “.com” instead).
Do not trust a website just because it has a lock icon or “https” in the browser address bar.





