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
	playsound $001c
	earthquake 30
	blackoutmod GROUP_FAST_SHIP_CABINS_SW_SSW_NW, MAP_FAST_SHIP_CABINS_SW_SSW_NW
	clearbit1 $0031
	checkbit1 $0030
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
	checkbit1 $0031
	iftrue UnknownScript_0x7517a
	checkbit1 $002f
	iftrue UnknownScript_0x75174
	2writetext UnknownText_0x7523b
	closetext
	loadmovesprites
	end
; 0x75174

UnknownScript_0x75174: ; 0x75174
	2writetext UnknownText_0x7529b
	closetext
	loadmovesprites
	end
; 0x7517a

UnknownScript_0x7517a: ; 0x7517a
	checkbit1 $002f
	iftrue UnknownScript_0x7519c
	2writetext UnknownText_0x754be
	closetext
	loadmovesprites
	2call UnknownScript_0x751b8
	playsound $0023
	special $002e
	waitbutton
	setbit1 $072b
	domaptrigger GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $1
	warp GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $7, $11
	end
; 0x7519c

UnknownScript_0x7519c: ; 0x7519c
	2writetext UnknownText_0x7548d
	closetext
	loadmovesprites
	2call UnknownScript_0x751b8
	playsound $0023
	special $002e
	waitbutton
	setbit1 $072a
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
	checkbit1 $0030
	iftrue UnknownScript_0x751de
	2writetext UnknownText_0x752f9
	closetext
	loadmovesprites
	end
; 0x751de

UnknownScript_0x751de: ; 0x751de
	2writetext UnknownText_0x7534f
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
	playsound $0041
	applymovement $0, MovementData_0x7522e
	applymovement $5, MovementData_0x75220
	loadfont
	2writetext UnknownText_0x75412
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
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "is en route to", $55
	db "VERMILION CITY.", $51
	db "We will make an", $4f
	db "announcement when", $55
	db "we arrive.", $57
; 0x7529b

UnknownText_0x7529b: ; 0x7529b
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "is en route to", $55
	db "OLIVINE CITY.", $51
	db "We will make an", $4f
	db "announcement when", $55
	db "we arrive.", $57
; 0x752f9

UnknownText_0x752f9: ; 0x752f9
	db $0, "Here's your cabin.", $51
	db "If your #MON", $4f
	db "are hurt, take a", $55
	db "nap in the bed.", $51
	db "That will heal", $4f
	db "them.", $57
; 0x7534f

UnknownText_0x7534f: ; 0x7534f
	db $0, "Here's your cabin.", $51
	db "You can heal your", $4f
	db "#MON by taking", $55
	db "a nap in the bed.", $51
	db "The ship will", $4f
	db "arrive while", $55
	db "you're sleeping.", $57
; 0x753c0

UnknownText_0x753c0: ; 0x753c0
	db $0, "The passengers are", $4f
	db "all trainers.", $51
	db "They're all itch-", $4f
	db "ing to battle in", $55
	db "their cabins.", $57
; 0x75412

UnknownText_0x75412: ; 0x75412
	db $0, "Whoa! Excuse me.", $4f
	db "I was in a hurry!", $51
	db "My granddaughter", $4f
	db "is missing!", $51
	db "She's just a wee", $4f
	db "girl. If you see", $51
	db "her, please let me", $4f
	db "know!", $57
; 0x7548d

UnknownText_0x7548d: ; 0x7548d
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "has arrived in", $55
	db "OLIVINE CITY.", $57
; 0x754be

UnknownText_0x754be: ; 0x754be
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "has arrived in", $55
	db "VERMILION CITY.", $57
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

