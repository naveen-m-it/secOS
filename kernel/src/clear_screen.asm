clear_screen:
    mov rdi, 0xb8000            ; Load VGA buffer address
    mov rcx, 80 * 25            ; Total characters to clear
    mov ax, 0x0720              ; Space character with white-on-black
    rep stosw                   ; Repeat `stosw` RCX times
    mov qword [cursor_position], 0
    call set_cursor
    ret