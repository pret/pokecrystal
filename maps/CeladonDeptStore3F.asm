	object_const_def
	const CELADONDEPTSTORE3F_CLERK
	const CELADONDEPTSTORE3F_YOUNGSTER
	const CELADONDEPTSTORE3F_GAMEBOY_KID1
	const CELADONDEPTSTORE3F_GAMEBOY_KID2
	const CELADONDEPTSTORE3F_SUPER_NERD

CeladonDeptStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_3F
	closetext
	end

CeladonDeptStore3FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore3FYoungsterText

CeladonDeptStore3FGameboyKid1Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid1Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID1, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid2Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID2, DOWN
	end

CeladonDeptStore3FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore3FSuperNerdText

CeladonDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

CeladonDeptStore3FDirectory:
	jumptext CeladonDeptStore3FDirectoryText

CeladonDeptStore3FYoungsterText:
	text "I can't decide"
	line "which #MON I"

	para "should use this TM"
	line "on…"

	para "Lucky for me,"
	line "it's reusable!"
	done

CeladonDeptStore3FGameboyKid1Text:
	text "Uh-oh! I traded my"
	line "#MON without"

	para "removing the UP-"
	line "GRADE from it."
	done

CeladonDeptStore3FGameboyKid2Text:
	text "Yeah! I'm finally"
	line "getting a PORYGON!"

	para "I'm no good at the"
	line "slots, so I could"

	para "never get enough"
	line "coins…"

	para "…Huh?"

	para "The traded PORYGON"
	line "turned into a dif-"
	cont "ferent #MON!"
	done

CeladonDeptStore3FSuperNerdText:
	text "The TM SHOP sells"
	line "some rare moves."
	done

CeladonDeptStore3FDirectoryText:
	text "3F: TM SHOP"

	para "Make Your #MON"
	line "Stronger!"
	done

CeladonDeptStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 15,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore3FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore3FElevatorButton

	def_object_events
	object_event  7,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerkScript, -1
	object_event  6,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FYoungsterScript, -1
	object_event  9,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event 10,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1
	object_event 13,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSuperNerdScript, -1
