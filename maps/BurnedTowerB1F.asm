BurnedTowerB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18615e, $0000
	dw UnknownScript_0x18615f, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x186160

UnknownScript_0x18615e:
	end

UnknownScript_0x18615f:
	end

UnknownScript_0x186160:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue UnknownScript_0x18616a
	changeblock $6, $e, $2
UnknownScript_0x18616a:
	return

UnknownScript_0x18616b:
	playmusic MUSIC_NONE
	pause 30
	appear $3
	spriteface $0, UP
	pause 5
	disappear $6
	pause 15
	cry RAIKOU
	appear $4
	spriteface $0, UP
	pause 5
	disappear $7
	pause 15
	cry ENTEI
	appear $5
	spriteface $0, UP
	pause 5
	disappear $8
	pause 15
	cry SUICUNE
	pause 15
	playsound SFX_WARP_FROM
	spriteface $0, LEFT
	applymovement $3, MovementData_0x186236
	disappear $3
	waitbutton
	playsound SFX_WARP_FROM
	spriteface $0, RIGHT
	applymovement $4, MovementData_0x18623b
	disappear $4
	waitbutton
	pause 15
	playsound SFX_WARP_FROM
	spriteface $0, UP
	applymovement $5, MovementData_0x186241
	playsound SFX_WARP_FROM
	spriteface $0, DOWN
	applymovement $5, MovementData_0x186248
	spriteface $0, UP
	pause 20
	cry SUICUNE
	pause 30
	playsound SFX_WARP_FROM
	applymovement $5, MovementData_0x186253
	spriteface $0, DOWN
	disappear $5
	waitbutton
	special RestartMapMusic
	dotrigger $1
	setevent EVENT_RELEASED_THE_BEASTS
	special InitRoamMons
	domaptrigger GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM, $1
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $1
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_BURNED_TOWER_1F_EUSINE
	appear $a
	refreshscreen $0
	changeblock $6, $e, $1b
	reloadmappart
	loadmovesprites
	dotrigger $1
	end

SuperNerdScript_0x186212:
	faceplayer
	loadfont
	writetext UnknownText_0x18626a
	closetext
	loadmovesprites
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x186226
	applymovement $a, MovementData_0x186263
	jump UnknownScript_0x18622a

UnknownScript_0x186226:
	applymovement $a, MovementData_0x18625c
UnknownScript_0x18622a:
	disappear $a
	playsound SFX_EXIT_BUILDING
	waitbutton
	end

ItemFragment_0x186231:
	db TM_ENDURE, 1

BurnedTowerB1FBoulder:
	jumpstd strengthboulder

MovementData_0x186236:
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_left
	db $38 ; movement
	step_end

MovementData_0x18623b:
	db $39 ; movement
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_right
	db $38 ; movement
	step_end

MovementData_0x186241:
	db $39 ; movement
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_left
	db $38 ; movement
	step_end

MovementData_0x186248:
	db $39 ; movement
	fast_jump_step_left
	fast_jump_step_up
	big_step_up
	fast_jump_step_right
	db $38 ; movement
	step_end

MovementData_0x18624f:
	db $39 ; movement
	big_step_down
	db $38 ; movement
	step_end

MovementData_0x186253:
	db $39 ; movement
	big_step_up
	fast_jump_step_right
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	db $38 ; movement
	step_end

MovementData_0x18625c:
	step_left
	step_left
	step_down
	step_down
	step_left
	step_down
	step_end

MovementData_0x186263:
	step_down
	step_left
	step_left
	step_left
	step_down
	step_down
	step_end

UnknownText_0x18626a:
	text "EUSINE: I dug a"
	line "hole here, too…"

	para "I was shocked!"

	para "SUICUNE raced by"
	line "like a blur, right"

	para "in front of my"
	line "eyes!"

	para "For ten years I"
	line "chased SUICUNE,"

	para "and I finally got"
	line "to see it."

	para "I'm all choked up!"

	para "<PLAYER>, I owe"
	line "this all to you!"

	para "Thank you!"

	para "I heard that the"
	line "legendary #MON"

	para "of ECRUTEAK test"
	line "chosen humans by"

	para "allowing them to"
	line "get close."

	para "I'm going to track"
	line "SUICUNE."

	para "<PLAYER>, let's"
	line "meet again!"

	para "Farewell!"
	done

BurnedTowerB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $9, $a, 3, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $7, $11, 7, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $8, $a, 9, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $d, $3, 10, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $e, $11, 12, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $f, $7, 14, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F

.XYTriggers:
	db 1
	xy_trigger 0, $6, $a, $0, UnknownScript_0x18616b, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 9
	person_event SPRITE_BOULDER, 12, 21, OW_LEFT | $11, $0, -1, -1, $0, 0, BurnedTowerB1FBoulder, -1
	person_event SPRITE_RAIKOU, 7, 11, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_ENTEI, 7, 16, OW_UP | $12, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_SUICUNE, 8, 14, OW_UP | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_RAIKOU, 7, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_SILVER << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_ENTEI, 7, 16, OW_UP | $2, $0, -1, -1, (PAL_OW_SILVER << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_SUICUNE, 8, 14, OW_UP | $2, $0, -1, -1, (PAL_OW_SILVER << 4) | $80, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_POKE_BALL, 8, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x186231, EVENT_BURNED_TOWER_B1F_TM_ENDURE
	person_event SPRITE_SUPER_NERD, 16, 14, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SuperNerdScript_0x186212, EVENT_EUSINE_IN_BURNED_TOWER
