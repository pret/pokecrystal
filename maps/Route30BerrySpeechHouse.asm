Route30BerrySpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PokefanMScript_0x196d64:
	faceplayer
	loadfont
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue UnknownScript_0x196d79
	writetext UnknownText_0x196d82
	keeptextopen
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0x196d7d
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
UnknownScript_0x196d79:
	writetext UnknownText_0x196dec
	closetext
UnknownScript_0x196d7d:
	loadmovesprites
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

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_30, MAP_ROUTE_30
	warp_def $7, $3, 1, GROUP_ROUTE_30, MAP_ROUTE_30

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, Route30BerrySpeechHouseBookshelf
	signpost 1, 1, $0, Route30BerrySpeechHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_POKEFAN_M, 7, 6, $6, $0, 255, 255, $b0, 0, PokefanMScript_0x196d64, -1
