global projection_transform
extern camera_x
extern camera_y
extern camera_f

section .text
; return value: xmm0 - x, xmm1 - y
projection_transform:
    subss xmm0, dword[camera_x]
    mulss xmm0, dword[camera_f] 
    divss xmm0, xmm2 
    subss xmm1, dword[camera_y]
    mulss xmm1, dword[camera_f] 
    divss xmm1, xmm2 
    ret