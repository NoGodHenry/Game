global fbo_new
extern malloc
extern printf

section .data
debug db "fbo_new: %d", 10, 0
section .text
fbo_new:
    enter 16, 0
    mov dword[rbp-4], edi ; width
    mov dword[rbp-8], esi ; height
    xor edi, edi
    mov eax, dword[rbp-4]
    imul dword[rbp-8]
    add eax, 8
    mov edi, eax
    call malloc

    mov rdi, debug
    mov esi, eax
    call printf
    leave
    ret