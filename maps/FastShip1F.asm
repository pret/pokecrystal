const_value set 2
	const FASTSHIP1F_SAILOR1
	const FASTSHIP1F_SAILOR2
	const FASTSHIP1F_SAILOR3
	const FASTSHIP1F_GENTLEMAN

FastShip1F_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 0

.Trigger0:
	end

.Trigger1:
	priorityjump .PriorityJump2
	end

.Trigger2:
	end

.PriorityJump2:
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
	dotrigger $2
	end

.SkipGrandpa:
	dotrigger $0
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
	domaptrigger VERMILION_PORT, $1
	warp VERMILION_PORT, $7, $11
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
	domaptrigger OLIVINE_PORT, $1
	warp OLIVINE_PORT, $7, $17
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

SailorScript_0x751e4:
	jumptextfaceplayer UnknownText_0x753c0

WorriedGrandpaTriggerRight:
	moveperson FASTSHIP1F_GENTLEMAN, $14, $6

WorriedGrandpaTriggerLeft:
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
	dotrigger $0
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

UnknownText_0x753c0:
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
	warp_def $1, $19, -1, FAST_SHIP_1F
	warp_def $8, $1b, 1, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $17, 2, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $13, 3, FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $f, 1, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $f, 2, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $13, 4, FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $17, 1, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $f, $1b, 3, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $d, $3, 5, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $c, $6, 1, FAST_SHIP_B1F
	warp_def $e, $1e, 2, FAST_SHIP_B1F

.XYTriggers:
	db 2
	xy_trigger 2, $6, $18, $0, WorriedGrandpaTriggerLeft, $0, $0
	xy_trigger 2, $6, $19, $0, WorriedGrandpaTriggerRight, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_SAILOR, 2, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x75160, -1
	person_event SPRITE_SAILOR, 7, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x751d0, -1
	person_event SPRITE_SAILOR, 17, 22, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SailorScript_0x751e4, -1
	person_event SPRITE_GENTLEMAN, 6, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FAST_SHIP_1F_GENTLEMAN
