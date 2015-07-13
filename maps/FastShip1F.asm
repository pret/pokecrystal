FastShip1F_MapScriptHeader:
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x75135, $0000
	dw UnknownScript_0x75136, $0000
	dw UnknownScript_0x7513a, $0000

	; callback count
	db 0

UnknownScript_0x75135:
	end

UnknownScript_0x75136:
	priorityjump UnknownScript_0x7513b
	end

UnknownScript_0x7513a:
	end

UnknownScript_0x7513b:
	applymovement $2, MovementData_0x7520e
	applymovement $0, MovementData_0x75217
	applymovement $2, MovementData_0x75211
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	clearevent EVENT_031
	checkevent EVENT_030
	iftrue UnknownScript_0x7515d
	dotrigger $2
	end

UnknownScript_0x7515d:
	dotrigger $0
	end

SailorScript_0x75160:
	faceplayer
	loadfont
	checkevent EVENT_031
	iftrue UnknownScript_0x7517a
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .Olivine
	writetext UnknownText_0x7523b
	closetext
	loadmovesprites
	end

.Olivine
	writetext UnknownText_0x7529b
	closetext
	loadmovesprites
	end

UnknownScript_0x7517a:
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .Olivine
	writetext UnknownText_0x754be
	closetext
	loadmovesprites
	scall UnknownScript_0x751b8
	playsound SFX_EXIT_BUILDING
	special Function8c084
	waitbutton
	setevent EVENT_72B
	domaptrigger GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $1
	warp GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $7, $11
	end

.Olivine
	writetext UnknownText_0x7548d
	closetext
	loadmovesprites
	scall UnknownScript_0x751b8
	playsound SFX_EXIT_BUILDING
	special Function8c084
	waitbutton
	setevent EVENT_72A
	domaptrigger GROUP_OLIVINE_PORT, MAP_OLIVINE_PORT, $1
	warp GROUP_OLIVINE_PORT, MAP_OLIVINE_PORT, $7, $17
	end

UnknownScript_0x751b8:
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x751c7
	applymovement $2, MovementData_0x7520e
	applymovement $0, MovementData_0x75235
	end

UnknownScript_0x751c7:
	applymovement $2, MovementData_0x75214
	applymovement $0, MovementData_0x75238
	end

SailorScript_0x751d0:
	faceplayer
	loadfont
	checkevent EVENT_030
	iftrue UnknownScript_0x751de
	writetext UnknownText_0x752f9
	closetext
	loadmovesprites
	end

UnknownScript_0x751de:
	writetext UnknownText_0x7534f
	closetext
	loadmovesprites
	end

SailorScript_0x751e4:
	jumptextfaceplayer UnknownText_0x753c0

UnknownScript_0x751e7:
	moveperson $5, $14, $6

UnknownScript_0x751eb:
	appear $5
	applymovement $5, MovementData_0x7521b
	playsound SFX_TACKLE
	applymovement $0, MovementData_0x7522e
	applymovement $5, MovementData_0x75220
	loadfont
	writetext UnknownText_0x75412
	closetext
	loadmovesprites
	spriteface $0, RIGHT
	applymovement $5, MovementData_0x75222
	disappear $5
	dotrigger $0
	end

MovementData_0x7520e:
	slow_step_left
	turn_head_right
	step_end

MovementData_0x75211:
	slow_step_right
	turn_head_down
	step_end

MovementData_0x75214:
	slow_step_down
	turn_head_up
	step_end

MovementData_0x75217:
	step_down
	step_down
	turn_head_down
	step_end

MovementData_0x7521b:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x75220:
	step_right
	step_end

MovementData_0x75222:
	big_step_down
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x7522e:
	big_step_right
	turn_head_left
	step_end

MovementData_0x75231:
	step_up
	step_end

MovementData_0x75233:
	step_down
	step_end

MovementData_0x75235:
	step_up
	step_up
	step_end

MovementData_0x75238:
	step_right
	step_up
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

	; warps
	db 12
	warp_def $1, $19, 255, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $8, $1b, 1, GROUP_FAST_SHIP_CABINS_NNW_NNE_NE, MAP_FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $17, 2, GROUP_FAST_SHIP_CABINS_NNW_NNE_NE, MAP_FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $13, 3, GROUP_FAST_SHIP_CABINS_NNW_NNE_NE, MAP_FAST_SHIP_CABINS_NNW_NNE_NE
	warp_def $8, $f, 1, GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $f, 2, GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $13, 4, GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	warp_def $f, $17, 1, GROUP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, MAP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $f, $1b, 3, GROUP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, MAP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $d, $3, 5, GROUP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, MAP_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN
	warp_def $c, $6, 1, GROUP_FAST_SHIP_B1F, MAP_FAST_SHIP_B1F
	warp_def $e, $1e, 2, GROUP_FAST_SHIP_B1F, MAP_FAST_SHIP_B1F

	; xy triggers
	db 2
	xy_trigger 2, $6, $18, $0, UnknownScript_0x751eb, $0, $0
	xy_trigger 2, $6, $19, $0, UnknownScript_0x751e7, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_SAILOR, 6, 29, $6, $0, 255, 255, $0, 0, SailorScript_0x75160, -1
	person_event SPRITE_SAILOR, 11, 18, $9, $0, 255, 255, $0, 0, SailorScript_0x751d0, -1
	person_event SPRITE_SAILOR, 21, 26, $5, $2, 255, 255, $0, 0, SailorScript_0x751e4, -1
	person_event SPRITE_GENTLEMAN, 10, 23, $9, $0, 255, 255, $0, 0, ObjectEvent, EVENT_72C
