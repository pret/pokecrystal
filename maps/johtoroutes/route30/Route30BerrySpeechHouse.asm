const_value set 2
	const ROUTE30BERRYSPEECHHOUSE_POKEFAN_M

Route30BerrySpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x196d64:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue UnknownScript_0x196d79
	writetext UnknownText_0x196d82
	buttonsound
	verbosegiveitem BERRY
	iffalse UnknownScript_0x196d7d
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
UnknownScript_0x196d79:
	writetext UnknownText_0x196dec
	waitbutton
UnknownScript_0x196d7d:
	closetext
	end

Route30BerrySpeechHouseBookshelf:
	jumpstd magazinebookshelf

UnknownText_0x196d82:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

UnknownText_0x196dec:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route30BerrySpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, ROUTE_30
	warp_def $7, $3, 1, ROUTE_30

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, Route30BerrySpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route30BerrySpeechHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x196d64, -1
