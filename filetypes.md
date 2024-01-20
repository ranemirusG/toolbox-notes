







- <https://stackoverflow.com/questions/63195304/difference-between-pem-crt-key-files>


.key is the private key. This is accessible the key owner and no one else.

.csr is the certificate request. This is a request for a certificate authority to sign the key. (The key itself is not included.)

.crt is the certificate produced by the certificate authority that verifies the authenticity of the key. (The key itself is not included.) This is given to other parties, e.g. HTTPS client.

.pem is a text-based container using base-64 encoding. It could be any of the above files.

-----BEGIN EXAMPLE-----
...
-----END EXAMPLE-----