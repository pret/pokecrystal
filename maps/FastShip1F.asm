FastShip1F_MapScriptHeader: ; 0x75127
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x75135, $0000
	dw UnknownScript_0x75136, $0000
	dw UnknownScript_0x7513a, $0000

	; callback count
	db 0
; 0x75135

UnknownScript_0x75135: ; 0x75135
	end
; 0x75136

UnknownScript_0x75136: ; 0x75136
	priorityjump UnknownScript_0x7513b
	end
; 0x7513a

UnknownScript_0x7513a: ; 0x7513a
	end
; 0x7513b

UnknownScript_0x7513b: ; 0x7513b
	applymovement $2, MovementData_0x7520e
	applymovement $0, MovementData_0x75217
	applymovement $2, MovementData_0x75211
	pause 30
	playsound SFX_BOAT
	earthquake 30
	blackoutmod GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	clearevent $0031
	checkevent $0030
	iftrue UnknownScript_0x7515d
	dotrigger $2
	end
; 0x7515d

UnknownScript_0x7515d: ; 0x7515d
	dotrigger $0
	end
; 0x75160

SailorScript_0x75160: ; 0x75160
	faceplayer
	loadfont
	checkevent $0031
	iftrue UnknownScript_0x7517a
	checkevent $002f
	iftrue UnknownScript_0x75174
	writetext UnknownText_0x7523b
	closetext
	loadmovesprites
	end
; 0x75174

UnknownScript_0x75174: ; 0x75174
	writetext UnknownText_0x7529b
	closetext
	loadmovesprites
	end
; 0x7517a

UnknownScript_0x7517a: ; 0x7517a
	checkevent $002f
	iftrue UnknownScript_0x7519c
	writetext UnknownText_0x754be
	closetext
	loadmovesprites
	scall UnknownScript_0x751b8
	playsound SFX_EXIT_BUILDING
	special Function8c084
	waitbutton
	setevent $072b
	domaptrigger GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $1
	warp GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $7, $11
	end
; 0x7519c

UnknownScript_0x7519c: ; 0x7519c
	writetext UnknownText_0x7548d
	closetext
	loadmovesprites
	scall UnknownScript_0x751b8
	playsound SFX_EXIT_BUILDING
	special Function8c084
	waitbutton
	setevent $072a
	domaptrigger GROUP_OLIVINE_PORT, MAP_OLIVINE_PORT, $1
	warp GROUP_OLIVINE_PORT, MAP_OLIVINE_PORT, $7, $17
	end
; 0x751b8

UnknownScript_0x751b8: ; 0x751b8
	checkcode $9
	if_equal $3, UnknownScript_0x751c7
	applymovement $2, MovementData_0x7520e
	applymovement $0, MovementData_0x75235
	end
; 0x751c7

UnknownScript_0x751c7: ; 0x751c7
	applymovement $2, MovementData_0x75214
	applymovement $0, MovementData_0x75238
	end
; 0x751d0

SailorScript_0x751d0: ; 0x751d0
	faceplayer
	loadfont
	checkevent $0030
	iftrue UnknownScript_0x751de
	writetext UnknownText_0x752f9
	closetext
	loadmovesprites
	end
; 0x751de

UnknownScript_0x751de: ; 0x751de
	writetext UnknownText_0x7534f
	closetext
	loadmovesprites
	end
; 0x751e4

SailorScript_0x751e4: ; 0x751e4
	jumptextfaceplayer UnknownText_0x753c0
; 0x751e7

UnknownScript_0x751e7: ; 0x751e7
	moveperson $5, $14, $6
; 0x751eb

UnknownScript_0x751eb: ; 0x751eb
	appear $5
	applymovement $5, MovementData_0x7521b
	playsound SFX_TACKLE
	applymovement $0, MovementData_0x7522e
	applymovement $5, MovementData_0x75220
	loadfont
	writetext UnknownText_0x75412
	closetext
	loadmovesprites
	spriteface $0, $3
	applymovement $5, MovementData_0x75222
	disappear $5
	dotrigger $0
	end
; 0x7520e

MovementData_0x7520e: ; 0x7520e
	slow_step_left
	turn_head_right
	step_end
; 0x75211

MovementData_0x75211: ; 0x75211
	slow_step_right
	turn_head_down
	step_end
; 0x75214

MovementData_0x75214: ; 0x75214
	slow_step_down
	turn_head_up
	step_end
; 0x75217

MovementData_0x75217: ; 0x75217
	step_down
	step_down
	turn_head_down
	step_end
; 0x7521b

MovementData_0x7521b: ; 0x7521b
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x75220

MovementData_0x75220: ; 0x75220
	step_right
	step_end
; 0x75222

MovementData_0x75222: ; 0x75222
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
; 0x7522e

MovementData_0x7522e: ; 0x7522e
	big_step_right
	turn_head_left
	step_end
; 0x75231

MovementData_0x75231: ; 0x75231
	step_up
	step_end
; 0x75233

MovementData_0x75233: ; 0x75233
	step_down
	step_end
; 0x75235

MovementData_0x75235: ; 0x75235
	step_up
	step_up
	step_end
; 0x75238

MovementData_0x75238: ; 0x75238
	step_right
	step_up
	step_end
; 0x7523b

UnknownText_0x7523b: ; 0x7523b
	text "FAST SHIP S.S.AQUA"
	line "is en route to"
	cont "VERMILION CITY."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done
; 0x7529b

UnknownText_0x7529b: ; 0x7529b
	text "FAST SHIP S.S.AQUA"
	line "is en route to"
	cont "OLIVINE CITY."

	para "We will make an"
	line "announcement when"
	cont "we arrive."
	done
; 0x752f9

UnknownText_0x752f9: ; 0x752f9
	text "Here's your cabin."

	para "If your #MON"
	line "are hurt, take a"
	cont "nap in the bed."

	para "That will heal"
	line "them."
	done
; 0x7534f

UnknownText_0x7534f: ; 0x7534f
	text "Here's your cabin."

	para "You can heal your"
	line "#MON by taking"
	cont "a nap in the bed."

	para "The ship will"
	line "arrive while"
	cont "you're sleeping."
	done
; 0x753c0

UnknownText_0x753c0: ; 0x753c0
	text "The passengers are"
	line "all trainers."

	para "They're all itch-"
	line "ing to battle in"
	cont "their cabins."
	done
; 0x75412

UnknownText_0x75412: ; 0x75412
	text "Whoa! Excuse me."
	line "I was in a hurry!"

	para "My granddaughter"
	line "is missing!"

	para "She's just a wee"
	line "girl. If you see"

	para "her, please let me"
	line "know!"
	done
; 0x7548d

UnknownText_0x7548d: ; 0x7548d
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "OLIVINE CITY."
	done
; 0x754be

UnknownText_0x754be: ; 0x754be
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done
; 0x754f1

FastShip1F_MapEventHeader: ; 0x754f1
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
	person_event SPRITE_SAILOR, 6, 29, $6, $0, 255, 255, $0, 0, SailorScript_0x75160, $ffff
	person_event SPRITE_SAILOR, 11, 18, $9, $0, 255, 255, $0, 0, SailorScript_0x751d0, $ffff
	person_event SPRITE_SAILOR, 21, 26, $5, $2, 255, 255, $0, 0, SailorScript_0x751e4, $ffff
	person_event SPRITE_GENTLEMAN, 10, 23, $9, $0, 255, 255, $0, 0, ObjectEvent, $072c
; 0x75577
