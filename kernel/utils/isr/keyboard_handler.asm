keyboard_handler:
    in al, 0x64
    test al, 0x01
    jz .end

    xor rax, rax
    in al, 0x60

    cmp al, 0x80
    ja .end

    cmp al, 0x1c
    je process_command

    mov r8, 0xff
    and r8, rax
    
    mov rdi, [VGA_ADDR]
    mov al, byte [ASCII_TABLE + r8]
    mov ah, 0x0f
    mov [rdi], ax
    add rdi, 2
    mov [VGA_ADDR], rdi

    mov rcx, COMMAND_BUFFER_LEN
    mov [COMMAND_BUFFER + rcx], al
    inc rcx
    mov [COMMAND_BUFFER_LEN], rcx

.end:
    mov al, 0x20
    mov 0x20, al
    sti
    iretq