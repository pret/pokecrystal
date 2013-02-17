VioletCity_MapScriptHeader: ; 0x1a83b2
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a83b7
; 0x1a83b7

UnknownScript_0x1a83b7: ; 0x1a83b7
	setbit2 $0043
	return
; 0x1a83bb

UnknownScript_0x1a83bb: ; 0x1a83bb
	applymovement $2, MovementData_0x1a8465
	faceplayer
	loadfont
	2writetext UnknownText_0x1a8473
	yesorno
	iffalse UnknownScript_0x1a83d1
	2jump UnknownScript_0x1a83cb
; 0x1a83cb

UnknownScript_0x1a83cb: ; 0x1a83cb
	2writetext UnknownText_0x1a84ac
	closetext
	loadmovesprites
	end
; 0x1a83d1

UnknownScript_0x1a83d1: ; 0x1a83d1
	2writetext UnknownText_0x1a84cb
	closetext
	loadmovesprites
	playmusic $0011
	follow $2, $0
	applymovement $2, MovementData_0x1a842a
	spriteface $0, $1
	applymovement $2, MovementData_0x1a8465
	stopfollow
	special $003d
	loadfont
	2writetext UnknownText_0x1a84f9
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a8465
	applymovement $2, MovementData_0x1a8463
	playsound $001f
	disappear $2
	clearbit1 $06cb
	waitbutton
	end
; 0x1a8403

UnknownScript_0x1a8403: ; 0x1a8403
	jumptextfaceplayer UnknownText_0x1a8529
; 0x1a8406

UnknownScript_0x1a8406: ; 0x1a8406
	jumptextfaceplayer UnknownText_0x1a8593
; 0x1a8409

UnknownScript_0x1a8409: ; 0x1a8409
	jumptextfaceplayer UnknownText_0x1a85ef
; 0x1a840c

UnknownScript_0x1a840c: ; 0x1a840c
	jumptextfaceplayer UnknownText_0x1a8665
; 0x1a840f

MapVioletCitySignpost0Script: ; 0x1a840f
	jumptext UnknownText_0x1a86b2
; 0x1a8412

MapVioletCitySignpost1Script: ; 0x1a8412
	jumptext UnknownText_0x1a86dc
; 0x1a8415

MapVioletCitySignpost2Script: ; 0x1a8415
	jumptext UnknownText_0x1a8724
; 0x1a8418

MapVioletCitySignpost3Script: ; 0x1a8418
	jumptext UnknownText_0x1a874d
; 0x1a841b

MapVioletCitySignpost4Script: ; 0x1a841b
	jumpstd $0010
; 0x1a841e

MapVioletCitySignpost5Script: ; 0x1a841e
	jumpstd $0011
; 0x1a8421

ItemFragment_0x1a8421: ; 0x1a8421
	db PP_UP, 1
; 0x1a8423

ItemFragment_0x1a8423: ; 0x1a8423
	db RARE_CANDY, 1
; 0x1a8425

UnknownScript_0x1a8425: ; 0x1a8425
	fruittree $9
; 0x1a8427

MapVioletCitySignpostItem6: ; 0x1a8427
	dw $00b0
	db HYPER_POTION
	
; 0x1a842a

MovementData_0x1a842a: ; 0x1a842a
	big_step_down
	big_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	big_step_down
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	big_step_up
	turn_head_down
	step_end
; 0x1a8463

MovementData_0x1a8463: ; 0x1a8463
	step_up
	step_end
; 0x1a8465

MovementData_0x1a8465: ; 0x1a8465
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
; 0x1a8473

UnknownText_0x1a8473: ; 0x1a8473
	db $0, "Hello!", $4f
	db "You are trainer?", $51
	db "Battle GYM LEADER,", $4f
	db "win you did?", $57
; 0x1a84ac

UnknownText_0x1a84ac: ; 0x1a84ac
	db $0, "Ooh, la la!", $4f
	db "Very indeed nice!", $57
; 0x1a84cb

UnknownText_0x1a84cb: ; 0x1a84cb
	db $0, "Is that so? Then", $4f
	db "study shall you!", $55
	db "Follow me!", $57
; 0x1a84f9

UnknownText_0x1a84f9: ; 0x1a84f9
	db $0, "Here, teacher I", $4f
	db "am. Good it is", $55
	db "you study here!", $57
; 0x1a8529

UnknownText_0x1a8529: ; 0x1a8529
	db $0, "Ghosts are rumored", $4f
	db "to appear in", $55
	db "SPROUT TOWER.", $51
	db "They said normal-", $4f
	db "type #MON moves", $51
	db "had no effect on", $4f
	db "ghosts.", $57
