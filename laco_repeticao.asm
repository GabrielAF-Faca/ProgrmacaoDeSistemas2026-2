
section .bss
    valor resb 1

section .text
    global _start

_start:
    mov esi, 0

inicio_loop:
    cmp esi, 5
    jge fim_loop

    ; ===========

    ; PRINTANDO O VALOR DO CONTADOR
    mov edi, esi
    add edi, '0'
    mov [valor], edi

    mov eax, 4
    mov ebx, 1
    mov ecx, valor
    mov edx, 1

    int 0x80

    ; =============

    inc esi

    jmp inicio_loop


fim_loop:
    mov eax, 1
    mov ebx, 0
    int 0x80
