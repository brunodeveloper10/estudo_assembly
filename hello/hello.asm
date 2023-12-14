section .data 
 
msg: db "Hello World", 10

len: equ $ - msg ;len eh uma constante pre-processada

		
section .text
	
	global _start	;torna o rotulo '_start' visivel para qualquer parte do programa 


_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall

_end:
	mov	rax, 60
	mov	rdi, 0
	syscall

