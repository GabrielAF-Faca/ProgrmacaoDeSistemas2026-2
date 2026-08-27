section .data
	mensagem_igual db "Eh igual",10
	msg_igual_len equ $-mensagem_igual

	mensagem_difer db "Eh diferente",10
	msg_dif_len equ $-mensagem_difer

section .text
	global _start

_start:
	mov esi, 4

	cmp esi, 4
	je eh_igual

	mov eax, 4 ; system_write (print)
	mov ebx, 1 ; onde eu vou escrever (1 = saída padrão = terminal)	
	mov ecx, mensagem_difer
	mov edx, msg_dif_len

	int 80h

	jmp fim_programa

eh_igual:
	mov eax, 4 ; system_write (print)
	mov ebx, 1 ; onde eu vou escrever (1 = saída padrão = terminal)	
	mov ecx, mensagem_igual
	mov edx, msg_igual_len

	int 80h

fim_programa:
	mov eax, 1
	mov ebx, 0

	int 80h

