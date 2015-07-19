OlivinePortPassage_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PokefanMScript_0x76fac:
	jumptextfaceplayer UnknownText_0x76faf

UnknownText_0x76faf:
	text "FAST SHIP S.S.AQUA"
	line "sails to KANTO on"

	para "Mondays and Fri-"
	line "days."
	done

OlivinePortPassage_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $0, $f, 10, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $0, $10, 11, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $4, $f, 4, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE
	warp_def $2, $3, 3, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE
	warp_def $e, $3, 1, GROUP_OLIVINE_PORT, MAP_OLIVINE_PORT

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKEFAN_M, 5, 21, OW_LEFT | $0, $0, -1, -1, $0, 0, PokefanMScript_0x76fac, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
