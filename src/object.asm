global object_new
global object_update
extern malloc
extern camera_x
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
    mov dword[rax], __float32__(0.0)
    mov dword[rax + 4], __float32__(0.0)
    mov dword[rax + 8], __float32__(0.0)
    mov rax, qword[rbp-8]
    leave
    ret

object_update:
    enter 16, 0
    mov qword[rbp-8], rdi
    movss xmm0, dword[rdi + 8]
    movss xmm1, dword[incss1]
    addss xmm0, xmm1
    movss dword[rdi + 8], xmm0
    
    ; Change xmm registers
    movss xmm1, dword[camera_x] 
    movss xmm2, dword[incss1]
    addss xmm1, xmm2
    addss xmm1, xmm2
    addss xmm1, xmm2
    addss xmm1, xmm2
    addss xmm1, xmm2
    addss xmm1, xmm2
    addss xmm1, xmm2
    movss dword[camera_x], xmm1
    leave
    ret