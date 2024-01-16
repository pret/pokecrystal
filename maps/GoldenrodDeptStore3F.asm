	object_const_def
	const GOLDENRODDEPTSTORE3F_CLERK
	const GOLDENRODDEPTSTORE3F_SUPER_NERD
	const GOLDENRODDEPTSTORE3F_ROCKER

GoldenrodDeptStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_3F
	closetext
	end

GoldenrodDeptStore3FSuperNerdScript:
	jumptextfaceplayer GoldenrodDeptStore3FSuperNerdText

GoldenrodDeptStore3FRockerScript:
	jumptextfaceplayer GoldenrodDeptStore3FRockerText

GoldenrodDeptStore3FDirectory:
	jumptext GoldenrodDeptStore3FDirectoryText

GoldenrodDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore3FSuperNerdText:
	text "I, I, I'm really"
	line "sorry, RATTATA!"

	para "I gave her some"
	line "bitter medicine."
	
	para "It's effective,"
	line "but #MON"
	cont "don't like it."
	done

GoldenrodDeptStore3FRockerText:
	text "Hey! When you buy"
	line "healing items,"
	cont "do you buy"
	cont "herbs?"

	para "They're awesome."
	line "Cheap, but"
	cont "just as good"
	cont "as any potion."
	done

GoldenrodDeptStore3FDirectoryText:
	text "Brutally"
	line "Effective"

	para "3F"
	line "HERB SHOP"
	done

GoldenrodDeptStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, GOLDENROD_DEPT_STORE_2F, 1
	warp_event 15,  0, GOLDENROD_DEPT_STORE_4F, 2
	warp_event  2,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, GoldenrodDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStore3FElevatorButton

	def_object_events
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FClerkScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FSuperNerdScript, -1
	object_event  2,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FRockerScript, -1
