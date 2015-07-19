CeruleanGymBadgeSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PokefanMScript_0x188002:
	jumptextfaceplayer UnknownText_0x188005

UnknownText_0x188005:
	text "Are you collecting"
	line "KANTO GYM BADGES?"
	done

CeruleanGymBadgeSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 1, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKEFAN_M, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, PokefanMScript_0x188002, -1
