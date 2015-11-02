;
; A simple boot sector program that loops forever.
;

loop:                               
    jmp loop                        

times 510-($-$$) db 0               ; When compiled, program must fit into 512 bytes, with the last
                                    ; two bytes being the "magic" number. Tell our assembly compiler
                                    ; to pad out our program with enough zero bytes (db 0) to bring us to
                                    ; the 510th byte.

dw 0xaa55                           ; Last two bytes form the "magic" number, so BIOS knows we
                                    ; are a boot sector.
