const_value set 2
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

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
	warp_def $11, $a, 9, OLIVINE_CITY
	warp_def $11, $b, 9, OLIVINE_CITY
	warp_def $b, $3, 1, OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $10, 3, OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $11, 4, OLIVINE_LIGHTHOUSE_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_SAILOR, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x5ae67, -1
	person_event SPRITE_POKEFAN_F, 9, 16, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x5ae6a, -1
