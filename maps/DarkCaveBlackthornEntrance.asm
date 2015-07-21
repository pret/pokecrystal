DarkCaveBlackthornEntrance_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PharmacistScript_0x18c720:
	faceplayer
	loadfont
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue UnknownScript_0x18c735
	writetext UnknownText_0x18c73f
	keeptextopen
	verbosegiveitem BLACKGLASSES, 1
	iffalse UnknownScript_0x18c739
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
UnknownScript_0x18c735:
	writetext UnknownText_0x18c80c
	closetext
UnknownScript_0x18c739:
	loadmovesprites
	end

ItemFragment_0x18c73b:
	db REVIVE, 1

ItemFragment_0x18c73d:
	db TM_SNORE, 1

UnknownText_0x18c73f:
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

UnknownText_0x18c80c:
	text "BLACKGLASSES ups"
	line "the power of dark-"
	cont "type moves."
	done

DarkCaveBlackthornEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $17, 1, GROUP_ROUTE_45, MAP_ROUTE_45
	warp_def $19, $3, 2, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_PHARMACIST, 7, 11, OW_DOWN | $3, $0, -1, -1, $0, 0, PharmacistScript_0x18c720, -1
	person_event SPRITE_POKE_BALL, 28, 25, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c73b, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	person_event SPRITE_POKE_BALL, 26, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c73d, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
