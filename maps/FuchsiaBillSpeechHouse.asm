FuchsiaBillSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 4, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_F, 7, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanFScript_0x1963bd, -1
	person_event SPRITE_YOUNGSTER, 8, 10, OW_UP | $0, $10, -1, -1, $0, 0, YoungsterScript_0x1963c0, -1
