global object_new
extern malloc
section .text

; Object
; f32 posX
; f32 posY
; f32 posZ
; f32 rotX
; f32 rotY
; f32 rotZ

object_new:
    enter 16, 0
    mov edi, 4*6
    call malloc
    mov qword[rbp-8], rax
    mov rax, qword[rbp-8]
    leave
    ret