	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "C'est quoi ça? La"
	line "TEAM ROCKET est de"
	cont "retour?"

	para "J'ai vu des hommes"
	line "en noir au LAC"
	cont "COLERE..."
	done

MahoganyPokecenter1FYoungsterText:
	text "J'ai empêché mes"
	line "#MON d'évoluer"
	cont "trop tôt."

	para "Je leur fais"
	line "apprendre cer-"
	cont "taines capacités"
	cont "avant de les faire"
	cont "évoluer."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "Les #MON"
	line "deviennent bien"

	para "plus forts lorsqu'"
	line "ils évoluent mais"
	cont "ils apprennent"
	cont "leurs capacités"
	cont "plus lentement."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
