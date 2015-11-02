        ;;
        ;; Exercise 3 on conditional jumps
        ;;

        mov bx, 41              ; set BX

        cmp bx, 4
        jle less_or_equal
        cmp bx, 40
        jl less_than

        jmp default_label
        
less_or_equal:
        mov al, 'A'
        jmp end_label

less_than:
        mov al, 'B'
        jmp end_label

default_label:
        mov al, 'C'

end_label:
        mov ah, 0x0e            ; int 10 / ah = 0x0e -> BIOS tele-type output
        int 0x10                ; print the character in AL

        jmp $

        ;; Padding and magic number
        times 510-($-$$) db 0
        dw 0xaa55
