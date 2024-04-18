global render_object
extern fbo_write

section .text
render_object: 
    enter 32, 0
    mov qword[rbp-8], rdi ; Object
    mov qword[rbp-16], rsi ; FBO
    
    mov rdi, qword[rbp-16]
    mov rsi, 1
    mov rdx, 2
    call fbo_write

    leave
    ret