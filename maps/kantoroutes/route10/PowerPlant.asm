const_value set 2
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_FISHER
	const POWERPLANT_FOREST

PowerPlant_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x188dc3, 0
	dw UnknownScript_0x188dc4, 0

.MapCallbacks:
	db 0

UnknownScript_0x188dc3:
	end

UnknownScript_0x188dc4:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, MovementData_0x188ed5
	spriteface POWERPLANT_GYM_GUY1, DOWN
	spriteface POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext UnknownText_0x188f22
	waitbutton
	closetext
	spriteface POWERPLANT_OFFICER1, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext UnknownText_0x188f7f
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, MovementData_0x188eda
	dotrigger $0
	end

OfficerScript_0x188df5:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e0f
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue UnknownScript_0x188e09
	writetext UnknownText_0x188ee0
	waitbutton
	closetext
	end

UnknownScript_0x188e09:
	writetext UnknownText_0x188f7f
	waitbutton
	closetext
	end

UnknownScript_0x188e0f:
	writetext UnknownText_0x188fa2
	waitbutton
	closetext
	end

GymGuyScript_0x188e15:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e23
	writetext UnknownText_0x188fcf
	waitbutton
	closetext
	end

UnknownScript_0x188e23:
	writetext UnknownText_0x189038
	waitbutton
	closetext
	end

GymGuyScript_0x188e29:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e37
	writetext UnknownText_0x189079
	waitbutton
	closetext
	end

UnknownScript_0x188e37:
	writetext UnknownText_0x1890ef
	waitbutton
	closetext
	end

OfficerScript_0x188e3d:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e4b
	writetext UnknownText_0x18910e
	waitbutton
	closetext
	end

UnknownScript_0x188e4b:
	writetext UnknownText_0x18917f
	waitbutton
	closetext
	end

GymGuyScript_0x188e51:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e5f
	writetext UnknownText_0x1891c2
	waitbutton
	closetext
	end

UnknownScript_0x188e5f:
	writetext UnknownText_0x189225
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188eac
	checkitem MACHINE_PART
	iftrue UnknownScript_0x188e93
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue UnknownScript_0x188e8d
	writetext UnknownText_0x189264
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	domaptrigger CERULEAN_GYM, $1
	dotrigger $1
	end

UnknownScript_0x188e8d:
	writetext UnknownText_0x189308
	waitbutton
	closetext
	end

UnknownScript_0x188e93:
	writetext UnknownText_0x18936e
	buttonsound
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
UnknownScript_0x188eac:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue UnknownScript_0x188ec5
	writetext UnknownText_0x1893c4
	buttonsound
	verbosegiveitem TM_ZAP_CANNON
	iffalse UnknownScript_0x188ec3
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext UnknownText_0x1893f4
	waitbutton
UnknownScript_0x188ec3:
	closetext
	end

UnknownScript_0x188ec5:
	writetext UnknownText_0x189475
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade $6
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

MovementData_0x188ed5:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x188eda:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

UnknownText_0x188ee0:
	text "A thief broke into"
	line "the POWER PLANT…"

	para "What is the world"
	line "coming to?"
	done

UnknownText_0x188f22:
	text "I just got word"
	line "from CERULEAN."

	para "It appears that a"
	line "shady character"

	para "has been loitering"
	line "around."
	done

UnknownText_0x188f7f:
	text "Could I ask for"
	line "your cooperation?"
	done

UnknownText_0x188fa2:
	text "We'll have to beef"
	line "up our security"
	cont "presence."
	done

UnknownText_0x188fcf:
	text "Someone made off"
	line "with a part that's"

	para "essential for the"
	line "generator."

	para "Without it, the"
	line "new generator's"
	cont "useless!"
	done

UnknownText_0x189038:
	text "The generator's up"
	line "and running. It's"

	para "making electricity"
	line "to spare."
	done

UnknownText_0x189079:
	text "This POWER PLANT"
	line "had been abandoned"
	cont "in the past."

	para "We got it back up"
	line "and running to"

	para "provide power to"
	line "the MAGNET TRAIN."
	done

UnknownText_0x1890ef:
	text "The generator's"
	line "running again!"
	done

UnknownText_0x18910e:
	text "The POWER PLANT's"
	line "MANAGER is up"
	cont "ahead."

	para "But since someone"
	line "wrecked the gener-"
	cont "ator, he's been"
	cont "both sad and"
	cont "furious…"
	done

UnknownText_0x18917f:
	text "Since the gener-"
	line "ator's been fixed,"

	para "the MANAGER has"
	line "been cheerful."
	done

UnknownText_0x1891c2:
	text "The MAGNET TRAIN"
	line "consumes a lot of"
	cont "electricity."

	para "It can't move if"
	line "the new generator"
	cont "isn't operating."
	done

UnknownText_0x189225:
	text "All right! We can"
	line "finally get the"

	para "MAGNET TRAIN"
	line "running again."
	done

UnknownText_0x189264:
	text "MANAGER: I, I, I'm"
	line "ready to blast"
	cont "someone!"

	para "Who would dare"
	line "ruin my generator?"

	para "I spent so much"
	line "time on it!"

	para "If I catch him,"
	line "he's going to get"

	para "a taste of my ZAP"
	line "CANNON!"
	done

UnknownText_0x189308:
	text "MANAGER: I won't"
	line "forgive him!"

	para "The culprit can"
	line "cry and apologize,"

	para "but I'll still"
	line "hammer him!"

	para "Gahahahah!"
	done

UnknownText_0x18936e:
	text "MANAGER: Ah! Yeah!"

	para "That's the missing"
	line "PART from my be-"
	cont "loved generator!"
	cont "You found it?"
	done

UnknownText_0x1893c4:
	text "Wahah! Thanks!"

	para "Here! Take this TM"
	line "as a reward!"
	done

UnknownText_0x1893f4:
	text "MANAGER: TM07 is"
	line "my ZAP CANNON."

	para "It's a powerful"
	line "technique!"

	para "It's not what any-"
	line "one would consider"

	para "accurate, but it"
	line "packs a wallop!"
	done

UnknownText_0x189475:
	text "MANAGER: My be-"
	line "loved generator!"

	para "Keep pumping the"
	line "electricity out!"
	done

PowerPlant_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $2, 2, ROUTE_10_NORTH
	warp_def $11, $3, 2, ROUTE_10_NORTH

.XYTriggers:
	db 1
	xy_trigger 1, $c, $5, $0, PowerPlantGuardPhoneScript, $0, $0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, PowerPlantBookshelf
	signpost 1, 1, SIGNPOST_READ, PowerPlantBookshelf

.PersonEvents:
	db 7
	person_event SPRITE_OFFICER, 14, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x188df5, -1
	person_event SPRITE_GYM_GUY, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x188e15, -1
	person_event SPRITE_GYM_GUY, 11, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x188e29, -1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x188e3d, -1
	person_event SPRITE_GYM_GUY, 2, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x188e51, -1
	person_event SPRITE_FISHER, 10, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PowerPlantManager, -1
	person_event SPRITE_GYM_GUY, 5, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Forest, -1
