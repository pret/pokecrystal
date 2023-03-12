; Far calls to another bank

MACRO farcall ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

MACRO newfarcall ; bank, address
	; We can't replace previous farcalls because it breaks saves...
	rst BetterFarCall
	dbw BANK(\1), \1
ENDM

MACRO newfarjp
	rst BetterFarCall
	dbw BANK(\1) | $80, \1
ENDM

MACRO callfar ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
ENDM

MACRO homecall
	ldh a, [hROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
