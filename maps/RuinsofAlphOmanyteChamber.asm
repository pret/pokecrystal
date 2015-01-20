RuinsofAlphOmanyteChamber_MapScriptHeader: ; 0x58bdc
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x58be9, $0000
	dw UnknownScript_0x58bf7, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x58bf8
; 0x58be9

UnknownScript_0x58be9: ; 0x58be9
	special $0084
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58bf3
	end
; 0x58bf3

UnknownScript_0x58bf3: ; 0x58bf3
	priorityjump UnknownScript_0x58c12
	end
; 0x58bf7

UnknownScript_0x58bf7: ; 0x58bf7
	end
; 0x58bf8

UnknownScript_0x58bf8: ; 0x58bf8
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58c02
	changeblock $4, $0, $2e
UnknownScript_0x58c02: ; 0x58c02
	checkevent $02a2
	iffalse UnknownScript_0x58c09
	return
; 0x58c09

UnknownScript_0x58c09: ; 0x58c09
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return
; 0x58c12

UnknownScript_0x58c12: ; 0x58c12
	pause 30
	earthquake 30
	showemote $0, $0, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock $4, $0, $30
	reloadmappart
	earthquake 50
	dotrigger $1
	loadmovesprites
	end
; 0x58c2a

MapRuinsofAlphOmanyteChamberSignpost2Script: ; 0x58c2a
	refreshscreen $0
	writebyte $1
	special $0029
	loadmovesprites
	iftrue UnknownScript_0x58c36
	end
; 0x58c36

UnknownScript_0x58c36: ; 0x58c36
	setevent $0705
	setevent $02a2
	setflag $002c
	domaptrigger GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote $0, $0, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement $0, MovementData_0x58c8c
	playsound SFX_KINESIS
	waitbutton
	pause 20
	warpcheck
	end
; 0x58c63

MapRuinsofAlphOmanyteChamberSignpost1Script: ; 0x58c63
	jumptext UnknownText_0x58d01
; 0x58c66

MapRuinsofAlphOmanyteChamberSignpost3Script: ; 0x58c66
	jumptext UnknownText_0x58d26
; 0x58c69

MapRuinsofAlphOmanyteChamberSignpost4Script: ; 0x58c69
	loadfont
	writetext UnknownText_0x58c8e
	writebyte $2
	special $0087
	loadmovesprites
	end
; 0x58c74

MapRuinsofAlphOmanyteChamberSignpost5Script: ; 0x58c74
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58c85
	loadfont
	writetext UnknownText_0x58cc0
	writebyte $2
	special $0087
	loadmovesprites
	end
; 0x58c85

UnknownScript_0x58c85: ; 0x58c85
	loadfont
	writetext UnknownText_0x58ce1
	closetext
	loadmovesprites
	end
; 0x58c8c

MovementData_0x58c8c: ; 0x58c8c
	db $59 ; movement
	step_end
; 0x58c8e

UnknownText_0x58c8e: ; 0x58c8e
	text "Patterns appeared"
	line "on the walls…"
	done
; 0x58caf

; possibly unused.. this again?
UnknownText_0x58caf: ; 0x58caf
	text "It's UNOWN text!"
	done
; 0x58cc0

UnknownText_0x58cc0: ; 0x58cc0
	text "Patterns appeared"
	line "on the walls…"
	done
; 0x58ce1

UnknownText_0x58ce1: ; 0x58ce1
	text "There's a big hole"
	line "in the wall!"
	done
; 0x58d01

UnknownText_0x58d01: ; 0x58d01
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
; 0x58d26

UnknownText_0x58d26: ; 0x58d26
	text "This #MON"
	line "drifted in the"

	para "sea by twisting"
	line "its ten tentacles."
	done
; 0x58d63

RuinsofAlphOmanyteChamber_MapEventHeader: ; 0x58d63
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $9, $3, 3, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 3, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 6, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 7, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, GROUP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 3, 2, $0, MapRuinsofAlphOmanyteChamberSignpost1Script
	signpost 3, 5, $0, MapRuinsofAlphOmanyteChamberSignpost1Script
	signpost 2, 3, $1, MapRuinsofAlphOmanyteChamberSignpost2Script
	signpost 2, 4, $1, MapRuinsofAlphOmanyteChamberSignpost3Script
	signpost 0, 3, $1, MapRuinsofAlphOmanyteChamberSignpost4Script
	signpost 0, 4, $1, MapRuinsofAlphOmanyteChamberSignpost5Script

	; people-events
	db 0
; 0x58da0

