section .data
	msg db 'O resultado da soma é: '
	len equ $-msg
	quebra db 0xa

section .bss
	resultado resb 1

section .text
	global _main

_main:
	; SOMAR OS NUMEROS
	mov eax, 5
	mov ebx, 3
	add eax, ebx

	; CONVERTER TUDO EM CARACTER
	add eax, '0'
	mov [resultado], eax

	; MOSTRA PRIMEIRA MENSAGEM
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len

	int 80h

	; MOSTRAR O RESULTADO
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1

	int 0x80

	; MOSTRAR A QUEBRA DE LINHA
	mov eax, 4
	mov ebx, 1
	mov ecx, quebra
	mov edx, 1

	int 80h

	; ENCERRA O PROGRAMA
	mov eax, 1
	mov ebx, 0
	
	int 80h
