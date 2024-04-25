global projection_transform
extern camera_f

section .text
; return value: xmm0 - x, xmm1 - y
projection_transform:
    mulss xmm0, dword[camera_f] 
    divss xmm0, xmm2 
    mulss xmm1, dword[camera_f] 
    divss xmm1, xmm2 
    ret