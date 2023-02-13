	object_const_def
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

OlivineLighthouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FSailorText:
	text "Les gens s'entraî-"
	line "nent au PHARE."

	para "Y monter est dur à"
	line "cause de tous les"
	cont "dresseurs."
	done

OlivineLighthouse1FPokefanFText:
	text "Il y a longtemps,"
	line "des #MON illu-"

	para "minaient les mers"
	line "autour d'OLIVILLE."

	para "Le PHARE a été"
	line "construit en"
	cont "hommage à ces"
	cont "#MON."
	done

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, OLIVINE_CITY, 9
	warp_event 11, 17, OLIVINE_CITY, 9
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_2F, 3
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 16,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
