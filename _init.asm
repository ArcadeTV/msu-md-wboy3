msuInit
    btst    #$6,(HW_version).l          ; Check for PAL or NTSC, 0=60Hz, 1=50Hz
    bne     jump_lockout                ; branch if != 0
    jsr     audio_init
    lea     (M68K_RAM).l,a0
    jmp     Game
jump_lockout
    jmp     lockout


audio_init
    jsr     MSUDRV
    nop
    
    if PRODUCTION
    tst.b   d0                          ; if 1: no CD Hardware found
    bne     audio_init_fail             
    endif
    
    MCD_WAIT
    move.w  #($1600|1),MCD_CMD          ; seek time emulation switch
                                        ; 0-on(default state), 1-off(no seek delays)
    addq.b  #1,MCD_CMD_CK               ; Increment command clock    
    
    MCD_WAIT
    move.w  #($1500|255),MCD_CMD        ; Set CD Volume to MAX
    addq.b  #1,MCD_CMD_CK               ; Increment command clock

    rts

audio_init_fail
    jmp     lockout