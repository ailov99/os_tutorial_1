        ;;
        ;; A simple boot sector program that demonstrates addressing
        ;;

                                ; manual offset suggestion: [org 0x7c00]
        
        mov ah, 0x0e            ; int 10 / ah = 0eh -> scrolling teletype BIOS routine

        ;; First attempt
        mov al, t_sec
        int 0x10                ; Attempts to print the offset itself, instead of the char at the offset

        ;; Second attempt
        mov al, t_sec
        int 0x10                ; [] prints CONTENTS at an offset -> doesn't work since it attempts to print from [0x0+offset]

        ;; Third attempt
        mov bx, t_sec
        add bx, 0x7c00          ; add offset+address of where BIOS put code
        mov al, [bx]            ; store total offset at AL
        int 0x10                ; should work

        ;; Fourth attempt
        mov al, [0x7c1e]        ; precalculate total address (sec + 0x7c00)
        int 0x10                ; should work

        jmp $                   ; Jump forever

sec:
        db "X"

        ;; Padding and magic BIOS number
        times 510-($-$$) db 0
        dw 0xaa55
