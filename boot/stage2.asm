[org 0x8000]
start:
    cli
    mov eax, cr0
    or eax, 0x01
    mov cr0, eax
    lgdt [gdt32.descriptor]
    jmp gdt32.code:ProtectedModeEntry
[bits 32]
%include "boot/src/gdt32.asm"
%include "boot/src/seg_reg32.asm"
%include "boot/src/gdt.asm"
%include "boot/src/paging.asm"
ProtectedModeEntry:
    call set_seg_regs32
    call setup_paging
    lgdt [gdt.descriptor]
    jmp gdt.code:LongModeEntry
[bits 64]
%include "boot/src/set_seg.asm"
%include "kernel/kernel.asm"
%include "kernel/src/clear_screen.asm"
%include "kernel\src\set_cursor.asm"
LongModeEntry:
    call set_seg_regs
    mov rsp, 0x80000
    call clear_screen
    jmp KernelEntry