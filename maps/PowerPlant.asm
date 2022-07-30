	object_const_def
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUIDE1
	const POWERPLANT_GYM_GUIDE2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUIDE3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script PowerPlantNoop1Scene, SCENE_POWERPLANT_NOOP
	scene_script PowerPlantNoop2Scene, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks

PowerPlantNoop1Scene:
	end

PowerPlantNoop2Scene:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuide2Movement
	turnobject POWERPLANT_GYM_GUIDE1, DOWN
	turnobject POWERPLANT_GYM_GUIDE2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOOP
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuide1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuide2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuide4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlantOfficer1ApproachGymGuide2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "A thief broke into"
	line "the POWER PLANT…"

	para "What is the world"
	line "coming to?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "I just got word"
	line "from CERULEAN."

	para "It appears that a"
	line "shady character"

	para "has been loitering"
	line "around."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Could I ask for"
	line "your cooperation?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "We'll have to beef"
	line "up our security"
	cont "presence."
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Someone made off"
	line "with a part that's"

	para "essential for the"
	line "generator."

	para "Without it, the"
	line "new generator's"
	cont "useless!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "The generator's up"
	line "and running. It's"

	para "making electricity"
	line "to spare."
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "This POWER PLANT"
	line "had been abandoned"
	cont "in the past."

	para "We got it back up"
	line "and running to"

	para "provide power to"
	line "the MAGNET TRAIN."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "The generator's"
	line "running again!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "The POWER PLANT's"
	line "MANAGER is up"
	cont "ahead."

	para "But since someone"
	line "wrecked the gener-"
	cont "ator, he's been"
	cont "both sad and"
	cont "furious…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Since the gener-"
	line "ator's been fixed,"

	para "the MANAGER has"
	line "been cheerful."
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "The MAGNET TRAIN"
	line "consumes a lot of"
	cont "electricity."

	para "It can't move if"
	line "the new generator"
	cont "isn't operating."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "All right! We can"
	line "finally get the"

	para "MAGNET TRAIN"
	line "running again."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
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

PowerPlantManagerIWontForgiveCulpritText:
	text "MANAGER: I won't"
	line "forgive him!"

	para "The culprit can"
	line "cry and apologize,"

	para "but I'll still"
	line "hammer him!"

	para "Gahahahah!"
	done

PowerPlantManagerThatsThePartText:
	text "MANAGER: Ah! Yeah!"

	para "That's the missing"
	line "PART from my be-"
	cont "loved generator!"
	cont "You found it?"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Thanks!"

	para "Here! Take this TM"
	line "as a reward!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "MANAGER: TM07 is"
	line "my ZAP CANNON."

	para "It's a powerful"
	line "technique!"

	para "It's not what any-"
	line "one would consider"

	para "accurate, but it"
	line "packs a wallop!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "MANAGER: My be-"
	line "loved generator!"

	para "Keep pumping the"
	line "electricity out!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	def_object_events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  6, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
