PowerPlant_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x188dc3, $0000
	dw UnknownScript_0x188dc4, $0000

.MapCallbacks:
	db 0

UnknownScript_0x188dc3:
	end

UnknownScript_0x188dc4:
	end

UnknownScript_0x188dc5:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, $2, 15
	waitbutton
	pause 30
	applymovement $2, MovementData_0x188ed5
	spriteface $3, DOWN
	spriteface $4, DOWN
	loadfont
	writetext UnknownText_0x188f22
	closetext
	loadmovesprites
	spriteface $2, LEFT
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x188f7f
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $2, MovementData_0x188eda
	dotrigger $0
	end

OfficerScript_0x188df5:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e0f
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue UnknownScript_0x188e09
	writetext UnknownText_0x188ee0
	closetext
	loadmovesprites
	end

UnknownScript_0x188e09:
	writetext UnknownText_0x188f7f
	closetext
	loadmovesprites
	end

UnknownScript_0x188e0f:
	writetext UnknownText_0x188fa2
	closetext
	loadmovesprites
	end

GymGuyScript_0x188e15:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e23
	writetext UnknownText_0x188fcf
	closetext
	loadmovesprites
	end

UnknownScript_0x188e23:
	writetext UnknownText_0x189038
	closetext
	loadmovesprites
	end

GymGuyScript_0x188e29:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e37
	writetext UnknownText_0x189079
	closetext
	loadmovesprites
	end

UnknownScript_0x188e37:
	writetext UnknownText_0x1890ef
	closetext
	loadmovesprites
	end

OfficerScript_0x188e3d:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e4b
	writetext UnknownText_0x18910e
	closetext
	loadmovesprites
	end

UnknownScript_0x188e4b:
	writetext UnknownText_0x18917f
	closetext
	loadmovesprites
	end

GymGuyScript_0x188e51:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188e5f
	writetext UnknownText_0x1891c2
	closetext
	loadmovesprites
	end

UnknownScript_0x188e5f:
	writetext UnknownText_0x189225
	closetext
	loadmovesprites
	end

PowerPlantManager:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188eac
	checkitem MACHINE_PART
	iftrue UnknownScript_0x188e93
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue UnknownScript_0x188e8d
	writetext UnknownText_0x189264
	closetext
	loadmovesprites
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	domaptrigger GROUP_CERULEAN_GYM, MAP_CERULEAN_GYM, $1
	dotrigger $1
	end

UnknownScript_0x188e8d:
	writetext UnknownText_0x189308
	closetext
	loadmovesprites
	end

UnknownScript_0x188e93:
	writetext UnknownText_0x18936e
	keeptextopen
	takeitem MACHINE_PART, 1
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
	keeptextopen
	verbosegiveitem TM_ZAP_CANNON, 1
	iffalse UnknownScript_0x188ec3
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext UnknownText_0x1893f4
	closetext
UnknownScript_0x188ec3:
	loadmovesprites
	end

UnknownScript_0x188ec5:
	writetext UnknownText_0x189475
	closetext
	loadmovesprites
	end

GymGuyScript_0x188ecb:
	faceplayer
	loadfont
	trade $6
	closetext
	loadmovesprites
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

MovementData_0x188ed5:
	step_right
	step_right
	step_up
	step_up
	step_end

MovementData_0x188eda:
	step_down
	step_down
	step_left
	step_left
	turn_head_down
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
	warp_def $11, $2, 2, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $11, $3, 2, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH

.XYTriggers:
	db 1
	xy_trigger 1, $c, $5, $0, UnknownScript_0x188dc5, $0, $0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, PowerPlantBookshelf
	signpost 1, 1, SIGNPOST_READ, PowerPlantBookshelf

.PersonEvents:
	db 7
	person_event SPRITE_OFFICER, 18, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, OfficerScript_0x188df5, -1
	person_event SPRITE_GYM_GUY, 13, 6, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GymGuyScript_0x188e15, -1
	person_event SPRITE_GYM_GUY, 15, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GymGuyScript_0x188e29, -1
	person_event SPRITE_OFFICER, 7, 13, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, OfficerScript_0x188e3d, -1
	person_event SPRITE_GYM_GUY, 6, 11, OW_UP | $1, $1, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GymGuyScript_0x188e51, -1
	person_event SPRITE_FISHER, 14, 18, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PowerPlantManager, -1
	person_event SPRITE_GYM_GUY, 9, 9, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GymGuyScript_0x188ecb, -1
