	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "As-tu rencontré le"
	line "#MANIAC?"

	para "Il se vante sans"
	line "cesse sur ses"
	cont "#MON rares."
	done

CianwoodGymGuideText:
	text "Les dresseurs de"
	line "l'ARENE sont des"
	cont "grosses brutes."

	para "Je veux pas qu'ils"
	line "s'en prennent à"
	cont "moi."

	para "Un conseil: le"
	line "CHAMPION utilise"
	cont "le type COMBAT."

	para "Tu devrais donc"
	line "utiliser des"
	cont "#MON PSY."

	para "Mets son équipe"
	line "K.O. avant qu'elle"

	para "n'utilise la"
	line "force."

	para "Et les rochers au"
	line "milieu de l'ARENE?"

	para "Bouge-les correc-"
	line "tement pour accé-"
	cont "der au CHAMPION."

	para "Si tu ne peux plus"
	line "progresser, sors."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>!"
	line "Tu as gagné!"
	cont "Je le savais rien"
	cont "qu'en te voyant!"
	done

CianwoodPokecenter1FUnusedText1: ; unreferenced
	text_start
	done

CianwoodPokecenter1FUnusedText2: ; unreferenced
	text_start
	done

CianwoodPokecenter1FSuperNerdText:
	text "J'adore frimer"
	line "avec mes #MON."

	para "Et toi?"
	line "C'est ton truc?"

	para "Je vais faire"
	line "plein de combats"

	para "et frimer avec"
	line "mes jolis #MON!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
