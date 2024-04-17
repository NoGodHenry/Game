global render_object
section .text
render_object: 
    enter 16, 0
    mov qword[rbp-8], rdi ; Object
    
    
    leave
    ret