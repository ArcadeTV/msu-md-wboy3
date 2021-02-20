; I/O
HW_version      equ $A10001             ; hardware version in low nibble
                                        ; bit 6 is PAL (50Hz) if set, NTSC (60Hz) if clear
                                        ; region flags in bits 7 and 6:
                                        ;         USA NTSC = $80
                                        ;         Asia PAL = $C0
                                        ;         Japan NTSC = $00
                                        ;         Europe PAL = $C0
M68K_RAM        equ $FF0000

; MSU-MD vars
MCD_STAT        equ $A12020             ; 0-ready, 1-init, 2-cmd busy
MCD_CMD         equ $A12010
MCD_ARG         equ $A12011
MCD_SEEK		equ $A12012
MCD_CMD_CK      equ $A1201F

size_4M         equ $7FFFF
size_8M         equ $FFFFF
size_16M        equ $1FFFFF
size_32M        equ $3FFFFF

paddedSpace_4M  equ $40000
paddedSpace_8M  equ $80000
paddedSpace_16M equ $100000
paddedSpace_32M equ $200000

_RESET          equ $6BA