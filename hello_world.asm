
section .data
	mensagem db 'Olá, turma!!!', 0xa ; Declarando a constante mensagem com 8 bits (db) e com quebra de linha no final (0xa ou 10)
	tamanhoMensagem equ $-mensagem ; Calcula o tamanho da minha string mensagem e coloca esse valor na variavel

section .text
	global _main ; Define _main como o começo do nosso programa

_main:
	; PREPARAR PARA ESCREVER NA TELA (sys_write)

	mov eax, 4 					; Move para o registrador eax o comando de escrever (sys_write = 4)
	mov ebx, 1 					; Move para o registrador ebx o código de saída padrão do sistema (output/tela = 1)
	mov ecx, mensagem 			; Move para o registrador ecx a nossa constante mensagem
	mov edx, tamanhoMensagem 	; Move para o registrador edx o tamanho da nossa mensagem pra poder colocar no arquivo de saída padrão

	int 0x80					; Chamar o Kernel para executar os comandos que colocamos nos registradores

	; PARAR O PROGRAMA DE UM JEITO SEGURO (sys_exit)

	mov eax, 1 		; Código/comando de saída do programa (sys_exit = 1)
	mov ebx, 0		; Código de programa executado sem erros

	int 80h 		; Chama o Kernel para executar os comandos acima