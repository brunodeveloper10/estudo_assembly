;o processo de compilacao sera da seguinte forma: 1- processo de montagem com o nasm 2- processo de linkagem com o gnu ld

section .data ;sera usado pelo programa de ligacao (ld) na hora de criar o arquivo binario
		;essas secoes sao reconhecidas sao blocos reconhecidos pelo sistema
		;esses nomes de seccao sao padrao para o programa de ligacao e de montagem - voce ate pode muda-los mas voce tera que
		;que configurar no processo de montagem
		
;secoes sao uma forma de oganizar os dados escritos no arquivo binario <durante a ligacao>
;as secoes padrao sao aquelas que terao seus atributos configurados pelo assemblador
;a montagem gera um arquivo chamado de objeto
;a montagem é gerado usando um arquivo binario em varios formatos, mas no nosso aprendizado vamos utilizar o ELF64


section .text ;sera usado pelo programa de ligacao (ld) na hora de criar o arquivo binario

;seccoes e segmentos sao blocos de dados,
;seccoes se faz uso para o programa de ligacao 
;segmentos e o bloco que o sistema operacional vai procura; o sistema procura essas secoes para jogar em memoria


;processos são estruturas de dados; ??

IPC (cOMUNIACAO ENTRE PROCESSOS)

Abaixo existem 2 visoes, o primeiro eh o do linker no processo de ligacao do objeto e o segundo e a visao do sistema operacional que le o arquivo binario e joga na memoria

Visão do linker                             Visão do sistema
                +-------------------------+ <---+ 
                |      Cabeçalho ELF      |     |
                +-------------------------+     |
     (opcional) |  Cabeçalho do Programa  | Descreve segmentos
          +---→ +-------------------------+     |
          |     |           ...           |     |
          |     +-------------------------+     +--- Segmento de código
          |     |          .text          |     |
          |     +-------------------------+     |
          |     |         .rodata         |     |
          |     +-------------------------+     |
        Seções  |           ...           | ←---+
          |     +-------------------------+     |
          |     |          .data          |     |
          |     +-------------------------+     +--- Segmento de dados
          |     |          .bss           |     |
          |     +-------------------------+ ←---+
          |     |           ...           | Outros segmentos
          +---→ +-------------------------+
Descreve seções |   Cabeçalho de Seções   | (opcional)
                +-------------------------+


os dados estruturados estarao na memoria basicamente no seguinte formato:

Hi +------------+
   |    Stack   |
   +------------+
   |      ↓     |
   |            |
   |      ↑     |
   +------------+
   |            |
   |    Heap    |
   |            |
   +------------+ ←-+
   |   .bss     |   |
   +------------+   |
   |   .data    |   +-- Vem do binário
   +------------+   |
   |   .text    |   |
Lo +------------+ ←-+

glossario:
HI: sao os enderecoes de memoria mais alto
LO: sao os enderecos de memoria mais baixo
Stack: cresce dos enderecos mais altos na direcao dos enderecos mais baixos; stack e
	   a pilha de execucao

Heap: trabalha com segmento de memoria; cresce dos enderecos mais baixos para os mais altos
bss: os dados nao iniciados (<block start symbol> - bloco de inicializacao de símbolos)
.data: os dados iniciados
.text: o codigo em si, nessa secao e incorporado o .rodata


--------------------------------------------------------------------------------------------
Um pouco sobre tipos de dados

No assembly não existe o conceito de tipos de dados, mas sim um conceito análogo que é o espaço na memória reservado para para cada tipo de dados, então podemos trabalhar com 
registradores diferentes de acordo com o tipo de dados que queremos utilizar

Segue alguns tipode de dados:
WORD (uma palavra): tem 2 bytes ou 16 bitis, isso é o suficiente para representar qualquer letra
DOUBLE WORD (numérico): tem 4 bytes, que seria 32 bits

esses são espaçoes padrões, mas eu posso reservar na memória outros tamanhos

As constantes são transformadas na compilacao (são pré-processadas na compilação) - quando dizemos constantes aqui não estamos nos referindo as representação literal dos dados. No nosso 
caso é um identificador que na hora da compilação será substituída por um dado