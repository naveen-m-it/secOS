default_handler:
.end:
    mov al, 20
    out 0x20, al
    sti
    iretq