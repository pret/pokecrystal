VioletCity_MapScriptHeader: ; 0x1a83b2
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a83b7
; 0x1a83b7

UnknownScript_0x1a83b7: ; 0x1a83b7
	setflag $0043
	return
; 0x1a83bb

FisherScript_0x1a83bb: ; 0x1a83bb
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
	playmusic MUSIC_SHOW_ME_AROUND
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
	playsound SFX_ENTER_DOOR
	disappear $2
	clearevent $06cb
	waitbutton
	end
; 0x1a8403

LassScript_0x1a8403: ; 0x1a8403
	jumptextfaceplayer UnknownText_0x1a8529
; 0x1a8406

SuperNerdScript_0x1a8406: ; 0x1a8406
	jumptextfaceplayer UnknownText_0x1a8593
; 0x1a8409

GrampsScript_0x1a8409: ; 0x1a8409
	jumptextfaceplayer UnknownText_0x1a85ef
; 0x1a840c

YoungsterScript_0x1a840c: ; 0x1a840c
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

FruitTreeScript_0x1a8425: ; 0x1a8425
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
	text "Hello!"
	line "You are trainer?"

	para "Battle GYM LEADER,"
	line "win you did?"
	done
; 0x1a84ac

UnknownText_0x1a84ac: ; 0x1a84ac
	text "Ooh, la la!"
	line "Very indeed nice!"
	done
; 0x1a84cb

UnknownText_0x1a84cb: ; 0x1a84cb
	text "Is that so? Then"
	line "study shall you!"
	cont "Follow me!"
	done
; 0x1a84f9

UnknownText_0x1a84f9: ; 0x1a84f9
	text "Here, teacher I"
	line "am. Good it is"
	cont "you study here!"
	done
; 0x1a8529

UnknownText_0x1a8529: ; 0x1a8529
	text "Ghosts are rumored"
	line "to appear in"
	cont "SPROUT TOWER."

	para "They said normal-"
	line "type #MON moves"

	para "had no effect on"
	line "ghosts."
	done
; 0x1a8593

UnknownText_0x1a8593: ; 0x1a8593
	text "Hey, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you'll be ready"
	line "for prime time!"
	done
; 0x1a85ef

UnknownText_0x1a85ef: ; 0x1a85ef
	text "FALKNER, from the"
	line "VIOLET #MON"

	para "GYM, is a fine"
	line "trainer!"

	para "He inherited his"
	line "father's gym and"

	para "has done a great"
	line "job with it."
	done
; 0x1a8665

UnknownText_0x1a8665: ; 0x1a8665
	text "I saw a wiggly"
	line "tree up ahead!"

	para "If you touch it,"
	line "it squirms and"
	cont "dances! Cool!"
	done
; 0x1a86b2

UnknownText_0x1a86b2: ; 0x1a86b2
	text "VIOLET CITY"

	para "The City of"
	line "Nostalgic Scents"
	done
; 0x1a86dc

UnknownText_0x1a86dc: ; 0x1a86dc
	text "VIOLET CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done
; 0x1a8724

UnknownText_0x1a8724: ; 0x1a8724
	text "SPROUT TOWER"

	para "Experience the"
	line "Way of #MON"
	done
; 0x1a874d

UnknownText_0x1a874d: ; 0x1a874d
	text "EARL'S #MON"
	line "ACADEMY"
	done
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
	person_event SPRITE_FISHER, 20, 17, $3, $0, 255, 255, $a0, 0, FisherScript_0x1a83bb, $06ca
	person_event SPRITE_LASS, 32, 32, $2, $22, 255, 255, $a0, 0, LassScript_0x1a8403, $ffff
	person_event SPRITE_SUPER_NERD, 18, 28, $2, $21, 255, 255, $80, 0, SuperNerdScript_0x1a8406, $ffff
	person_event SPRITE_GRAMPS, 24, 21, $5, $1, 255, 255, $0, 0, GrampsScript_0x1a8409, $ffff
	person_event SPRITE_YOUNGSTER, 22, 9, $3, $0, 255, 255, $a0, 0, YoungsterScript_0x1a840c, $ffff
	person_event SPRITE_FRUIT_TREE, 33, 18, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a8425, $ffff
	person_event SPRITE_POKE_BALL, 5, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a8421, $0643
	person_event SPRITE_POKE_BALL, 9, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a8423, $0644
; 0x1a8820

