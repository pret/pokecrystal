const_value set 2
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

OlivineLighthouse1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FSailorText:
	text "People train at"
	line "this LIGHTHOUSE."

	para "It's not easy to"
	line "climb because of"
	cont "all the trainers."
	done

OlivineLighthouse1FPokefanFText:
	text "In the past, #-"
	line "MON used to light"

	para "the sea around"
	line "OLIVINE at night."

	para "The LIGHTHOUSE was"
	line "made in honor of"
	cont "those #MON."
	done

OlivineLighthouse1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 10, 17, 9, OLIVINE_CITY
	warp_def 11, 17, 9, OLIVINE_CITY
	warp_def 3, 11, 1, OLIVINE_LIGHTHOUSE_2F
	warp_def 16, 13, 3, OLIVINE_LIGHTHOUSE_2F
	warp_def 17, 13, 4, OLIVINE_LIGHTHOUSE_2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 8, 2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 16, 9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
