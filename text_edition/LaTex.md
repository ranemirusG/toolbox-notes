# LaTex

## Resources
https://www.youtube.com/watch?v=C3vILM2cNuo
https://www.dianacai.com/blog/2018/06/28/latex-vim-skim-setup/












## Workflow


http://hints.macworld.com/article.php?story=20040314102550515

Go ahead and write that book in LaTeX or Markdown using Vim. Use the command-line version of Git to manage your versions. Compile it into a PDF with Pandoc or PdfTeX. But then use some graphic app such as Adobe Acrobat or Mac Preview or Evince to view the resulting PDF. This is using the right tool for the right job (from 'Going Text')














# Notes LaTex

## Resources:
	- <https://castel.dev/>



# TeX

El nombre del programa hace nfasis en su propsito fundamental: la generacin de textos tcnicos de calidad artstica.

Los tres servidores centrales de CTAN, dotados de poderosos motores de bu squeda, son:
En EE.UU: http://www.ctan.org/
En Inglaterra: http://www.tex.ac.uk/tex-archive/
En Alemania: http://www.dante.de/cgi-bin/ctan-index/

Para los usuarios de habla hispana puede ser de inters la pgina Web de CervanTEX, el Grupo de Usuarios de TEX Hispanohablantes, localizada en http://www.cervantex.org/.


While TeX is a programming language in the sense that it is Turing complete,
its main job is to serve as a markup language for describing how your document should look

TeX is both a typographical and a logical markup language, and one has to take account of both issues when writing a TeX document. On the other hand, Lamport's aim when creating LaTeX was to split those two aspects. A typesetter can make a template and then the writers can just focus on LaTeX logical markup. They might not know anything about typesetting.


LaTeX
document preparation system
macros

LaTeX is a high-quality typesetting system (compilar procesar componer)

LaTeX and Markdown are simply "languages" to DESCRIBEthe text, pretty much as HTML.

dvi significa precisamente device independent. 
independiente del dispositivo de salida pero requiere de un driver o manejador para la impresora y de un previewer o visualizador para el monitor, ambos usualmente incluidos en las implementaciones de TEX y LATEX.


##################################
from Pandoc installing:
By default, Pandoc creates PDFs using LaTeX. Because a full MacTeX installation uses four gigabytes of disk space, we recommend BasicTeX or TinyTeX and using the tlmgr tool to install additional packages as needed. If you receive errors warning of fonts not found:

tlmgr install collection-fontsrecommended


# BIBLIOGRAFIA
\bibliographystyle(apalike)
\bibliography($HOME/Dcouments/LaTex/uni.bib)

ejemplo Luke Smith:
@book(baker88,
	author = "Mark Baker",
	title = "etc...
	year = 1988
	)


# DIRECTORY STRUCTURE
packages:
/usr/local/texlive/2021/texmf-dist/tex/latex

Con el proposito de evitar el caos y crear cierta uniformidad para todas las plataformas computacionales, la asociacion TUG (TEX Users Group) propuso en 1994 una estructura de directorios, conocida como TDS o TEX Directory Structure. Segun el esquema TDS, el directorio principal de toda implementacio n de TEX y LATEX de- be ser /texmf/, abreviacion de TEX y METAFONT, los programas basicos disenados por Donald Knuth.

En mi distribuiond encontré:
/usr/local/texlive/2021/texmf-dist/doc/latex
/usr/local/texlive/2021/texmf-dist/source/latex
/usr/local/texlive/2021/texmf-dist/tex/latex

# PACKAGES

amsmath

This package allows for more complicated mathematical structures within a document such as matrices.

geometry

This package is for the more advanced user.  It allows the user to better control the formatting of the document.

graphicx

This package allows graphics to be integrated into a document.

hyperref

This package allows for hyperlinks inside a document.  Use the command \hypersetup{} to control different link colors.

booktabs

A useful package if you are having trouble with spacing inside of tables.





