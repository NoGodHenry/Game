global render_object
extern fbo_write
extern printf
extern object_update

section .data
debug db "daad: %d", 10, 0

section .text
render_object: 
    enter 32, 0
    mov qword[rbp-8], rdi ; Object
    mov qword[rbp-16], rsi ; FBO

    mov rdi, qword[rbp-16]
    mov rsi, qword[rbp-8]
    movss xmm0, dword[rsi]
    cvtss2si edx, xmm0
    movss xmm0, dword[rsi + 4]
    cvtss2si esi, xmm0
    call fbo_write

    mov rdi, qword[rbp-8]
    call object_update

    leave
    ret