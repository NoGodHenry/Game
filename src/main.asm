global main
extern scene_init
extern scene_list
extern render_frame
extern scene_list_append
extern object_new

section .text
main:
    enter 16, 0
    call scene_init
    
    ; allocate new object
    call object_new
    mov rdi, rax
    call scene_list_append
    
    ; render frame
    call render_frame
    leave
    ret