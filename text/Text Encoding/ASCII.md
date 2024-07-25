# ASCII Hex
It was the first character encoding standard for the web. It defined 128 different characters that could be used on the internet:

- English letters (A-Z)
- Numbers (0-9)
- Special characters like ! $ + - ( ) @ < > .


This option transitions data between ASCII and hexadecimal representations. For instance, the word "ASCII" can be converted into the hexadecimal number "4153434949". Each character is converted from its numeric ASCII representation into hexadecimal.









From "Pequeno Manual do Programador GNU/Bash" (Blau Araujo, 2020):

    Quando trabalhamos com faixas de caracteres, especialmente com strings que
    contenham caracteres não utilizados na língua inglesa, é muito importante ter
    em mente que a tabela ASCII não contém caracteres acentuados nem cedilha.
    Por exemplo:
    ```
    :~$ var=maçã
    :~$ [[ $var == ma[a-z][a-z] ]]; echo $?
    1
    ```
    Não houve casamento com o padrão porque ç e ã não existem na tabela
    ASCII.

<https://asciiflow.com>
