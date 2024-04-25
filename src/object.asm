global object_new
global object_update
extern malloc
section .data
incss1:
    dd 1.0
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
    mov dword[rax], __float32__(5.2)
    mov dword[rax + 4], __float32__(2.0)
    mov dword[rax + 8], __float32__(2.0)
    mov rax, qword[rbp-8]
    leave
    ret

object_update:
    enter 16, 0
    mov qword[rbp-8], rdi
    ;movss xmm0, dword[rdi + 0]
    ;movss xmm1, dword[incss1]
    ;addss xmm0, xmm1
    ;movss dword[rdi + 0], xmm0
    leave
    ret