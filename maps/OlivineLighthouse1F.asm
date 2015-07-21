OlivineLighthouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SailorScript_0x5ae67:
	jumptextfaceplayer UnknownText_0x5ae6d

PokefanFScript_0x5ae6a:
	jumptextfaceplayer UnknownText_0x5aec2

UnknownText_0x5ae6d:
	text "People train at"
	line "this LIGHTHOUSE."

	para "It's not easy to"
	line "climb because of"
	cont "all the trainers."
	done

UnknownText_0x5aec2:
	text "In the past, #-"
	line "MON used to light"

	para "the sea around"
	line "OLIVINE at night."

	para "The LIGHTHOUSE was"
	line "made in honor of"
	cont "those #MON."
	done

OlivineLighthouse1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $11, $a, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $11, $b, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $b, $3, 1, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $10, 3, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $11, 4, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_SAILOR, 6, 12, OW_UP | $2, $0, -1, -1, $0, 0, SailorScript_0x5ae67, -1
	person_event SPRITE_POKEFAN_F, 13, 20, OW_UP | $0, $20, -1, -1, $0, 0, PokefanFScript_0x5ae6a, -1
