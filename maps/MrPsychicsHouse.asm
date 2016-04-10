const_value set 2
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	buttonsound
	verbosegiveitem TM_PSYCHIC
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
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

.Warps:
	db 2
	warp_def $7, $2, 5, SAFFRON_CITY
	warp_def $7, $3, 5, SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, MrPsychicsHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, MrPsychicsHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MrPsychic, -1
