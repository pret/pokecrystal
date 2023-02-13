	object_const_def
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

LavenderPokecenter1FGentlemanScript:
	jumptextfaceplayer LavenderPokecenter1FGentlemanText

LavenderPokecenter1FTeacherScript:
	jumptextfaceplayer LavenderPokecenter1FTeacherText

LavenderPokecenter1FYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavenderPokecenter1FYoungsterText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavenderPokecenter1FYoungsterText_ReturnedMachinePart
	waitbutton
	closetext
	end

LavenderPokecenter1FGentlemanText:
	text "Au Nord de LAVAN-"
	line "VILLE se trouve la"

	para "GROTTE. Traverse-"
	line "la pour accéder"
	cont "à la CENTRALE."
	done

LavenderPokecenter1FTeacherText:
	text "Une émission de"
	line "radio diffuse des"
	cont "mélodies jouées à"
	cont "la # FLUTE."

	para "Oh? Il faut un"
	line "CPN EXPAN. à ta"
	cont "radio pour pouvoir"
	cont "l'écouter."
	done

LavenderPokecenter1FYoungsterText:
	text "Si la CENTRALE ne"
	line "marche pas, le"

	para "TRAIN MAGNET ne"
	line "peut pas circuler."

	para "La STATION RADIO"
	line "ne peut rien"
	cont "émettre non plus."
	done

LavenderPokecenter1FYoungsterText_ReturnedMachinePart:
	text "Le DIRECTEUR de la"
	line "STATION de RADIO"
	cont "était content."

	para "Il dit que les"
	line "émissions peuvent"

	para "reprendre depuis"
	line "la réparation de"
	cont "la CENTRALE."
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FTeacherScript, -1
	object_event  1,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
