

print_string:
        pusha                   ; Push all register values to the stack
      
        add bx, 0x7c00          ; offset setup

loop:   
        mov ax, [bx]            ; contents to ax
        cmp al, 0               ; end of string?
        je ret_block

        mov ah, 0x0e            ; print setup
        int 0x10                ; print

        add bx, 0x1             ; string index ++
        jmp loop                ; reiterate

ret_block:      
        popa                    ; Restore original register values
        ret
