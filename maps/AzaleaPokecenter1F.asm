	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_FISHING_GURU
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
	jumptextfaceplayer AzaleaPokecenter1FPokefanFText

AzaleaPokecenter1FGentlemanText:
	text "Est-ce que ton"
	line "#MON connait"
	cont "des CS?"

	para "Ces actions"
	line "peuvent être réa-"

	para "lisées même si le"
	line "#MON est"
	cont "évanoui."
	done

AzaleaPokecenter1FUnusedText: ; unreferenced
	text_start
	done

AzaleaPokecenter1FFishingGuruText:
	text "Le PC de LEO peut"
	line "garder jusqu'à 20"
	cont "#MON par BOITE."
	done

AzaleaPokecenter1FPokefanFText:
	text "Connais-tu les"
	line "NOIGRUMES?"

	para "Ouvres-en un,"
	line "vide-le et"

	para "remplis-le avec un"
	line "appareil spécial."

	para "Tu pourras alors"
	line "t'en servir pour"
	cont "attraper des"
	cont "#MON."

	para "Avant que les"
	line "# BALLS ne"

	para "soient inventées"
	line "tout le monde"
	cont "utilisait les"
	cont "NOIGRUMES."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
