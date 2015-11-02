        ;;
        ;; A boot sector program that prints out an address to the screen
        ;; as a string
        ;;

        mov dx, 0x1fb6          ; store value to print in dx
        call print_hex          ; call the function

        ;; prints value of DX as hex
print_hex:
        ;; TODO
        pusha                   ; Push all register values to the stack
        mov ax, HEX_OUT
        
        add ax, 0x10            ; AX := address of string to-be-altered
        mov cx, [ax]            ; CX := contents of string

        mov bx, 0xf000
        and bx, dx              ; BX := 4 most significant bits of DX
        
        
        mov bx, HEX_OUT         ; get var address        
        call print_string       ; by BX

        popa
        ret



        ;; global var
HEX_OUT:
        db '0x0000', 0
        
