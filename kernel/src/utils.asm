ASCII_TABLE: db 0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9' , '0', \
                '-', '=', 0, 0, 'q', 'w', 'e', 'r', 't', 'y','u', 'i', 'o', \
                'p', '[', ']', 0, 0, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', \
                'l', ';', "'", '`', 0, '\', 'z' , 'x', 'c', 'v', 'b', 'n', 'm', \
                ',', '.', '/', 0, 0, ' ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
VGA_ADDR: dq 0xb8000
COMMAND_BUFFER: times 128 db 0
COMMAND_BUFFER_LEN: db 0
clear_screen:
    mov rdi, 0xb8000            ; Load VGA buffer address
    mov rcx, 80 * 25            ; Total characters to clear
    mov ax, 0x0020              ; Space character with white-on-black
    rep stosw                   ; Repeat `stosw` RCX times
    mov qword [VGA_ADDR], 0xb8000
    ret