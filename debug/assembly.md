# Assembly


- <https://schweigi.github.io/assembler-simulator/>




OPCODE: It is a number interpreted by your machine(virtual or silicon) that represents the 
operation to perform

BYTECODE: Same as machine code, except, its mostly used by a software based interpreter(like 
Java or CLR)

MNEMONIC: English word MNEMONIC means "A device such as a pattern of letters, ideas, or 
associations that assists in remembering something.". So, its usually used by assembly 
language programmers to remember the "OPERATIONS" a machine can do, like "ADD" and "MUL" and 
"MOV" etc. This is assembler specific.

MACHINE CODE: It is the sequence of numbers that flip the switches in the computer on and 
off to perform a certain job of work - such as addition of numbers, branching, 
multiplication, etc etc. This is purely machine specific and well documented by the 
implementers of the processor.

Assembly: There are two "assemblies" - one assembly program is a sequence of mnemonics and 
operands that are fed to an "assembler" which "assembles" the mnemonics and operands into 
executable machine code. Optionally a "linker" links the assemblies and produces an 
executable file.

the second "assembly" in "CLR" based languages(.NET languages) is a sequence of CLR code 
infused with metadata information, sort of a library of executable code, but not directly 
executable.









## Registers: porcion de memoria del procesador para intercambiar datos
- <https://wiki.skullsecurity.org/index.php?title=Registers>
- <https://stackoverflow.com/questions/27429026/understanding-how-eip-rip-register-works>

EAX ----> "Acumulator" guarda los resultados de las funciones
	return values are handled here
ECX ----> contador
EBX y EDX ----> uso general

EBP y ESP ----> "Base Pointer" y "Stack Pointer" base and top of the stack
ESI y EDI ----> se usan para copiar bloques de memoria "source" y "destination"

EIP ----> "Instruction Pointer" Contiene la dirección actual de ejecución del programa
	tells the computer where to go next to execute the next command
	controls the flow of a program
	
EFLAGS ----> flags
	ZF ----> resultado de una operacion en 0
	OF ----> overflow
	CF ----> "Carrie" cuando el resultado es mayor al tamano del registro
	SF ----> "sign" cuando el resultado es negativo
	

Instructions:
- <https://www.felixcloutier.com/x86/jcc>



## segment especifiers
ss ----> stack segment
ds ----> data segment









