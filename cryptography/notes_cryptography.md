# Cryptography
Is the practice and study of techniques for secure communication.




## Encryption
In cryptography, encryption is the process of encoding information in a way that only authorized parties can decode.
This process converts plaintext into ciphertext.

Is a two-way function, in which data is "scrambled" (encrypted) or "unscrambled" (decrypted) with at least one key. Encrypted data is known as a ciphertext.


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




- **Data Encryption Standard (DES)**
  - Block size: 64 bits
  - Key size: 56 bits
  - Notes: One of the oldest encryption standards; now considered insecure due to its small key size.

- **Triple DES (3DES)**
  - Block size: 64 bits
  - Key size: 112 or 168 bits (effectively 112 bits of security)
  - Notes: An extension of DES that applies the DES algorithm three times; still used but largely replaced by more modern algorithms.

- **Advanced Encryption Standard (AES)**
  - Block size: 128 bits
  - Key sizes: 128, 192, or 256 bits
  - Notes: Widely adopted and considered highly secure. AES is used in many security protocols (like SSL/TLS, Wi-Fi encryption).

- **Blowfish**
  - Block size: 64 bits
  - Key size: 32 to 448 bits
  - Notes: Known for being fast and flexible. However, it has largely been replaced by AES.

- **Twofish**
  - Block size: 128 bits
  - Key size: Up to 256 bits
  - Notes: A successor to Blowfish, it was one of the finalists in the AES competition but ultimately not chosen.

- **RC4 (Rivest Cipher 4)**
  - Stream cipher
  - Key size: Variable (40 to 2048 bits)
  - Notes: A widely used stream cipher but has vulnerabilities and is now considered insecure.

- **RC5**
  - Block size: Variable (32, 64, or 128 bits)
  - Key size: 0 to 2040 bits
  - Notes: Highly flexible in terms of key and block size.

- **RC6**
  - Block size: 128 bits
  - Key size: 128, 192, or 256 bits
  - Notes: A refinement of RC5; was a candidate in the AES competition but did not win.

- **IDEA (International Data Encryption Algorithm)**
  - Block size: 64 bits
  - Key size: 128 bits
  - Notes: Often used in early versions of PGP. Still considered relatively secure but less common today.

- **Serpent**
  - Block size: 128 bits
  - Key size: 128, 192, or 256 bits
  - Notes: Another AES finalist, designed to be highly secure but is slower than AES.

- **CAST-128 (CAST5)**
  - Block size: 64 bits
  - Key size: 40 to 128 bits
  - Notes: Used in various applications like GPG and SSL.

- **Camellia**
  - Block size: 128 bits
  - Key size: 128, 192, or 256 bits
  - Notes: Comparable to AES in terms of performance and security, widely used in Japan.

- **SEED**
  - Block size: 128 bits
  - Key size: 128 bits
  - Notes: Developed by the Korean Information Security Agency and widely used in South Korea.

- **ChaCha20**
  - Stream cipher
  - Key size: 256 bits
  - Notes: A modern stream cipher known for efficiency and security, used in TLS protocols as an alternative to AES-GCM.

















### Asymmetric Encryption

A user wishing to communicate using an asymmetric algorithm would first generate a key pair. To ensure the strength of the key generation process, this is usually done by the cryptographic application or the public key infrastructure (PKI) implementation without user involvement. One key of the pair is kept secret; only the key holder knows that key. 

Asymmetric key cryptography solves the problem of key distribution by allowing a message to be sent across an untrusted medium in a secure manner without the overhead of prior key exchange or key material distribution. It also allows for several other features not readily available in symmetric cryptography, such as the non-repudiation of origin and delivery, access control and data integrity.

Also solves the problem of scalability. It does scale well as numbers increase, as each party only requires a key pair, the private and public keys.

The problem, however, has been that asymmetric cryptography is extremely slow compared with its symmetric counterpart. Asymmetric cryptography is impractical for everyday use in encrypting large amounts of data or for frequent transactions where speed is required. This is because asymmetric key cryptography is handling much larger keys and is mathematically intensive, thereby reducing the speed significantly.







- **RSA (Rivest-Shamir-Adleman)**
  - Key sizes: Typically 2048 or 4096 bits
  - Notes: One of the most widely used asymmetric algorithms. Primarily used for secure data transmission and digital signatures.

- **Elliptic Curve Cryptography (ECC)**
  - Key sizes: 256, 384, or 521 bits (smaller key sizes than RSA for similar security)
  - Notes: Provides strong security with shorter key lengths compared to RSA. Commonly used in mobile devices and modern secure systems.

- **DSA (Digital Signature Algorithm)**
  - Key sizes: 1024 to 3072 bits
  - Notes: Used primarily for digital signatures; part of the Digital Signature Standard (DSS).

- **Diffie-Hellman (DH)**
  - Key sizes: 2048 bits or higher
  - Notes: Used to securely exchange cryptographic keys over a public channel. Not used directly for encryption, but as part of protocols like TLS.

- **ElGamal**
  - Key sizes: Variable (typically 1024 bits or more)
  - Notes: Based on the Diffie-Hellman key exchange. Commonly used in digital signatures and encryption, often seen in GPG.

- **ECDSA (Elliptic Curve Digital Signature Algorithm)**
  - Key sizes: 256, 384, or 521 bits
  - Notes: The elliptic curve variant of DSA, offering equivalent security with smaller key sizes.

- **ECDH (Elliptic Curve Diffie-Hellman)**
  - Key sizes: 256, 384, or 521 bits
  - Notes: Elliptic curve-based version of Diffie-Hellman; used for secure key exchanges with stronger security for smaller keys.

- **EdDSA (Edwards-curve Digital Signature Algorithm)**
  - Key sizes: 256 or 448 bits
  - Notes: A modern elliptic curve algorithm designed to be fast and secure, used in digital signatures (e.g., Ed25519).

- **Paillier Cryptosystem**
  - Key sizes: 1024 bits or higher
  - Notes: A probabilistic encryption algorithm that allows homomorphic encryption, enabling computation on encrypted data.

- **NTRUEncrypt**
  - Key sizes: 128 to 3000 bits
  - Notes: Based on lattice-based cryptography, providing resistance against quantum attacks. It's faster than RSA and ECC.

- **PGP (Pretty Good Privacy)**
  - Key sizes: Variable (RSA or ECC keys are often used)
  - Notes: A hybrid encryption system combining symmetric encryption with asymmetric key exchange for email and file encryption.










































## Hash Function
A hash function is a one-way function that takes any amount of data and returns a fixed size value. 

The values returned by a hash function are called:

hashes
digest
hash values
fingerprint
hash codes
hash digests



A majority of commonly used hash algorithms such as MD5 and SHA1 are cryptographic hash functions.
These hash algorithms are one-way functions, meaning that it's trivial to generate a hash, but a proper algorithm's implementation makes it prohibitively difficult to get the plaintext from the hash.








































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


