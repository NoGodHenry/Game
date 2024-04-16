global render_frame
extern printf
extern render_object
extern scene_list
extern scene_list_size

section .data
debug db "Rendering object", 10, 0
section .text
render_frame:
    enter 16, 0
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

    mov rdi, debug
    call printf

    mov rdi, qword[rbp-12]
    call render_object
    ; Increse object index
    inc dword[rbp-4]
    jmp render_frame_loop
render_exit:
    leave
    ret
