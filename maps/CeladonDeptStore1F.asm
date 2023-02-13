	object_const_def
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore1FReceptionistScript:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd ElevatorButtonScript

CeladonDeptStore1FReceptionistText:
	text "Bienvenue au"
	line "CENTRE COMMERCIAL"
	cont "de CELADOPOLE!"

	para "Les informations"
	line "sont sur le mur."
	done

CeladonDeptStore1FGentlemanText:
	text "Ce CENTRE COMMER-"
	line "CIAL appartient à"

	para "la même chaîne que"
	line "celui de DOUBLON-"
	cont "VILLE."

	para "Ils ont été réno-"
	line "vés en même temps."
	done

CeladonDeptStore1FTeacherText:
	text "C'est la première"
	line "fois que je viens"
	cont "ici."

	para "C'est grand..."

	para "Je vais me perdre."
	line "C'est sûr."
	done

CeladonDeptStore1FDirectoryText:
	text "RDC:  COMPTOIR"
	line "      SERVICE"

	para "1ER:  MARCHE DU"
	line "      DRESSEUR"

	para "2EME: MARCHE AUX"
	line "      CT"

	para "3EME: CADEAUX DU"
	line "      SAGE"

	para "4EME: POTIONS, etc"

	para "5EME: ESPACE TOIT"
	done

CeladonDeptStore1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	def_object_events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, -1
