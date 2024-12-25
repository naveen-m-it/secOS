process_command:
.end:
    mov al, 20
    out 0x20, al
    out 0xa0, al
    sti
    iretq
compare_command:
    .loop:
        cmp rsi, rdi
        jne .not_equal
        jz .equal
        inc rsi
        inc rdi
        jmp .loop
    .not_equal:
        ret
    .equal:
        ret
clear_command_buffer:
    mov rdi, COMMAND_BUFFER
    mov rcx, 128
    mov al, 0
    rep stosb
    mov byte [COMMAND_BUFFER_LEN], 0
    ret

handle_unknown_command:
.end:
    mov al, 20
    out 0x20, al
    out 0xa0, al
    sti
    iretq

handle_clear_cmd:
    call clear_screen
    call clear_command_buffer
.end:
    mov al, 20
    out 0x20, al
    out 0xa0, al
    sti
    iretq

clear_cmd: db "clear", 0
help_cmd: db "help", 0
unknown_command: db "Unknown command", 0