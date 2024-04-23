global render_object
extern fbo_write
extern printf

section .data
debug db "daad: %d", 10, 0

section .text
render_object: 
    enter 32, 0
    mov qword[rbp-8], rdi ; Object
    mov qword[rbp-16], rsi ; FBO

    mov rdi, qword[rbp-16]
    mov rsi, qword[rbp-8]
    mov esi, 5
    mov edx, 2
    call fbo_write

    leave
    ret