# POSIX


Classes:
[:alnum:]
[:alpha:]




There is no specific character encoding mandated by POSIX. The only character in a fixed position is null, which must be 00.

What POSIX does require is that all characters from its Portable Character Set exist. The Portable Character Set contains the printable ASCII characters, space, BEL, backspace, tab, carriage return, newline, vertical tab, form feed, and null. Where or how those are encoded is not specified, except that:

They are all a single byte (8 bits).
Null is represented with all bits zero.
The digits 0-9 appear contiguously in that order.
It imposes no other restrictions on the representation of characters, so a conforming system is free to support encodings with any representation of those characters, and any other characters in addition.

Different locales on the same system can have different representations of those characters, with the exception of . and /, and

if an application uses any pair of locales where the character encodings differ, or accesses data from an application using a locale which has different encodings from the locales used by the application, the results are unspecified.

The only files that all POSIX-compliant systems are required to treat in the same way are files consisting entirely of null bytes. Files treated as text have their lines terminated by the encoding's representation of the PCS's newline character.

- <https://unix.stackexchange.com/questions/289250/which-character-encodings-are-supported-by-posix>
- <https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap06.html#tag_06_01>