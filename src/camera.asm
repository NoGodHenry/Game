global camera_x
global camera_y
global camera_z
global camera_yaw
global camera_pitch

section .data
camera_x dd 0.0
camera_y dd 0.0
camera_z dd 0.0
camera_yaw dd 0.0
camera_pitch dd 0.0

float_1 dd 1.0

section .text
camera_new:
    enter 16, 0
    mov dword[camera_y], float_1 
    leave
    ret