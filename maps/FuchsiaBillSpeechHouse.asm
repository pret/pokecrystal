FuchsiaBillSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PokefanFScript_0x1963bd:
	jumptextfaceplayer UnknownText_0x1963c3

YoungsterScript_0x1963c0:
	jumptextfaceplayer UnknownText_0x1963f9

UnknownText_0x1963c3:
	text "My grandpa is at "
	line "my brother BILL's"
	cont "on CERULEAN CAPE."
	done

UnknownText_0x1963f9:
	text "I saw these weird,"
	line "slow #MON on"
	cont "CYCLING ROAD."
	done

FuchsiaBillSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_POKEFAN_F, 7, 6, $9, $0, 255, 255, $80, 0, PokefanFScript_0x1963bd, -1
	person_event SPRITE_YOUNGSTER, 8, 10, $4, $10, 255, 255, $0, 0, YoungsterScript_0x1963c0, -1
