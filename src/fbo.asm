global fbo_new
global fbo_write
global fbo_render_screen 
global fbo_clear
extern malloc
extern write
extern printf
extern memset

section .data
debug db "fbo_new:", 10, 0
newline db 10
section .text
fbo_new:
    enter 32, 0
    mov dword[rbp-4], edi ; width
    mov dword[rbp-8], esi ; height
    xor edi, edi
    mov eax, dword[rbp-4]
    imul dword[rbp-8]
    add eax, 8
    mov edi, eax
    call malloc
    mov qword[rbp-16], rax

    ; Set x,y fields 
    mov rax, qword[rbp-16]
    mov edi, dword[rbp-4]
    mov dword[rax], edi 
    mov edi, dword[rbp-8]
    mov dword[rax + 4], edi 
    mov rax, qword[rbp-16]
    leave
    ret

; fbo - rdi
; x - rsi
; y - rdx
fbo_write:
    mov ecx, dword[rdi + 4]
    mov rax, rsi 
    imul rdx
    add rax, rdi
    add rax, 8
    add rax, rsi

    mov qword[rax], 65
    ret

; fbo - rdi
fbo_render_screen:
    enter 16, 0
    mov qword[rbp-8], rdi
    mov dword[rbp-12], 0
fbo_render_row:
    mov rcx, qword[rbp-8]
    mov rdi, 0
    mov eax, dword[rbp-12]
    imul dword[rcx + 4]
    add eax, 8
    lea rsi, [rcx + rax]
    mov edx, dword[rcx + 4]
    call write

    mov rdi, 0
    mov rsi, newline
    mov edx, 1 
    call write 

    inc dword[rbp-12]
    mov rcx, qword[rbp-8]
    mov ecx, dword[rcx + 4] 
    cmp dword[rbp-12], ecx 
    jle fbo_render_row
    leave
    ret

fbo_clear:
    add rdi, 8
    mov eax, dword[rdi - 8]
    imul dword[rdi - 4]
fbo_clear_start:  
    lea rdx, [rdi + rax]
    mov byte[rdx], 66 
    dec eax
    cmp eax, 0
    jge fbo_clear_start
    ret
