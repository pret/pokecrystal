const_value set 2
	const MOUNTMOONSQUARE_FAIRY1
	const MOUNTMOONSQUARE_FAIRY2
	const MOUNTMOONSQUARE_ROCK

MountMoonSquare_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x77092, 0

.MapCallbacks:
	db 2

	; callbacks

	dbw 5, UnknownScript_0x77093

	dbw 2, UnknownScript_0x77097

UnknownScript_0x77092:
	end

UnknownScript_0x77093:
	setevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE 
	return

UnknownScript_0x77097:
	disappear MOUNTMOONSQUARE_ROCK
	return

UnknownScript_0x7709a:
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .NoDancing
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, .NoDancing
	checknite
	iffalse .NoDancing
	appear MOUNTMOONSQUARE_FAIRY1
	appear MOUNTMOONSQUARE_FAIRY2
	applymovement PLAYER, MovementData_0x77121
	pause 15
	appear MOUNTMOONSQUARE_ROCK
	spriteface MOUNTMOONSQUARE_FAIRY1, RIGHT
	cry CLEFAIRY
	waitsfx
	pause 30
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77123
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77126
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77128
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x7712b
	cry CLEFAIRY
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x7712d
	stopfollow
	applymovement MOUNTMOONSQUARE_FAIRY2, MovementData_0x77130
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77132
	stopfollow
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
	pause 10
	showemote EMOTE_SHOCK, MOUNTMOONSQUARE_FAIRY1, 15
	spriteface MOUNTMOONSQUARE_FAIRY1, DOWN
	cry CLEFAIRY
	pause 15
	follow MOUNTMOONSQUARE_FAIRY1, MOUNTMOONSQUARE_FAIRY2
	applymovement MOUNTMOONSQUARE_FAIRY1, MovementData_0x77134
	disappear MOUNTMOONSQUARE_FAIRY1
	disappear MOUNTMOONSQUARE_FAIRY2
	stopfollow
	clearevent EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	end

.NoDancing:
	end

MountMoonSquareHiddenMoonStone:
	dwb EVENT_MOUNT_MOON_SQUARE_HIDDEN_MOON_STONE, MOON_STONE
	

MapMountMoonSquareSignpost1Script:
	jumptext UnknownText_0x7713b

MtMoonSquareRock:
	jumpstd smashrock

MovementData_0x77121:
	step_up
	step_end

MovementData_0x77123:
	slow_step_down
	slow_jump_step_down
	step_end

MovementData_0x77126:
	slow_jump_step_right
	step_end

MovementData_0x77128:
	slow_step_up
	slow_jump_step_up
	step_end

MovementData_0x7712b:
	slow_jump_step_left
	step_end

MovementData_0x7712d:
	slow_step_down
	slow_jump_step_down
	step_end

MovementData_0x77130:
	slow_step_down
	step_end

MovementData_0x77132:
	slow_step_right
	step_end

MovementData_0x77134:
	step_right
	step_right
	step_right
	jump_step_right
	step_right
	step_right
	step_end

UnknownText_0x7713b:
	text "MT.MOON SQUARE"
	line "DON'T LITTER"
	done

MountMoonSquare_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $14, 5, MOUNT_MOON
	warp_def $b, $16, 6, MOUNT_MOON
	warp_def $7, $d, 1, MOUNT_MOON_GIFT_SHOP

.XYTriggers:
	db 1
	xy_trigger 0, $b, $7, $0, UnknownScript_0x7709a, $0, $0

.Signposts:
	db 2
	signpost 7, 7, SIGNPOST_ITEM, MountMoonSquareHiddenMoonStone
	signpost 7, 17, SIGNPOST_READ, MapMountMoonSquareSignpost1Script

.PersonEvents:
	db 3
	person_event SPRITE_FAIRY, 6, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	person_event SPRITE_FAIRY, 6, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_SQUARE_CLEFAIRY
	person_event SPRITE_ROCK, 7, 7, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MtMoonSquareRock, EVENT_MT_MOON_SQUARE_ROCK
