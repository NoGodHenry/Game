global render_frame
global renderer_clear_frame
extern printf
extern render_object
extern scene_list
extern scene_list_size
extern write

section .data
clear_text db 1bh, "[2J", 0

section .text
renderer_clear_frame:
    enter 16, 0
    mov rdi, 0
    mov rsi, clear_text 
    mov edx, 4
    call write
    leave
    ret
render_frame:
    enter 32, 0
    mov qword[rbp-20], rdi
    mov dword[rbp-4], 0
render_frame_loop:
    mov eax, dword[scene_list_size]
    cmp dword[rbp-4], eax
    jge render_exit
    
    ; Load the current object
    mov edi, dword[rbp-4]
    mov rax, qword[scene_list]
    mov rax, qword[rax + rdi*8]
    mov qword[rbp-12], rax 
    
    mov rdi, qword[rbp-12]
    mov rsi, qword[rbp-20]
    call render_object
    ; Increse object index
    inc dword[rbp-4]
    jmp render_frame_loop
render_exit:
    leave
    ret
