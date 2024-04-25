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
    call object_new
    mov rdi, rax
    call scene_list_append
    
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