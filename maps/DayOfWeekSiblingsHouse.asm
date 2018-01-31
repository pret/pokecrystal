const_value set 2
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokedexScript_0x7b1e4:
	opentext
	writetext UnknownText_0x7b1f9
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b222
	yesorno
	iffalse UnknownText_0x7b1f7
	writetext UnknownText_0x7b2b9
	waitbutton
UnknownText_0x7b1f7:
	closetext
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

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 3, ROUTE_26
	warp_event 3, 7, 3, ROUTE_26

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 3, 3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokedexScript_0x7b1e4, -1
