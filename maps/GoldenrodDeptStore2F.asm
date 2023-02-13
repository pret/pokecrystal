	object_const_def
	const GOLDENRODDEPTSTORE2F_CLERK1
	const GOLDENRODDEPTSTORE2F_CLERK2
	const GOLDENRODDEPTSTORE2F_YOUNGSTER
	const GOLDENRODDEPTSTORE2F_COOLTRAINER_F
	const GOLDENRODDEPTSTORE2F_GENTLEMAN

GoldenrodDeptStore2F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore2FClerk1Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_1
	closetext
	end

GoldenrodDeptStore2FClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_2F_2
	closetext
	end

GoldenrodDeptStore2FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore2FYoungsterText

GoldenrodDeptStore2FCooltrainerFScript:
	jumptextfaceplayer GoldenrodDeptStore2FCooltrainerFText

GoldenrodDeptStore2FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore2FGentlemanText

GoldenrodDeptStore2FDirectory:
	jumptext GoldenrodDeptStore2FDirectoryText

GoldenrodDeptStore2FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore2FUnusedText1: ; unreferenced
	text "Nous voulons"
	line "vendre des objets"
	cont "pour les #MON."

	para "Voici un joli"
	line "cadeau et en plus"
	cont "c'est gratuit!"
	cont "Donne-le à un"
	cont "#MON."
	done

GoldenrodDeptStore2FUnusedText2: ; unreferenced
	text "Faire tenir des"
	line "objets aux #MON"
	cont "pendant le combat"
	cont "peut te permettre"
	cont "de prendre l'avan-"
	cont "tage."
	done

GoldenrodDeptStore2FYoungsterText:
	text "Le #MATOS"
	line "peut enregistrer"
	cont "jusqu'à dix"
	cont "numéros."

	para "C'est difficile de"
	line "décider quel"
	cont "numéro garder."
	done

GoldenrodDeptStore2FCooltrainerFText:
	text "J'ai eu mon ABRA"
	line "au CASINO."

	para "Maintenant, c'est"
	line "mon meilleur ami."
	done

GoldenrodDeptStore2FGentlemanText:
	text "Ce CENTRE COMMER-"
	line "CIAL montre que"

	para "DOUBLONVILLE est"
	line "une grande ville."

	para "La marchandise est"
	line "la meilleure de"
	cont "la région."
	done

GoldenrodDeptStore2FDirectoryText:
	text "Votre compagnon de"
	line "voyage"

	para "1ER  BOUTIQUE"
	line "     DRESSEUR"
	done

GoldenrodDeptStore2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_3F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_1F, 3
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore2FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore2FElevatorButton

	def_object_events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk1Script, -1
	object_event 13,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FClerk2Script, -1
	object_event  9,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FYoungsterScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FCooltrainerFScript, -1
	object_event  2,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore2FGentlemanScript, -1