; 0x1a8593

UnknownText_0x1a8593: ; 0x1a8593
	db $0, "Hey, you're a", $4f
	db "#MON trainer?", $51
	db "If you beat the", $4f
	db "GYM LEADER here,", $51
	db "you'll be ready", $4f
	db "for prime time!", $57
; 0x1a85ef

UnknownText_0x1a85ef: ; 0x1a85ef
	db $0, "FALKNER, from the", $4f
	db "VIOLET #MON", $51
	db "GYM, is a fine", $4f
	db "trainer!", $51
	db "He inherited his", $4f
	db "father's gym and", $51
	db "has done a great", $4f
	db "job with it.", $57
; 0x1a8665

UnknownText_0x1a8665: ; 0x1a8665
	db $0, "I saw a wiggly", $4f
	db "tree up ahead!", $51
	db "If you touch it,", $4f
	db "it squirms and", $55
	db "dances! Cool!", $57
; 0x1a86b2

UnknownText_0x1a86b2: ; 0x1a86b2
	db $0, "VIOLET CITY", $51
	db "The City of", $4f
	db "Nostalgic Scents", $57
; 0x1a86dc

UnknownText_0x1a86dc: ; 0x1a86dc
	db $0, "VIOLET CITY", $4f
	db "#MON GYM", $55
	db "LEADER: FALKNER", $51
	db "The Elegant Master", $4f
	db "of Flying #MON", $57
; 0x1a8724

UnknownText_0x1a8724: ; 0x1a8724
	db $0, "SPROUT TOWER", $51
	db "Experience the", $4f
	db "Way of #MON", $57
; 0x1a874d

UnknownText_0x1a874d: ; 0x1a874d
	db $0, "EARL'S #MON", $4f
	db "ACADEMY", $57
; 0x1a8762

VioletCity_MapEventHeader: ; 0x1a8762
	; filler
	db 0, 0

	; warps
	db 9
	warp_def $11, $9, 2, GROUP_VIOLET_MART, MAP_VIOLET_MART
	warp_def $11, $12, 1, GROUP_VIOLET_GYM, MAP_VIOLET_GYM
	warp_def $11, $1e, 1, GROUP_EARLS_POKEMON_ACADEMY, MAP_EARLS_POKEMON_ACADEMY
	warp_def $f, $3, 1, GROUP_VIOLET_NICKNAME_SPEECH_HOUSE, MAP_VIOLET_NICKNAME_SPEECH_HOUSE
	warp_def $19, $1f, 1, GROUP_VIOLET_POKECENTER_1F, MAP_VIOLET_POKECENTER_1F
	warp_def $1d, $15, 1, GROUP_VIOLET_ONIX_TRADE_HOUSE, MAP_VIOLET_ONIX_TRADE_HOUSE
	warp_def $5, $17, 1, GROUP_SPROUT_TOWER_1F, MAP_SPROUT_TOWER_1F
	warp_def $18, $27, 1, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE
	warp_def $19, $27, 2, GROUP_ROUTE_31_VIOLET_GATE, MAP_ROUTE_31_VIOLET_GATE

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 20, 24, $0, MapVioletCitySignpost0Script
	signpost 17, 15, $0, MapVioletCitySignpost1Script
	signpost 8, 24, $0, MapVioletCitySignpost2Script
	signpost 17, 27, $0, MapVioletCitySignpost3Script
	signpost 25, 32, $0, MapVioletCitySignpost4Script
	signpost 17, 10, $0, MapVioletCitySignpost5Script
	signpost 14, 37, $7, MapVioletCitySignpostItem6

	; people-events
	db 8
	person_event $3a, 20, 17, $3, $0, 255, 255, $a0, 0, UnknownScript_0x1a83bb, $06ca
	person_event $28, 32, 32, $2, $22, 255, 255, $a0, 0, UnknownScript_0x1a8403, $ffff
	person_event $2b, 18, 28, $2, $21, 255, 255, $80, 0, UnknownScript_0x1a8406, $ffff
	person_event $2f, 24, 21, $5, $1, 255, 255, $0, 0, UnknownScript_0x1a8409, $ffff
	person_event $27, 22, 9, $3, $0, 255, 255, $a0, 0, UnknownScript_0x1a840c, $ffff
	person_event $5d, 33, 18, $1, $0, 255, 255, $0, 0, UnknownScript_0x1a8425, $ffff
	person_event $54, 5, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a8421, $0643
	person_event $54, 9, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a8423, $0644
; 0x1a8820

