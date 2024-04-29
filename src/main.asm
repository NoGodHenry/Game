global main
extern scene_init
extern camera_init
extern scene_list
extern render_frame
extern fbo_clear
extern scene_list_append
extern object_new
extern fbo_new
extern fbo_render_screen
extern renderer_clear_frame
extern usleep

%macro add_object 3
    call object_new
    mov dword[rax], __float32__(%1)
    mov dword[rax + 4], __float32__(%2)
    mov dword[rax + 8], __float32__(%3)
    mov rdi, rax
    call scene_list_append
%endmacro

section .text
main:
    enter 16, 0
    call scene_init
    call camera_init
    
    ; TODO: Change resolution
    mov edi, 40 
    mov esi, 40
    call fbo_new
    mov qword[rbp-8], rax
    
    ; allocate new object
    add_object 5.0, 5.0, 5.0
    add_object 50.0, 5.0, 5.0
    
    ; render frame
test:
    call renderer_clear_frame
    mov rdi, qword[rbp-8]
    call fbo_clear        
    mov rdi, qword[rbp-8]
    call render_frame
    mov rdi, qword[rbp-8]
    call fbo_render_screen
    mov edi, 100000
    call usleep
    jmp test
    leave
    ret