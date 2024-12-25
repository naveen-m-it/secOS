cursor_position: dq 0    
set_cursor:
    mov dx, 0x3D4               ; VGA Command Port
    mov al, 0x0F                ; Select Low Byte of Cursor Position
    mov rbx, [cursor_position]                 ; Load cursor position into RBX
    out dx, al                  ; Send command
    inc dx                      ; Switch to Data Port
    mov al, bl                  ; Load low byte of position
    out dx, al                  ; Write low byte to port

    dec dx                      ; Back to Command Port
    mov al, 0x0E                ; Select High Byte of Cursor Position
    out dx, al                  ; Send command
    inc dx                      ; Switch to Data Port
    mov al, bh                  ; Load high byte of position
    out dx, al                  ; Write high byte to port
    ret
