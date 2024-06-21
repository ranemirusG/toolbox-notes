# Cryptography

Practice and study of techniques for secure communication




## Encryption
In cryptography, encryption is the process of encoding information in a way that only authorized parties can decode. This process converts plaintext into ciphertext.


### Symmetric Encryption

Primary uses of symmetric algorithms:

Encrypting bulk data (backups, hard drives, portable media)
Encrypting messages traversing communications channels (IPsec, TLS)
Streaming large-scale, time-sensitive data (audio/video materials, gaming, etc.)
Other names for symmetric algorithms, which you may encounter, include:

Same key
Single key
Shared key
Secret key
Session key

An example of symmetric encryption is a substitution cipher, which involves the simple process of substituting letters for other letters, or more appropriately, substituting bits for other bits, based upon a cryptovariable. These ciphers involve replacing each letter of the plaintext with another that may be further down the alphabet.





### Asymmetric Encryption

A user wishing to communicate using an asymmetric algorithm would first generate a key pair. To ensure the strength of the key generation process, this is usually done by the cryptographic application or the public key infrastructure (PKI) implementation without user involvement. One half of the key pair is kept secret; only the key holder knows that key. 

Asymmetric key cryptography solves the problem of key distribution by allowing a message to be sent across an untrusted medium in a secure manner without the overhead of prior key exchange or key material distribution. It also allows for several other features not readily available in symmetric cryptography, such as the non-repudiation of origin and delivery, access control and data integrity.

also solves the problem of scalability. It does scale well as numbers increase, as each party only requires a key pair, the private and public keys.

The problem, however, has been that asymmetric cryptography is extremely slow compared with its symmetric counterpart. Asymmetric cryptography is impractical for everyday use in encrypting large amounts of data or for frequent transactions where speed is required. This is because asymmetric key cryptography is handling much larger keys and is mathematically intensive, thereby reducing the speed significantly.









## Hash Function
A hash function is a one-way function that takes any amount of data and returns a fixed size value. 
The values returned by a hash function are called:

hashes
digest
hash values
fingerprint
hash codes
hash digests










## Names & Algorithms


Claude Elwood Shannon (1916 -2001)
	- A Mathematical Theory of Communication (1948)
	- Communication Theory of Secrecy Systems (1949)
	Kerckhoffs's principle: "The enemy knows the system"

Horst Feistel
	- Lucifer (1971)
	- DES (1976)



Ralph Merkle

Bruce Schneier <https://www.schneier.com/>


## Diffie-Hellman (1976)
- Whitfield Diffie
- Martin Hellman

- <https://ee.stanford.edu/~hellman/publications/24.pdf>
- <https://security.stackexchange.com/questions/45963/diffie-hellman-key-exchange-in-plain-english>

Intercambio de Claves de Diffie-Hellman.
Ambos extremos de una comunicación puedan calcular la misma clave secreta, aunque para ello deban intercambiar datos a través de un canal inseguro.
Suele usarse para determinar claves de sesión, por ejemplo en `https`.
Cobertura RSA. Un emisor podría enviar un archivo cifrado con una clave simétrica k, y enviar además dicha clave, pero cifrada con la clave pública del receptor al que le quiere enviar la información. El receptor descifrará la clave simétrica k con su clave privada y podrá con ella descifrar el archivo cifrado recibido.

Firma Digital. (Integridad e Autenticación)
El emisor calcula el hash h del mensaje m que desea autenticar y cifra h con su clave privada. El receptor vuelve a calcular h del mensaje recibido y descifra el hash que le enviaron con la clave pública del emisor.. Si ambos valores h coinciden, entonces el mensaje no fue modificado y el emisor fue autenticado.



## RSA (1977)
- Ron Rivest
- Adi Shamir
- Leonard Adleman


## ElGamal (1984)
Basado en el problema matemático del logaritmo discreto.
Es un algoritmo de criptografía asimétrica basado en la idea de Diffie-Hellman.
Puede ser utilizado tanto para generar firmas digitales como para cifrar o descifrar. 
Se usa en GNU Privacy Guard, versiones recientes de PGP.


