DarkCaveBlackthornEntrance_MapScriptHeader: ; 0x18c71e
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c720

PharmacistScript_0x18c720: ; 0x18c720
	faceplayer
	loadfont
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue UnknownScript_0x18c735
	writetext UnknownText_0x18c73f
	keeptextopen
	verbosegiveitem BLACKGLASSES, 1
	iffalse UnknownScript_0x18c739
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
UnknownScript_0x18c735: ; 0x18c735
	writetext UnknownText_0x18c80c
	closetext
UnknownScript_0x18c739: ; 0x18c739
	loadmovesprites
	end
; 0x18c73b

ItemFragment_0x18c73b: ; 0x18c73b
	db REVIVE, 1
; 0x18c73d

ItemFragment_0x18c73d: ; 0x18c73d
	db TM_SNORE, 1
; 0x18c73f

UnknownText_0x18c73f: ; 0x18c73f
	text "Whoa! You startled"
	line "me there!"

	para "I had my BLACK-"
	line "GLASSES on, so I"

	para "didn't notice you"
	line "at all."

	para "What am I doing"
	line "here?"

	para "Hey, don't you"
	line "worry about it."

	para "I'll give you a"
	line "pair of BLACK-"
	cont "GLASSES, so forget"
	cont "you saw me, OK?"
	done
; 0x18c80c

UnknownText_0x18c80c: ; 0x18c80c
	text "BLACKGLASSES ups"
	line "the power of dark-"
	cont "type moves."
	done
; 0x18c83d

DarkCaveBlackthornEntrance_MapEventHeader: ; 0x18c83d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $17, 1, GROUP_ROUTE_45, MAP_ROUTE_45
	warp_def $19, $3, 2, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_PHARMACIST, 7, 11, $3, $0, 255, 255, $0, 0, PharmacistScript_0x18c720, $ffff
	person_event SPRITE_POKE_BALL, 28, 25, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c73b, $06a1
	person_event SPRITE_POKE_BALL, 26, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c73d, $06a2
; 0x18c874
