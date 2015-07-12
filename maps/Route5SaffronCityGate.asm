Route5SaffronCityGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

OfficerScript_0x18b5b9:
	jumptextfaceplayer UnknownText_0x18b5bc

UnknownText_0x18b5bc:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route5SaffronCityGate_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 2, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $0, $5, 3, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $4, 9, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $5, 9, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $90, 0, OfficerScript_0x18b5b9, EVENT_ALWAYS_THERE
