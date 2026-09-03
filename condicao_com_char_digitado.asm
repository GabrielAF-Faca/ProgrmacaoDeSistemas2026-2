section .data
    msg db "Digite algo: "
    len_msg equ $-msg
    
    mensagem_condicao db "Voce digitou '#'"
    len_msg2 equ $-mensagem_condicao
    
section .bss
    char    resb 2

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    
    int 0x80
    
    mov eax, 3 ; system read
    mov ebx, 0 ; entrada padrão (terminal)
    mov ecx, char
    mov edx, 2
    
    int 0x80
    
    mov al, byte [char] ; Pega o primeiro caracter que foi digitado
    
    cmp al, '#'
    je condicao

condicao:
    mov eax, 4
    mov ebx, 1
    mov ecx, mensagem_condicao
    mov edx, len_msg2
    
    int 0x80
    

fim_programa:

    mov eax, 1
    mov ebx, 0x80
    int 80h
    
