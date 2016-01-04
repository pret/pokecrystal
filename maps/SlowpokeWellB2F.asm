const_value set 2
	const SLOWPOKEWELLB2F_GYM_GUY
	const SLOWPOKEWELLB2F_POKE_BALL

SlowpokeWellB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GymGuyScript_0x5ad0b:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue UnknownScript_0x5ad22
	writetext UnknownText_0x5ad2a
	buttonsound
	verbosegiveitem KINGS_ROCK
	iffalse UnknownScript_0x5ad20
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
UnknownScript_0x5ad20:
	closetext
	end

UnknownScript_0x5ad22:
	writetext UnknownText_0x5adf2
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

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
	warp_def $b, $9, 2, SLOWPOKE_WELL_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_GYM_GUY, 4, 5, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 1, GymGuyScript_0x5ad0b, -1
	person_event SPRITE_POKE_BALL, 5, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
