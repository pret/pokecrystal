SlowpokeWellB2F_MapScriptHeader: ; 0x5ad09
	; trigger count
	db 0

	; callback count
	db 0
; 0x5ad0b

GymGuyScript_0x5ad0b: ; 0x5ad0b
	faceplayer
	loadfont
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue UnknownScript_0x5ad22
	writetext UnknownText_0x5ad2a
	keeptextopen
	verbosegiveitem KINGS_ROCK, 1
	iffalse UnknownScript_0x5ad20
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
UnknownScript_0x5ad20: ; 0x5ad20
	loadmovesprites
	end
; 0x5ad22

UnknownScript_0x5ad22: ; 0x5ad22
	writetext UnknownText_0x5adf2
	closetext
	loadmovesprites
	end
; 0x5ad28

ItemFragment_0x5ad28: ; 0x5ad28
	db TM_18, 1
; 0x5ad2a

UnknownText_0x5ad2a: ; 0x5ad2a
	text "I'm waiting to see"
	line "SLOWPOKE's moment"
	cont "of evolution."

	para "Through observa-"
	line "tion, I made a new"
	cont "discovery."

	para "A SLOWPOKE with a"
	line "KING'S ROCK often"

	para "gets bitten by a"
	line "SHELLDER."

	para "Here, I'll share a"
	line "KING'S ROCK with"
	cont "you."
	done
; 0x5adf2

UnknownText_0x5adf2: ; 0x5adf2
	text "I'm going to be"
	line "like SLOWPOKE."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done
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
	person_event SPRITE_GYM_GUY, 8, 9, $2, $21, 255, 255, $0, 1, GymGuyScript_0x5ad0b, $ffff
	person_event SPRITE_POKE_BALL, 9, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x5ad28, $0663
; 0x5ae65

