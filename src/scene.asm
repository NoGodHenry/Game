global scene_init
global scene_list
global scene_list_size
global scene_list_append
extern malloc
extern realloc
extern printf

section .data
scene_list dq 0
scene_list_size dw 0

section .text
scene_init:
    enter 16, 0
    mov rdi, 6*8
    call malloc
    mov qword[scene_list], rax
    leave
    ret
    
scene_list_append:
    mov eax, dword[scene_list_size]
    mov rsi, qword[scene_list]
    mov qword[rsi + rax*8], rdi
    inc dword[scene_list_size]
    ret