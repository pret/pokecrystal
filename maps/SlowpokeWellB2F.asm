SlowpokeWellB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GymGuyScript_0x5ad0b:
	faceplayer
	loadfont
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue UnknownScript_0x5ad22
	writetext UnknownText_0x5ad2a
	keeptextopen
	verbosegiveitem KINGS_ROCK, 1
	iffalse UnknownScript_0x5ad20
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
UnknownScript_0x5ad20:
	loadmovesprites
	end

UnknownScript_0x5ad22:
	writetext UnknownText_0x5adf2
	closetext
	loadmovesprites
	end

ItemFragment_0x5ad28:
	db TM_RAIN_DANCE, 1

UnknownText_0x5ad2a:
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

UnknownText_0x5adf2:
	text "I'm going to be"
	line "like SLOWPOKE."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done

SlowpokeWellB2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $b, $9, 2, GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_GYM_GUY, 8, 9, OW_DOWN | $2, $21, -1, -1, $0, 1, GymGuyScript_0x5ad0b, -1
	person_event SPRITE_POKE_BALL, 9, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5ad28, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
