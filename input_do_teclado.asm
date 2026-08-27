section .data
	msg_inicial db "digite algo: ",10
	len_msg equ $-msg_inicial

	msg_saida db "voce digitou: "
	len_saida equ $-msg_saida

section .bss
 	teclado resb 64

section .text
	global _main

_main:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_inicial
	mov edx, len_msg

	int 80h

	mov eax, 3 ;system_read
	mov ebx, 0 ;stdin
	mov ecx, teclado 
	mov edx, 64 ;tam (bytes) max que pode ter

	int 80h

	mov esi, eax

	mov eax, 4
	mov ebx, 2
	mov ecx, msg_saida 
	mov edx, len_saida

	int 80h

	mov eax, 4
	mov ebx, 2
	mov ecx, teclado 
	mov edx, esi 

	int 80h

	mov eax, 1
	mov ebx, 0

	int 80h
