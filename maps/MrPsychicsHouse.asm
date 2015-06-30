MrPsychicsHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MrPsychic:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	keeptextopen
	verbosegiveitem TM_PSYCHIC, 1
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem
	writetext MrPsychicText2
	closetext
.Done
	loadmovesprites
	end

MrPsychicsHouseBookshelf:
	jumpstd difficultbookshelf

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is PSYCHIC."

	para "It may lower the"
	line "target's SPCL.DEF."
	done

MrPsychicsHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 5, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MrPsychicsHouseBookshelf
	signpost 1, 1, $0, MrPsychicsHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 9, $8, $0, 255, 255, $a0, 0, MrPsychic, $ffff
