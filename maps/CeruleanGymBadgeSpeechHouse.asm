CeruleanGymBadgeSpeechHouse_MapScriptHeader: ; 0x188000
	; trigger count
	db 0

	; callback count
	db 0
; 0x188002

PokefanMScript_0x188002: ; 0x188002
	jumptextfaceplayer UnknownText_0x188005
; 0x188005

UnknownText_0x188005: ; 0x188005
	text "Are you collecting"
	line "KANTO GYM BADGES?"
	done
; 0x18802b

CeruleanGymBadgeSpeechHouse_MapEventHeader: ; 0x18802b
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
	person_event SPRITE_POKEFAN_M, 7, 6, $9, $0, 255, 255, $0, 0, PokefanMScript_0x188002, $ffff
; 0x188048

