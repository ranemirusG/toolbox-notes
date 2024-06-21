# Signatures

Message Digest - A digital signature that uniquely identifies data and has the property such that changing a single bit in the data will cause a completely different message digest to be generated.


How to verify the checksum of a downloaded file (pgp, sha, etc.)?
https://security.stackexchange.com/questions/189000/how-to-verify-the-checksum-of-a-downloaded-file-pgp-sha-etc



# Windows

`CertUtil -hashfile [FILENAME] MD5`
`CertUtil -hashfile [FILENAME] SHA256`

- <https://wiki.gnupg.org/Gpg4win/CheckIntegrity>



# Linux
md5sum filename / sha256sum filename
openssl sha3-256 filename



# MacOS
md5 filename / shasum -a 256 filename



