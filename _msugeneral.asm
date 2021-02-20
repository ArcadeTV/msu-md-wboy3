msuFade
    MCD_WAIT
    move.w  #($1300|30),MCD_CMD         ; send msu cmd
    addq.b  #1,MCD_CMD_CK               ; Increment command clock
    move.w  #$100,($A11100).l
    rts
msuStop
msuPause
    MCD_WAIT
    move.w  #($1300),MCD_CMD            ; send msu cmd
    addq.b  #1,MCD_CMD_CK               ; Increment command clock
    move.w  #$100,($A11100).l
    rts
msuResume
    MCD_WAIT
    move.w  #($1400),MCD_CMD            ; send msu cmd
    addq.b  #1,MCD_CMD_CK               ; Increment command clock
    move.w  #$100,($A11100).l
    rts