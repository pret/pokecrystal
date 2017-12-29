FarCall    EQU $08
Bankswitch EQU $10
JumpTable  EQU $28

farcall: MACRO ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

callfar: MACRO ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
ENDM

; legacy support for pre-2018 pokecrystal
callba EQUS "farcall"
callab EQUS "callfar"

homecall: MACRO
	ld a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
