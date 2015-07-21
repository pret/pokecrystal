VioletCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_VIOLET
	return

FisherScript_0x1a83bb:
	applymovement $2, MovementData_0x1a8465
	faceplayer
	loadfont
	writetext UnknownText_0x1a8473
	yesorno
	iffalse UnknownScript_0x1a83d1
	jump UnknownScript_0x1a83cb

UnknownScript_0x1a83cb:
	writetext UnknownText_0x1a84ac
	closetext
	loadmovesprites
	end

UnknownScript_0x1a83d1:
	writetext UnknownText_0x1a84cb
	closetext
	loadmovesprites
	playmusic MUSIC_SHOW_ME_AROUND
	follow $2, $0
	applymovement $2, MovementData_0x1a842a
	spriteface $0, UP
	applymovement $2, MovementData_0x1a8465
	stopfollow
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x1a84f9
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1a8465
	applymovement $2, MovementData_0x1a8463
	playsound SFX_ENTER_DOOR
	disappear $2
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitbutton
	end

LassScript_0x1a8403:
	jumptextfaceplayer UnknownText_0x1a8529

SuperNerdScript_0x1a8406:
	jumptextfaceplayer UnknownText_0x1a8593

GrampsScript_0x1a8409:
	jumptextfaceplayer UnknownText_0x1a85ef

YoungsterScript_0x1a840c:
	jumptextfaceplayer UnknownText_0x1a8665

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokeCenterSign:
	jumpstd pokecentersign

VioletCityMartSign:
	jumpstd martsign

ItemFragment_0x1a8421:
	db PP_UP, 1

ItemFragment_0x1a8423:
	db RARE_CANDY, 1

FruitTreeScript_0x1a8425:
	fruittree $9

MapVioletCitySignpostItem6:
	dwb EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION, HYPER_POTION

MovementData_0x1a842a:
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

MovementData_0x1a8463:
	step_up
	step_end

MovementData_0x1a8465:
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

UnknownText_0x1a8473:
	text "Hello!"
	line "You are trainer?"

	para "Battle GYM LEADER,"
	line "win you did?"
	done

UnknownText_0x1a84ac:
	text "Ooh, la la!"
	line "Very indeed nice!"
	done

UnknownText_0x1a84cb:
	text "Is that so? Then"
	line "study shall you!"
	cont "Follow me!"
	done

UnknownText_0x1a84f9:
	text "Here, teacher I"
	line "am. Good it is"
	cont "you study here!"
	done

UnknownText_0x1a8529:
	text "Ghosts are rumored"
	line "to appear in"
	cont "SPROUT TOWER."

	para "They said normal-"
	line "type #MON moves"

	para "had no effect on"
	line "ghosts."
	done

UnknownText_0x1a8593:
	text "Hey, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you'll be ready"
	line "for prime time!"
	done

UnknownText_0x1a85ef:
	text "FALKNER, from the"
	line "VIOLET #MON"

	para "GYM, is a fine"
	line "trainer!"

	para "He inherited his"
	line "father's gym and"

	para "has done a great"
	line "job with it."
	done

UnknownText_0x1a8665:
	text "I saw a wiggly"
	line "tree up ahead!"

	para "If you touch it,"
	line "it squirms and"
	cont "dances! Cool!"
	done

VioletCitySignText:
	text "VIOLET CITY"

	para "The City of"
	line "Nostalgic Scents"
	done

VioletGymSignText:
	text "VIOLET CITY"
	line "#MON GYM"
	cont "LEADER: FALKNER"

	para "The Elegant Master"
	line "of Flying #MON"
	done

SproutTowerSignText:
	text "SPROUT TOWER"

	para "Experience the"
	line "Way of #MON"
	done

EarlsPokemonAcademySignText:
	text "EARL'S #MON"
	line "ACADEMY"
	done

VioletCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
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

.XYTriggers:
	db 0

.Signposts:
	db 7
	signpost 20, 24, SIGNPOST_READ, VioletCitySign
	signpost 17, 15, SIGNPOST_READ, VioletGymSign
	signpost 8, 24, SIGNPOST_READ, SproutTowerSign
	signpost 17, 27, SIGNPOST_READ, EarlsPokemonAcademySign
	signpost 25, 32, SIGNPOST_READ, VioletCityPokeCenterSign
	signpost 17, 10, SIGNPOST_READ, VioletCityMartSign
	signpost 14, 37, SIGNPOST_ITEM, MapVioletCitySignpostItem6

.PersonEvents:
	db 8
	person_event SPRITE_FISHER, 20, 17, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x1a83bb, EVENT_VIOLET_CITY_EARL
	person_event SPRITE_LASS, 32, 32, OW_DOWN | $2, $22, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x1a8403, -1
	person_event SPRITE_SUPER_NERD, 18, 28, OW_DOWN | $2, $21, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x1a8406, -1
	person_event SPRITE_GRAMPS, 24, 21, OW_UP | $1, $1, -1, -1, $0, 0, GrampsScript_0x1a8409, -1
	person_event SPRITE_YOUNGSTER, 22, 9, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, YoungsterScript_0x1a840c, -1
	person_event SPRITE_FRUIT_TREE, 33, 18, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a8425, -1
	person_event SPRITE_POKE_BALL, 5, 8, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a8421, EVENT_VIOLET_CITY_PP_UP
	person_event SPRITE_POKE_BALL, 9, 39, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a8423, EVENT_VIOLET_CITY_RARE_CANDY
