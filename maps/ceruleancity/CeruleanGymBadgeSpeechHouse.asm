const_value set 2
	const CERULEANGYMBADGESPEECHHOUSE_POKEFAN_M

CeruleanGymBadgeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 1, CERULEAN_CITY
	warp_def $7, $3, 1, CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x188002, -1
