const_value set 2
	const BURNEDTOWERB1F_BOULDER
	const BURNEDTOWERB1F_RAIKOU1
	const BURNEDTOWERB1F_ENTEI1
	const BURNEDTOWERB1F_SUICUNE1
	const BURNEDTOWERB1F_RAIKOU2
	const BURNEDTOWERB1F_ENTEI2
	const BURNEDTOWERB1F_SUICUNE2
	const BURNEDTOWERB1F_POKE_BALL
	const BURNEDTOWERB1F_SUPER_NERD

BurnedTowerB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18615e, 0
	dw UnknownScript_0x18615f, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x186160

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
	appear BURNEDTOWERB1F_RAIKOU1
	spriteface PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_RAIKOU2
	pause 15
	cry RAIKOU
	appear BURNEDTOWERB1F_ENTEI1
	spriteface PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_ENTEI2
	pause 15
	cry ENTEI
	appear BURNEDTOWERB1F_SUICUNE1
	spriteface PLAYER, UP
	pause 5
	disappear BURNEDTOWERB1F_SUICUNE2
	pause 15
	cry SUICUNE
	pause 15
	playsound SFX_WARP_FROM
	spriteface PLAYER, LEFT
	applymovement BURNEDTOWERB1F_RAIKOU1, MovementData_0x186236
	disappear BURNEDTOWERB1F_RAIKOU1
	waitsfx
	playsound SFX_WARP_FROM
	spriteface PLAYER, RIGHT
	applymovement BURNEDTOWERB1F_ENTEI1, MovementData_0x18623b
	disappear BURNEDTOWERB1F_ENTEI1
	waitsfx
	pause 15
	playsound SFX_WARP_FROM
	spriteface PLAYER, UP
	applymovement BURNEDTOWERB1F_SUICUNE1, MovementData_0x186241
	playsound SFX_WARP_FROM
	spriteface PLAYER, DOWN
	applymovement BURNEDTOWERB1F_SUICUNE1, MovementData_0x186248
	spriteface PLAYER, UP
	pause 20
	cry SUICUNE
	pause 30
	playsound SFX_WARP_FROM
	applymovement BURNEDTOWERB1F_SUICUNE1, MovementData_0x186253
	spriteface PLAYER, DOWN
	disappear BURNEDTOWERB1F_SUICUNE1
	waitsfx
	special RestartMapMusic
	dotrigger $1
	setevent EVENT_RELEASED_THE_BEASTS
	special InitRoamMons
	domaptrigger ECRUTEAK_GYM, $1
	domaptrigger CIANWOOD_CITY, $1
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_ECRUTEAK_GYM_GRAMPS
	clearevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_BURNED_TOWER_MORTY
	setevent EVENT_BURNED_TOWER_1F_EUSINE
	appear BURNEDTOWERB1F_SUPER_NERD
	refreshscreen $0
	changeblock $6, $e, $1b
	reloadmappart
	closetext
	dotrigger $1
	end

SuperNerdScript_0x186212:
	faceplayer
	opentext
	writetext UnknownText_0x18626a
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x186226
	applymovement BURNEDTOWERB1F_SUPER_NERD, MovementData_0x186263
	jump UnknownScript_0x18622a

UnknownScript_0x186226:
	applymovement BURNEDTOWERB1F_SUPER_NERD, MovementData_0x18625c
UnknownScript_0x18622a:
	disappear BURNEDTOWERB1F_SUPER_NERD
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

BurnedTowerB1FTMEndure:
	itemball TM_ENDURE

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
	warp_def $9, $a, 3, BURNED_TOWER_1F
	warp_def $7, $11, 7, BURNED_TOWER_1F
	warp_def $8, $a, 9, BURNED_TOWER_1F
	warp_def $d, $3, 10, BURNED_TOWER_1F
	warp_def $e, $11, 12, BURNED_TOWER_1F
	warp_def $f, $7, 14, BURNED_TOWER_1F

.XYTriggers:
	db 1
	xy_trigger 0, $6, $a, $0, UnknownScript_0x18616b, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 9
	person_event SPRITE_BOULDER, 8, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BurnedTowerB1FBoulder, -1
	person_event SPRITE_RAIKOU, 3, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_ENTEI, 3, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_SUICUNE, 4, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_1
	person_event SPRITE_RAIKOU, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_ENTEI, 3, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_SUICUNE, 4, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BURNED_TOWER_B1F_BEASTS_2
	person_event SPRITE_POKE_BALL, 4, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, BurnedTowerB1FTMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE
	person_event SPRITE_SUPER_NERD, 12, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x186212, EVENT_EUSINE_IN_BURNED_TOWER
