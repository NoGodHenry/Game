global camera_init
global camera_x
global camera_y
global camera_z
global camera_yaw
global camera_pitch
global camera_f

section .data
camera_x dd 0.0
camera_y dd 0.0
camera_z dd 0.0
camera_yaw dd 0.0
camera_pitch dd 0.0
camera_f dd 2.0

section .text
camera_init:
    mov dword[camera_x], __float32__(25.0) 
    ;mov dword[camera_y], __float32__(25.0) 
    ret