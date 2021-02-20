; ArcadeTV/msu-md-wboy3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Build setup
	include		"_symbols.asm"
	include		"_constants.asm"
	include		"_macros.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		org $4
		;dc.l 	ENTRY_POINT						; custom entry point for redirecting
		
		org 	$100
		dc.b 	'SEGA MEGASD     '
		
		org 	$1A4							; ROM_END
		dc.l 	size_8M							; Overwrite with 8M MBIT size
				
		org 	$7BA
		jsr 	msuInit
Game

		org 	$CE3E
		jsr 	CustomPlaySound
		nop

		org 	$309A
		jsr 	msuPlay_SEGA


		org 	$80000					; use padded space from here ------------------------------------------------
MSUDRV
		incbin	"msu-drv.bin"

		align 	4
		include "_init.asm"

CustomPlaySound
		checkMusicID #$E0,d0,msuStop
		checkMusicID #$81,d0,msuPlay_02
		checkMusicID #$82,d0,msuPlay_03
		checkMusicID #$83,d0,msuPlay_04
		checkMusicID #$84,d0,msuPlay_05
		checkMusicID #$85,d0,msuPlay_06
		checkMusicID #$86,d0,msuPlay_07
		checkMusicID #$87,d0,msuPlay_08
		checkMusicID #$88,d0,msuPlay_09
		checkMusicID #$89,d0,msuPlay_10
		checkMusicID #$8A,d0,msuPlay_11
		checkMusicID #$8B,d0,msuPlay_12
		checkMusicID #$8C,d0,msuPlay_13
		checkMusicID #$8D,d0,msuPlay_14
		move.w  #$100,($A11100).l
		rts

		include "_tracks.asm"
		include "_msugeneral.asm"

MUTE_THIS
		move.w  #$100,($A11100).l
		move.b 	#$8E,d0
		rts

		align	4								; insert GFX and code for lockout screen
lockout
		incbin 	"msuLockout.bin"		
