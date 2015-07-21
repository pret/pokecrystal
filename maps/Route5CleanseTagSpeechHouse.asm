Route5CleanseTagSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrannyScript_0x18b634:
	faceplayer
	loadfont
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue UnknownScript_0x18b649
	writetext UnknownText_0x18b655
	keeptextopen
	verbosegiveitem CLEANSE_TAG, 1
	iffalse UnknownScript_0x18b64d
	setevent EVENT_GOT_CLEANSE_TAG
UnknownScript_0x18b649:
	writetext UnknownText_0x18b6a7
	closetext
UnknownScript_0x18b64d:
	loadmovesprites
	end

TeacherScript_0x18b64f:
	jumptextfaceplayer UnknownText_0x18b6de

HouseForSaleBookshelf:
	jumpstd difficultbookshelf

UnknownText_0x18b655:
	text "Eeyaaaah!"

	para "I sense a sinister"
	line "shadow hovering"
	cont "over you."

	para "Take this to ward"
	line "it off!"
	done

UnknownText_0x18b6a7:
	text "You were in mortal"
	line "danger, but you"
	cont "are protected now."
	done

UnknownText_0x18b6de:
	text "My grandma is into"
	line "warding off what"

	para "she believes to be"
	line "evil spirits."

	para "I'm sorry that she"
	line "startled you."
	done

Route5CleanseTagSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $3, 4, GROUP_ROUTE_5, MAP_ROUTE_5

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, HouseForSaleBookshelf
	signpost 1, 1, SIGNPOST_READ, HouseForSaleBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_GRANNY, 9, 6, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, GrannyScript_0x18b634, -1
	person_event SPRITE_TEACHER, 7, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, TeacherScript_0x18b64f, -1
