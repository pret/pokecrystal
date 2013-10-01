Route39Barn_MapScriptHeader: ; 0x9cc74
	; trigger count
	db 0

	; callback count
	db 0
; 0x9cc76

TwinScript_0x9cc76: ; 0x9cc76
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cc87
	2writetext UnknownText_0x9cd2e
	closetext
	loadmovesprites
	spriteface $2, $3
	end
; 0x9cc87

UnknownScript_0x9cc87: ; 0x9cc87
	2writetext UnknownText_0x9cd5a
	closetext
	loadmovesprites
	spriteface $2, $3
	end
; 0x9cc90

TwinScript_0x9cc90: ; 0x9cc90
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cca1
	2writetext UnknownText_0x9cd2e
	closetext
	loadmovesprites
	spriteface $3, $2
	end
; 0x9cca1

UnknownScript_0x9cca1: ; 0x9cca1
	2writetext UnknownText_0x9cd5a
	closetext
	loadmovesprites
	spriteface $3, $2
	end
; 0x9ccaa

TaurosScript_0x9ccaa: ; 0x9ccaa
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cd25
	2writetext UnknownText_0x9cd70
	writebyte MILTANK
	special $005f
	keeptextopen
	2writetext UnknownText_0x9cd80
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue UnknownScript_0x9ccc6
	closetext
	loadmovesprites
	end
; 0x9ccc6

UnknownScript_0x9ccc6: ; 0x9ccc6
	keeptextopen
	2writetext UnknownText_0x9cda2
	yesorno
	iffalse UnknownScript_0x9cd1f
	checkitem BERRY
	iffalse UnknownScript_0x9cd19
	takeitem BERRY, 1
	copybytetovar MooMooBerries
	addvar $1
	copyvartobyte MooMooBerries
	if_equal $3, UnknownScript_0x9ccf0
	if_equal $5, UnknownScript_0x9ccfa
	if_equal $7, UnknownScript_0x9cd04
	2writetext UnknownText_0x9cdbc
	closetext
	loadmovesprites
	end
; 0x9ccf0

UnknownScript_0x9ccf0: ; 0x9ccf0
	2writetext UnknownText_0x9cdbc
	keeptextopen
	2writetext UnknownText_0x9cdd8
	closetext
	loadmovesprites
	end
; 0x9ccfa

UnknownScript_0x9ccfa: ; 0x9ccfa
	2writetext UnknownText_0x9cdbc
	keeptextopen
	2writetext UnknownText_0x9cdfc
	closetext
	loadmovesprites
	end
; 0x9cd04

UnknownScript_0x9cd04: ; 0x9cd04
	playmusic $000d
	2writetext UnknownText_0x9cdbc
	pause 60
	keeptextopen
	special $003d
	2writetext UnknownText_0x9ce1b
	closetext
	loadmovesprites
	setevent EVENT_HEALED_MOOMOO
	end
; 0x9cd19

UnknownScript_0x9cd19: ; 0x9cd19
	2writetext UnknownText_0x9ce3c
	closetext
	loadmovesprites
	end
; 0x9cd1f

UnknownScript_0x9cd1f: ; 0x9cd1f
	2writetext UnknownText_0x9ce4f
	closetext
	loadmovesprites
	end
; 0x9cd25

UnknownScript_0x9cd25: ; 0x9cd25
	2writetext UnknownText_0x9cd92
	cry MILTANK
	closetext
	loadmovesprites
	end
; 0x9cd2e

UnknownText_0x9cd2e: ; 0x9cd2e
	db $0, "MOOMOO is sick…", $51
	db "She needs lots of", $4f
	db "BERRIES.", $57
; 0x9cd5a

UnknownText_0x9cd5a: ; 0x9cd5a
	db $0, "We're feeding", $4f
	db "MOOMOO!", $57
; 0x9cd70

UnknownText_0x9cd70: ; 0x9cd70
	db $0, "MILTANK: …Moo…", $57
; 0x9cd80

UnknownText_0x9cd80: ; 0x9cd80
	db $0, "Its cry is weak…", $57
; 0x9cd92

UnknownText_0x9cd92: ; 0x9cd92
	db $0, "MILTANK: Mooo!", $57
; 0x9cda2

UnknownText_0x9cda2: ; 0x9cda2
	db $0, "Give a BERRY to", $4f
	db "MILTANK?", $57
; 0x9cdbc

UnknownText_0x9cdbc: ; 0x9cdbc
	db $0, $52, " gave a", $4f
	db "BERRY to MILTANK.", $57
; 0x9cdd8

UnknownText_0x9cdd8: ; 0x9cdd8
	db $0, "MILTANK became a", $4f
	db "little healthier!", $57
; 0x9cdfc

UnknownText_0x9cdfc: ; 0x9cdfc
	db $0, "MILTANK became", $4f
	db "quite healthy!", $57
; 0x9ce1b

UnknownText_0x9ce1b: ; 0x9ce1b
	db $0, "MILTANK became", $4f
	db "totally healthy!", $57
; 0x9ce3c

UnknownText_0x9ce3c: ; 0x9ce3c
	db $0, $52, " has no", $4f
	db "BERRIES…", $57
; 0x9ce4f

UnknownText_0x9ce4f: ; 0x9ce4f
	db $0, $52, " wouldn't", $4f
	db "give a BERRY.", $51
	db "MILTANK looks sad.", $57
; 0x9ce7b

Route39Barn_MapEventHeader: ; 0x9ce7b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 1, GROUP_ROUTE_39, MAP_ROUTE_39
	warp_def $7, $4, 1, GROUP_ROUTE_39, MAP_ROUTE_39

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_TWIN, 7, 6, $9, $0, 255, 255, $0, 0, TwinScript_0x9cc76, $ffff
	person_event SPRITE_TWIN, 7, 8, $8, $0, 255, 255, $a0, 0, TwinScript_0x9cc90, $ffff
	person_event SPRITE_TAUROS, 7, 7, $16, $0, 255, 255, $0, 0, TaurosScript_0x9ccaa, $ffff
; 0x9ceb2

