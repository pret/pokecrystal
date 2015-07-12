Route26DayofWeekSiblingsHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PokedexScript_0x7b1e4:
	loadfont
	writetext UnknownText_0x7b1f9
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b222
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b2b9
	closetext
UnknownText_0x7b1f7:
	loadmovesprites
	end

UnknownText_0x7b1f9:
	text "There's something"
	line "written here."

	para "Read it?"
	done

UnknownText_0x7b222:
	text "To my brothers and"
	line "sisters:"

	para "We take pride in"
	line "serving #MON"
	cont "trainers."

	para "When trainers talk"
	line "to you, give them"
	cont "something useful."

	para "Love,"
	line "MONICA"

	para "Keep reading?"
	done

UnknownText_0x7b2b9:
	text "Monday, MONICA"
	line "ROUTE 40"

	para "Tuesday, TUSCANY"
	line "ROUTE 29"

	para "Wednesday, WESLEY"
	line "LAKE OF RAGE"

	para "Thursday, ARTHUR"
	line "ROUTE 36"

	para "Friday, FRIEDA"
	line "ROUTE 32"

	para "Saturday, SANTOS"
	line "BLACKTHORN CITY"

	para "Sunday, SUNNY"
	line "ROUTE 37"
	done

Route26DayofWeekSiblingsHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $7, $3, 3, GROUP_ROUTE_26, MAP_ROUTE_26

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKEDEX, 7, 7, $1, $0, 255, 255, $0, 0, PokedexScript_0x7b1e4, EVENT_ALWAYS_THERE
