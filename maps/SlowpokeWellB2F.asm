SlowpokeWellB2F_MapScriptHeader: ; 0x5ad09
	; trigger count
	db 0

	; callback count
	db 0
; 0x5ad0b

UnknownScript_0x5ad0b: ; 0x5ad0b
	faceplayer
	loadfont
	checkbit1 $0073
	iftrue UnknownScript_0x5ad22
	2writetext UnknownText_0x5ad2a
	keeptextopen
	verbosegiveitem KINGS_ROCK, 1
	iffalse UnknownScript_0x5ad20
	setbit1 $0073
UnknownScript_0x5ad20: ; 0x5ad20
	loadmovesprites
	end
; 0x5ad22

UnknownScript_0x5ad22: ; 0x5ad22
	2writetext UnknownText_0x5adf2
	closetext
	loadmovesprites
	end
; 0x5ad28

ItemFragment_0x5ad28: ; 0x5ad28
	db TM_18, 1
; 0x5ad2a

UnknownText_0x5ad2a: ; 0x5ad2a
	db $0, "I'm waiting to see", $4f
	db "SLOWPOKE's moment", $55
	db "of evolution.", $51
	db "Through observa-", $4f
	db "tion, I made a new", $55
	db "discovery.", $51
	db "A SLOWPOKE with a", $4f
	db "KING'S ROCK often", $51
	db "gets bitten by a", $4f
	db "SHELLDER.", $51
	db "Here, I'll share a", $4f
	db "KING'S ROCK with", $55
	db "you.", $57
; 0x5adf2

UnknownText_0x5adf2: ; 0x5adf2
	db $0, "I'm going to be", $4f
	db "like SLOWPOKE.", $51
	db "I'll wait patient-", $4f
	db "ly, so I can see", $55
	db "one evolve.", $57
; 0x5ae40

SlowpokeWellB2F_MapEventHeader: ; 0x5ae40
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $b, $9, 2, GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $48, 8, 9, $2, $21, 255, 255, $0, 1, UnknownScript_0x5ad0b, $ffff
	person_event $54, 9, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x5ad28, $0663
; 0x5ae65

