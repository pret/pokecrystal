const_value set 2
	const BURNEDTOWERB1F_BOULDER
	const BURNEDTOWERB1F_RAIKOU1
	const BURNEDTOWERB1F_ENTEI1
	const BURNEDTOWERB1F_SUICUNE1
	const BURNEDTOWERB1F_RAIKOU2
	const BURNEDTOWERB1F_ENTEI2
	const BURNEDTOWERB1F_SUICUNE2
	const BURNEDTOWERB1F_POKE_BALL
	const BURNEDTOWERB1F_EUSINE

BurnedTowerB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18615e, 0
	dw UnknownScript_0x18615f, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, BurnedTowerB1FLadderCallback

UnknownScript_0x18615e:
	end

UnknownScript_0x18615f:
	end

BurnedTowerB1FLadderCallback:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .NoChange
	changeblock $6, $e, $2
.NoChange:
	return

ReleaseTheBeasts:
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
	applymovement BURNEDTOWERB1F_RAIKOU1, BurnedTowerRaikouMovement
	disappear BURNEDTOWERB1F_RAIKOU1
	waitsfx
	playsound SFX_WARP_FROM
	spriteface PLAYER, RIGHT
	applymovement BURNEDTOWERB1F_ENTEI1, BurnedTowerEnteiMovement
	disappear BURNEDTOWERB1F_ENTEI1
	waitsfx
	pause 15
	playsound SFX_WARP_FROM
	spriteface PLAYER, UP
	applymovement BURNEDTOWERB1F_SUICUNE1, BurnedTowerSuicuneMovement1
	playsound SFX_WARP_FROM
	spriteface PLAYER, DOWN
	applymovement BURNEDTOWERB1F_SUICUNE1, BurnedTowerSuicuneMovement2
	spriteface PLAYER, UP
	pause 20
	cry SUICUNE
	pause 30
	playsound SFX_WARP_FROM
	applymovement BURNEDTOWERB1F_SUICUNE1, BurnedTowerSuicuneMovement3
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
	appear BURNEDTOWERB1F_EUSINE
	refreshscreen $0
	changeblock $6, $e, $1b
	reloadmappart
	closetext
	dotrigger $1
	end

BurnedTowerB1FEusine:
	faceplayer
	opentext
	writetext BurnedTowerB1FEusineText
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal $1, .Movement
	applymovement BURNEDTOWERB1F_EUSINE, BurnedTowerB1FEusineMovement1
	jump UnknownScript_0x18622a

.Movement:
	applymovement BURNEDTOWERB1F_EUSINE, BurnedTowerB1FEusineMovement2
UnknownScript_0x18622a:
	disappear BURNEDTOWERB1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

BurnedTowerB1FTMEndure:
	itemball TM_ENDURE

BurnedTowerB1FBoulder:
	jumpstd strengthboulder

BurnedTowerRaikouMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	remove_sliding
	step_end

BurnedTowerEnteiMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

BurnedTowerSuicuneMovement1:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step LEFT
	remove_sliding
	step_end

BurnedTowerSuicuneMovement2:
	set_sliding
	fast_jump_step LEFT
	fast_jump_step UP
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

MovementData_0x18624f:
	set_sliding
	big_step DOWN
	remove_sliding
	step_end

BurnedTowerSuicuneMovement3:
	set_sliding
	big_step UP
	fast_jump_step RIGHT
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	remove_sliding
	step_end

BurnedTowerB1FEusineMovement2:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_end

BurnedTowerB1FEusineMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

BurnedTowerB1FEusineText:
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
	xy_trigger 0, $6, $a, $0, ReleaseTheBeasts, $0, $0

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
	person_event SPRITE_SUPER_NERD, 12, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BurnedTowerB1FEusine, EVENT_EUSINE_IN_BURNED_TOWER
