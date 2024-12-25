%include "kernel\src\idt.asm"
KernelEntry:
    ;====================================
    ; BUG
    mov rax, 3
    mov rbx, 0
    div rbx
    ;====================================
halt:
    hlt