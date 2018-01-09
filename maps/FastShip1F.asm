const_value set 2
	const FASTSHIP1F_SAILOR1
	const FASTSHIP1F_SAILOR2
	const FASTSHIP1F_SAILOR3
	const FASTSHIP1F_GENTLEMAN

FastShip1F_MapScriptHeader:
.SceneScripts:
	db 3
	scene_script .DummyScene0
	scene_script .EnterFastShip
	scene_script .DummyScene2

.MapCallbacks:
	db 0

.DummyScene0:
	end

.EnterFastShip:
	priorityjump .EnterFastShipScript
	end

.DummyScene2:
	end

.EnterFastShipScript:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75217
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75211
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod FAST_SHIP_CABINS_SW_SSW_NW
	clearevent EVENT_FAST_SHIP_HAS_ARRIVED
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .SkipGrandpa
	setscene 2
	end

.SkipGrandpa:
	setscene 0
	end

SailorScript_0x75160:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .Arrived
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .Olivine
	writetext UnknownText_0x7523b
	waitbutton
	closetext
	end

.Olivine:
	writetext UnknownText_0x7529b
	waitbutton
	closetext
	end

.Arrived:
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue ._Olivine
	writetext UnknownText_0x754be
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene VERMILION_PORT, 1
	warp VERMILION_PORT, 7, 17
	end

._Olivine:
	writetext UnknownText_0x7548d
	waitbutton
	closetext
	scall .LetThePlayerOut
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	setevent EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	setmapscene OLIVINE_PORT, 1
	warp OLIVINE_PORT, 7, 23
	end

.LetThePlayerOut:
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x7520e
	applymovement PLAYER, MovementData_0x75235
	end

.YouAreFacingRight:
	applymovement FASTSHIP1F_SAILOR1, MovementData_0x75214
	applymovement PLAYER, MovementData_0x75238
	end

SailorScript_0x751d0:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Vermilion
	writetext UnknownText_0x752f9
	waitbutton
	closetext
	end

.Vermilion:
	writetext UnknownText_0x7534f
	waitbutton
	closetext
	end

FastShip1FSailorScript:
	jumptextfaceplayer FastShip1FSailorText

WorriedGrandpaSceneRight:
	moveobject FASTSHIP1F_GENTLEMAN, 20, 6

WorriedGrandpaSceneLeft:
	appear FASTSHIP1F_GENTLEMAN
	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x7521b
	playsound SFX_TACKLE
	applymovement PLAYER, MovementData_0x7522e
	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x75220
	opentext
	writetext UnknownText_0x75412
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement FASTSHIP1F_GENTLEMAN, MovementData_0x75222
	disappear FASTSHIP1F_GENTLEMAN
	setscene 0
	end

MovementData_0x7520e:
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_0x75211:
	slow_step RIGHT
	turn_head DOWN
	step_end

MovementData_0x75214:
	slow_step DOWN
	turn_head UP
	step_end

MovementData_0x75217:
	step DOWN
	step DOWN
	turn_head DOWN
	step_end

MovementData_0x7521b:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x75220:
	step RIGHT
	step_end

MovementData_0x75222:
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x7522e:
	big_step RIGHT
	turn_head LEFT
	step_end

MovementData_0x75231:
	step UP
	step_end

MovementData_0x75233:
	step DOWN
	step_end

MovementData_0x75235:
	step UP
	step UP
	step_end

MovementData_0x75238:
	step RIGHT
	step UP
	step_end

UnknownText_0x7523b:
	text "FAST SHIP S.S.AQUA"
	line "is en route to"
	cont "VERMILION CITY."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done

UnknownText_0x7529b:
	text "FAST SHIP S.S.AQUA"
	line "is en route to"
	cont "OLIVINE CITY."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done

UnknownText_0x752f9:
	text "Here's your cabin."

	para "If your #MON"
	line "are hurt, take a"
	cont "nap in the bed."

	para "That will heal"
	line "them."
	done

UnknownText_0x7534f:
	text "Here's your cabin."

	para "You can heal your"
	line "#MON by taking"
	cont "a nap in the bed."

	para "The ship will"
	line "arrive while"
	cont "you're sleeping."
	done

FastShip1FSailorText:
	text "The passengers are"
	line "all trainers."

	para "They're all itch-"
	line "ing to battle in"
	cont "their cabins."
	done

UnknownText_0x75412:
	text "Whoa! Excuse me."
	line "I was in a hurry!"

	para "My granddaughter"
	line "is missing!"

	para "She's just a wee"
	line "girl. If you see"

	para "her, please let me"
	line "know!"
	done

UnknownText_0x7548d:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "OLIVINE CITY."
	done

UnknownText_0x754be:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done

FastShip1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 12
	warp_def 25, 1, -1, FAST_SHIP_1F
	warp_def 27, 8, 1, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def 23, 8, 2, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def 19, 8, 3, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def 15, 8, 1, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def 15, 15, 2, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def 19, 15, 4, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def 23, 15, 1, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def 27, 15, 3, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def 3, 13, 5, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def 6, 12, 1, FAST_SHIP_B1F
	warp_def 30, 14, 2, FAST_SHIP_B1F

.CoordEvents:
	db 2
	coord_event 24, 6, 2, WorriedGrandpaSceneLeft
	coord_event 25, 6, 2, WorriedGrandpaSceneRight

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event 25, 2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SailorScript_0x75160, -1
	object_event 14, 7, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SailorScript_0x751d0, -1
	object_event 22, 17, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FastShip1FSailorScript, -1
	object_event 19, 6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FAST_SHIP_1F_GENTLEMAN
