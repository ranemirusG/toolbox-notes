# EncFS

- <https://github.com/vgough/encfs>


Example:
```
mdesiner@ext-sv:/home/ckent/.backup$ ls -larth
total 32K
-rwxr-xr-x 1 ckent ckent 1.3K Aug 26 2022 .encfs6.xml
-rwxr-xr-x 1 ckent ckent 176 Aug 26 2022 AgjdZTts1KVE0AKwVpjBtmNq
-rwxr-xr-x 1 ckent ckent 3.8K Aug 26 2022 RXgF9klvwMpODafSjhAIoztW
-rwxr-xr-x 1 ckent ckent 1.2K Aug 26 2022 RLglYDPZ7nC3Z7mot2sRcVDb
-rwxr-xr-x 1 ckent ckent 236 Aug 26 2022 Hag5,3UJl3pfGqr40AesFsOK
-rwxr-xr-x 1 ckent ckent 823 Aug 26 2022 DUotHM7CpraleBP8ao1Scj,B
```

```
encfs2john .backup > hash.txt

encfs --forcedecode .backup/ decoded/
``	`