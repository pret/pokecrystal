const_value set 2
	const ROUTE5CLEANSETAGSPEECHHOUSE_GRANNY
	const ROUTE5CLEANSETAGSPEECHHOUSE_TEACHER

Route5CleanseTagSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrannyScript_0x18b634:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue UnknownScript_0x18b649
	writetext UnknownText_0x18b655
	buttonsound
	verbosegiveitem CLEANSE_TAG
	iffalse UnknownScript_0x18b64d
	setevent EVENT_GOT_CLEANSE_TAG
UnknownScript_0x18b649:
	writetext UnknownText_0x18b6a7
	waitbutton
UnknownScript_0x18b64d:
	closetext
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
	warp_def $7, $2, 4, ROUTE_5
	warp_def $7, $3, 4, ROUTE_5

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, HouseForSaleBookshelf
	signpost 1, 1, SIGNPOST_READ, HouseForSaleBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_GRANNY, 5, 2, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrannyScript_0x18b634, -1
	person_event SPRITE_TEACHER, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x18b64f, -1
